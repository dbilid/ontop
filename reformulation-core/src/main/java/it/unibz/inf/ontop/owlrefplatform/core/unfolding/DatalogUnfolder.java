package it.unibz.inf.ontop.owlrefplatform.core.unfolding;

/*
 * #%L
 * ontop-reformulation-core
 * %%
 * Copyright (C) 2009 - 2014 Free University of Bozen-Bolzano
 * %%
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * #L%
 */

import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import it.unibz.inf.ontop.model.*;
import it.unibz.inf.ontop.model.Predicate.COL_TYPE;
import it.unibz.inf.ontop.model.impl.OBDADataFactoryImpl;
import it.unibz.inf.ontop.model.impl.OBDAVocabulary;
import it.unibz.inf.ontop.model.impl.TermUtils;
import it.unibz.inf.ontop.owlrefplatform.core.basicoperations.*;
import it.unibz.inf.ontop.owlrefplatform.core.unionhandler.Node;
import it.unibz.inf.ontop.owlrefplatform.core.unionhandler.NodeAtomReplacement;
import it.unibz.inf.ontop.owlrefplatform.core.unionhandler.PredEntry;
import it.unibz.inf.ontop.owlrefplatform.core.unionhandler.SequenceInfo;
import it.unibz.inf.ontop.owlrefplatform.core.unionhandler.UnionInfo;
import it.unibz.inf.ontop.owlrefplatform.core.unionhandler.UnionPair;
import it.unibz.inf.ontop.owlrefplatform.core.unionhandler.UnionSet;
import it.unibz.inf.ontop.owlrefplatform.duplicateelimination.DuplicateEstimator;
import madgik.analyzer.decomposer.util.Util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.*;

/**
 * Generates partial evaluations of rules (the queries), with respect to a set
 * of (partial) facts (set of rules). The procedure uses extended resolution
 * such that inner terms are also evaluated.
 * 
 * <p/>
 * The input fact rules must be non-cyclic otherwise the procedures in this
 * class will not terminate.
 * 
 * @author mariano
 */
public class DatalogUnfolder {

	private static final OBDADataFactory termFactory = OBDADataFactoryImpl.getInstance();

	private static final Logger log = LoggerFactory.getLogger(DatalogUnfolder.class);

	private final Multimap<Predicate, List<Integer>> primaryKeys;

	private final Map<Predicate, List<Integer>> notNulls;

	private final Map<Predicate, List<CQIE>> ruleIndex = new LinkedHashMap<>();
	
	private final Map<CQIE, Integer> mappingIDIndex;
	
	private final Map<Predicate, Integer> tMappingIDIndex;

	/***
	 * Leaf predicates are those that do not appear in the head of any rule. If a
	 * predicate is a leaf predicate, it should not be unfolded, they indicate stop
	 * points to get partial evaluations.
	 * <p>
	 * Any atom that is not a leaf, and that cannot be unified with a rule (either
	 * cause of lack of MGU, or because of a rule for the predicate of the atom) is
	 * logically empty w.r.t. to the program.
	 */
	private final Set<Predicate> extensionalPredicates = new HashSet<>();

	// LeftJoinUnfoldingTest only

	public DatalogUnfolder(List<CQIE> unfoldingProgram) {
		this(unfoldingProgram, HashMultimap.<Predicate, List<Integer>>create(),
				new HashMap<Predicate, List<Integer>>());
	}

	// QuestUnfilder only

	public DatalogUnfolder(List<CQIE> unfoldingProgram, Multimap<Predicate, List<Integer>> primaryKeys,
			Map<Predicate, List<Integer>> notNulls) {

		this.primaryKeys = primaryKeys;
		this.notNulls = notNulls;
		mappingIDIndex=new HashMap<CQIE, Integer>(unfoldingProgram.size());
		tMappingIDIndex=new HashMap<Predicate, Integer>();
		int id=1;
		int tId=-1;
		// Creating a local index for the rules according to their predicate
		for (CQIE mappingrule : unfoldingProgram) {
			mappingIDIndex.put(mappingrule, id++);
			Function head = mappingrule.getHead();

			List<CQIE> rules = ruleIndex.get(head.getFunctionSymbol());
			if (rules == null) {
				tMappingIDIndex.put(head.getFunctionSymbol(), tId--);
				rules = new LinkedList<>();
				ruleIndex.put(head.getFunctionSymbol(), rules);
			}
			rules.add(mappingrule);

			// Collecting the predicates that appear in the body of rules
			// (first in extensionalPredicates, then we will remove all defined
			// (intensional)
			for (Function atom : mappingrule.getBody())
				collectPredicates(extensionalPredicates, atom);
		}

		// the predicates that do not appear in the head of rules are leaf
		// predicates
		extensionalPredicates.removeAll(ruleIndex.keySet());
	}

	private final void collectPredicates(Set<Predicate> predicates, Function atom) {
		if (atom.isAlgebraFunction()) {
			for (Term innerTerm : atom.getTerms())
				if (innerTerm instanceof Function)
					collectPredicates(predicates, (Function) innerTerm);
		} else if (!(atom.isOperation())) {
			Predicate pred = atom.getFunctionSymbol();
			predicates.add(pred);
		}
	}

	/***
	 * Given a query q and the {@link #unfoldingProgram}, this method will try to
	 * flatten the query as much as possible by applying resolution steps
	 * exhaustively to every atom in the query against the rules in
	 * 'unfoldingProgram'. This will is exactly to computing a partial evaluation of
	 * q w.r.t. unfolding program, that is, a specialized version of q w.r.t. to
	 * unfolding program that requires less steps to execute.
	 * <p>
	 * This is used to translate ontological queries to database queries in the when
	 * the unfolding program is a set of mapppings, and also to flatten the Datalog
	 * queries that are produced by the {@link SparqlAlgebraToDatalogTranslator} and
	 * in some other places.
	 * 
	 * <p>
	 * Example: matching rule the unfolding program.
	 * <p>
	 * Unfolding Program<br>
	 * <br>
	 * A(x) :- table1(x,y)<br>
	 * A(x) :- table2(x,z)<br>
	 * B(x) :- table3(x,z)<br>
	 * <br>
	 * Query<br>
	 * <br>
	 * Q(x) :- A(x),B(x)<br>
	 * <br>
	 * Initially produces: <br>
	 * Q(x1) :- table1(x1,y1),B(x1)<br>
	 * Q(x1) :- table2(x1,z1),B(x1)<br>
	 * Q(x1) :- table1(x1,y1),table3(x1,z2)<br>
	 * Q(x1) :- table2(x1,z1),table3(x1,z2)<br>
	 * 
	 * But the final result is<br>
	 * Q(x1) :- table1(x1,y1),table3(x1,z2)<br>
	 * Q(x1) :- table2(x1,z1),table3(x1,z2)<br>
	 * 
	 * 
	 * <p>
	 * The strategy of this unfolding is simple, we cycle through all the queries
	 * and attempt to resolve atom 0 in the body against the rules in unfolding
	 * program. The resolution engine will generate 1 or more CQs as result. The
	 * original atom is removed, and the results are appended to the end of each
	 * query (hence its always safe to unfold atom 0). The new queries are kept for
	 * a next cycle. We stop when no new queries are produced.
	 * <p>
	 * The right side of left joins will never be touched.
	 * <p>
	 * Currently the method also is aware of functional dependencies (Primary keys)
	 * and will produce queries in which redundant joins w.r.t. to these are
	 * avoided.
	 * 
	 * @param inputquery
	 * @return
	 */

	/***
	 * Generates a partial evaluation of the rules in <b>inputquery</b> with respect
	 * to the with respect to the program given when this unfolder was initialized.
	 * The goal for this partial evaluation is the predicate <b>ans1</b>
	 * 
	 */
	public DatalogProgram unfold(DatalogProgram inputquery) {
		Map<Long, Node> idToCQs=new HashMap<Long, Node>();
		List<CQIE> workingSet = new LinkedList<>();
		for (CQIE query : inputquery.getRules())
			workingSet.add(query.clone());

		for (CQIE query : workingSet)
			EQNormalizer.enforceEqualities(query);
		
		computePartialEvaluation(workingSet, idToCQs);

		// We need to enforce equality again, because at this point it is
		// possible that there is still some EQ(...)
		for (CQIE query : workingSet) {
			EQNormalizer.enforceEqualities(query);
			UniqueConstraintOptimizer.selfJoinElimination(query, primaryKeys);
			long start = System.currentTimeMillis();
			UniqueConstraintOptimizer.coveredJoinElimination(query, notNulls);
			System.out.println("covered join elimination in " + (System.currentTimeMillis() - start) + " ms.");
		}

		DatalogProgram result = termFactory.getDatalogProgram(inputquery.getQueryModifiers());
		result.appendRule(workingSet);

		return result;
	}

	// /***
	// * Unfolds the atom in position pos. The procedure will remove the atom in
	// * pos from the query, an for each rule in the unfoldingProgram that
	// matches
	// * the predicate of the atom, it will generate a new query in which the
	// body
	// * of the matching rule is appended to the input CQIE.
	// * <p/>
	// * Optimization, this method will use the Primary keys of the DB
	// predicates
	// * as follows: Given a primary Key on A, on columns 1,2, and an atom
	// * A(x,y,z) added by the resolution engine (always added at the end of the
	// * CQ body), we will look for other atom A(x,y,z') if the atom exists, we
	// * can unify both atoms, apply the MGU to the query and remove one of the
	// * atoms.
	// *
	// * <p/>
	// * If there is no rule that can be used to unfold the atom it will return
	// an
	// * empty list.
	// *
	// *
	// * @param pos
	// * @param currentQuery
	// * @return
	// */
	// private List<CQIE> unfoldAtom(int pos, CQIE currentQuery, int count) {
	// LinkedList<CQIE> partialEvaluations = new LinkedList<CQIE>();
	//
	// if (pos >= currentQuery.getBody().size())
	// return partialEvaluations;
	//
	// /* Do not unfold operator atoms */
	// Function atom = (Function) currentQuery.getBody().get(pos);
	//
	// // if (atom.getPredicate() instanceof OperationPredicate) {
	// // currentQuery.getBody().remove(pos);
	// // currentQuery.getBody().add(atom);
	// // partialEvaluations.add(currentQuery);
	// // return partialEvaluations;
	// // }
	//
	// Predicate atomPredicate = atom.getPredicate();
	//
	// String name = atomPredicate.getName().toString();
	// if (atomPredicate.equals(OBDAVocabulary.SPARQL_JOIN)) {
	// /*
	// * This is a nested atom, we need to handle it using the
	// */
	// partialEvaluations = unfoldNestedJoin(pos, currentQuery, count);
	//
	// } else if (atomPredicate.equals(OBDAVocabulary.SPARQL_LEFTJOIN_URI)) {
	//
	// } else {
	//
	// /*
	// * This is the normal case where there is no nesting and we resolve
	// * an atom with normal resolution steps
	// */
	//
	// List<CQIE> ruleList = unfoldingProgram.getRules(atomPredicate);
	//
	// for (CQIE mappingRule : ruleList) {
	// CQIE freshMappingRule = getFreshRule(mappingRule, count);
	//
	// CQIE pev = resolutionEngine.resolve(freshMappingRule,
	// currentQuery, pos);
	//
	// if (pev != null) {
	//
	// /*
	// * The following blocks eliminate redundant atoms w.r.t.
	// * query containment by doing syntactic checks on the atoms.
	// * This saves us from requiring full CQC checks. They are a
	// * bit hacky, and they change the cardinality of
	// * non-distinct queries.
	// */
	//
	// List<Function> newbody = pev.getBody();
	// int newatomcount = mappingRule.getBody().size();
	// int oldatoms = newbody.size() - newatomcount - 1;
	// for (int newatomidx = oldatoms + 1; newatomidx < newbody
	// .size(); newatomidx++) {
	// Function newatom = newbody.get(newatomidx);
	// if (newatom.getPredicate() instanceof BooleanOperationPredicate)
	// continue;
	//
	// /*
	// * OPTIMIZATION 1: PRIMARY KEYS
	// *
	// * We now take into account Primary Key constraints on
	// * the database to avoid adding redundant atoms to the
	// * query. This could also be done as an afterstep, using
	// * unification and CQC checks, however, its is much more
	// * expensive that way.
	// */
	//
	// /*
	// * Given a primary Key on A, on columns 1,2, and an atom
	// * A(x,y,z) added by the resolution engine (always added
	// * at the end of the CQ body), we will look for other
	// * atom A(x,y,z') if the atom exists, we can unify both
	// * atoms, apply the MGU to the query and remove one of
	// * the atoms.
	// */
	//
	// List<Integer> pkey = primaryKeys.get(newatom
	// .getPredicate());
	// if (pkey != null && !pkey.isEmpty()) {
	// /*
	// * the predicate has a primary key, looking for
	// * candidates for unification, when we find one we
	// * can stop, since the application of this
	// * optimization at each step of the derivation tree
	// * guarantees there wont be any other redundant
	// * atom.
	// */
	// Function replacement = null;
	//
	// Map<Variable, NewLiteral> mgu = null;
	// for (int idx2 = 0; idx2 <= oldatoms; idx2++) {
	// Function tempatom = newbody.get(idx2);
	//
	// if (tempatom.getPredicate().equals(
	// newatom.getPredicate())) {
	//
	// boolean redundant = true;
	// for (Integer termidx : pkey) {
	// if (!newatom.getTerm(termidx - 1)
	// .equals(tempatom
	// .getTerm(termidx - 1))) {
	// redundant = false;
	// break;
	// }
	// }
	// if (redundant) {
	// /* found a candidate replacement atom */
	// mgu = Unifier.getMGU(newatom, tempatom);
	// if (mgu != null) {
	// replacement = tempatom;
	// break;
	// }
	// }
	//
	// }
	// }
	//
	// if (replacement != null) {
	//
	// if (mgu == null)
	// throw new RuntimeException(
	// "Unexcpected case found while performing JOIN elimination. Contact the
	// authors for debugging.");
	// pev = Unifier.applySubstitution(pev, mgu);
	// newbody = pev.getBody();
	// newbody.remove(newatomidx);
	// newatomidx -= 1;
	// continue;
	// }
	// }
	//
	// /*
	// * We remove all atoms that do not impose extra
	// * conditions on existing data. These are atoms that are
	// * implied by other atoms, and only check for the
	// * existance of data. They are redundant because there
	// * exists another atom that guarnatees satisfiabiliy of
	// * this atom. E.g.,
	// */
	//
	// // Function replacement = null;
	// // Map<Variable,Integer> variableCount =
	// // pev.getVariableCount();
	// //
	// // Map<Variable, Term> mgu = null;
	// // for (int idx2 = 0; idx2 <= oldatoms; idx2++) {
	// // Function tempatom = newbody.get(idx2);
	// //
	// // if
	// // (tempatom.getPredicate().equals(newatom.getPredicate()))
	// // {
	// //
	// // /*
	// // * Checking if all terms are the same, or if they
	// // * are different, the all variables in the current
	// // * atom are free variables (they do not appear
	// // anywhere
	// // else)
	// // */
	// // int termindex = 0;
	// // boolean redundant = true;
	// // for (termindex = 0; termindex <
	// // tempatom.getTerms().size(); termindex++) {
	// // Term currenTerm = newatom.getTerm(termindex);
	// // if (!currenTerm.equals(tempatom.getTerm(termindex))
	// // &&
	// // !(variableCount.get(currenTerm) == 1))
	// // {
	// // redundant = false;
	// // break;
	// // }
	// // }
	// //
	// // if (redundant) {
	// // /* found a candidate replacement atom */
	// // mgu = Unifier.getMGU(newatom, tempatom);
	// // if (mgu != null) {
	// // replacement = tempatom;
	// // break;
	// // }
	// // }
	// //
	// // }
	// // }
	// //
	// // if (replacement != null) {
	// //
	// // if (mgu == null)
	// // throw new RuntimeException(
	// //
	// "Unexcpected case found while performing JOIN elimination. Contact the
	// authors for debugging.");
	// // pev = Unifier.applySubstitution(pev, mgu);
	// // newbody = pev.getBody();
	// // newbody.remove(newatomidx);
	// // newatomidx -= 1;
	// // continue;
	// // }
	//
	// /*
	// * We remove all atoms that do not impose extra
	// * conditions on existing data. These are atoms that are
	// * implied by other atoms, and only check for the
	// * existance of data. They are redundant because there
	// * exists another atom that guarnatees satisfiabiliy of
	// * this atom. E.g.,
	// *
	// * b1 = r(x,y,z), r(m,n,o) b1 = r(x,y,z), r(x,n,o) b1 =
	// * r(x,y,z), r(x,y,o)
	// *
	// * In all these bodies, the second atoms is redundant
	// * w.r.t. set semantics. Note that with bag semantics,
	// * removing the atoms changes the cardinality of the
	// * query. E.g., let the data for r be:
	// *
	// * r(1,2,3), r(4,5,6), r(1,7,8).
	// *
	// * Then we have that |b1| = 9, |b2| = 5 and |b3| = 3.
	// * However, since the current implementation of the
	// * system is relaxed w.r.t. count of non-distinct values
	// * (it will probably stay like that), we dont care and
	// * we can remove these atoms.
	// *
	// * The condition is, given 2 atoms A, B, freeze B, and
	// * try to unify A,B, if true, then B is redundant,
	// * eliminate, else non redundant.
	// */
	//
	// // boolean redundant = false;
	// // List<Function> body = pev.getBody();
	// // Map<Variable, Term> mgu = null;
	// // for (int idx2 = 0; idx2 <= oldatoms; idx2++) {
	// //
	// // Function atom2 = body.get(idx2);
	// // Function frozenAtom = atom2.clone();
	// // CQCUtilities.getCanonicalAtom(frozenAtom, 1, new
	// // HashMap<Variable, Term>());
	// // if (Unifier.getMGU(frozenAtom, newatom) != null) {
	// // System.out.println("Redundant");
	// // mgu = Unifier.getMGU(atom2, newatom);
	// // redundant = true;
	// // break;
	// // }
	// // }
	// // if (redundant) {
	// // pev = Unifier.applySubstitution(pev, mgu);
	// // newbody = pev.getBody();
	// // newbody.remove(newatomidx);
	// // newatomidx -= 1;
	// // continue;
	// // }
	//
	// }
	//
	// partialEvaluations.add(pev);
	// }
	// }
	// }
	//
	// return partialEvaluations;
	// }

	/***
	 * This method will attempt to unfold the TOP LEVEL nested JOINs. Adding them as
	 * conjuncts to the body of the UCQ
	 * </ul>
	 * 
	 * <p>
	 * 
	 * @param pos
	 * @param currentQuery
	 * @param count
	 * @return
	 */
	/*
	 * private void unfoldNestedJoin(CQIE currentQuery) { for (int atomIdx = 0;
	 * atomIdx < currentQuery.getBody().size(); atomIdx++) { Function function =
	 * currentQuery.getBody().get(atomIdx);
	 * 
	 * // Unfolding the Join atom
	 * 
	 * Predicate innerPredicate = function.getFunctionSymbol(); if
	 * (!(innerPredicate.getName().toString().equals(OBDAVocabulary.SPARQL_JOIN_URI)
	 * )) continue;
	 * 
	 * // Found a join, removing the Join term and assimilating its terms
	 * List<Function> body = currentQuery.getBody(); body.remove(atomIdx); for (int
	 * subtermidx = function.getTerms().size() - 1; subtermidx >= 0; subtermidx--) {
	 * Term atom = function.getTerm(subtermidx); body.add(atomIdx, (Function)atom);
	 * } atomIdx += -1; } }
	 */

	// /***
	// * Unfolds the inner terms of a literal. If the literal is not a function,
	// * then returns the same literal. If the literal is a function, it will
	// try
	// * to recursively unfold each term, until no term is unfoldable.
	// */
	// private NewLiteral unfoldLiteral(NewLiteral literal, int count) {
	//
	// if (!(literal instanceof Function))
	// return literal;
	//
	// Function function = (Function) literal;
	// Predicate mainPredicate = function.getFunctionSymbol();
	//
	// if (mainPredicate instanceof DataTypePredicate
	// || mainPredicate instanceof URITemplatePredicate
	// || mainPredicate instanceof BooleanOperationPredicate) {
	// /*
	// * This is a casting, comparison or tempalte, nothing to unfold
	// */
	// return literal;
	// }
	//
	// /*
	// * All the inner terms are no longer unfoldable. Now we should unfold
	// * the current function.
	// */
	//
	// if (!(mainPredicate instanceof BuiltinPredicate)) {
	// /*
	// * This is a data atom, it should be unfolded with the usual
	// * resolution algorithm.
	// */
	//
	// /**
	// * TODODODOODDODOODODDO
	// */
	// }
	//
	// int numberofTerms = function.getTerms().size();
	// for (int idx = 0; idx < numberofTerms; idx++) {
	// while (isUnfoldable(function.getTerm(idx))) {
	// unfoldLiteral(function.getTerm(idx), count);
	// }
	// }
	//
	// /*
	// * We are in the case of Joins and LeftJoins. The inner terms are
	// * already not unfoldable.
	// *
	// *
	// * LeftJoins cannot be modified if the inner children are not
	// * unfoldable.
	// *
	// * If the current terms is a Join, If one of the childs is a join, and
	// * this is a Join, we can remove the inner join and incorporate it into
	// * the current join.
	// */
	//
	// if (mainPredicate.getName().toString()
	// .equals(OBDAVocabulary.SPARQL_LEFTJOIN_URI))
	// return function;
	//
	// /*
	// * This is a join, so any inner join should be broken and it's terms
	// * integrated.
	// */
	// Map<Integer, List<NewLiteral>> newTerms = new LinkedHashMap<Integer,
	// List<NewLiteral>>();
	//
	// for (int idx = 0; idx < numberofTerms; idx++) {
	// NewLiteral innerTerm = function.getTerm(idx);
	// if (!(innerTerm instanceof Function))
	// continue;
	// Function innerFunction = (Function) innerTerm;
	// if (!innerFunction.getFunctionSymbol().toString()
	// .equals(OBDAVocabulary.SPARQL_JOIN_URI))
	// continue;
	//
	// /* we found a Join, break it and assimilate */
	//
	// }
	//
	// Predicate atomPredicate = atom.getPredicate();
	//
	// String name = atomPredicate.getName().toString();
	// if (atomPredicate.equals(OBDAVocabulary.SPARQL_JOIN)) {
	// /*
	// * This is a nested atom, we need to handle it using the
	// */
	// partialEvaluations = unfoldNestedJoin(pos, currentQuery, count);
	//
	// } else if (atomPredicate.equals(OBDAVocabulary.SPARQL_LEFTJOIN_URI)) {
	//
	// } else {
	//
	// /*
	// * This is the normal case where there is no nesting and we resolve
	// * an atom with normal resolution steps
	// */
	//
	// List<CQIE> ruleList = unfoldingProgram.getRules(atomPredicate);
	//
	// for (CQIE mappingRule : ruleList) {
	// CQIE freshMappingRule = getFreshRule(mappingRule, count);
	//
	// CQIE pev = resolutionEngine.resolve(freshMappingRule,
	// currentQuery, pos);
	//
	// if (pev != null) {
	//
	// /*
	// * The following blocks eliminate redundant atoms w.r.t.
	// * query containment by doing syntactic checks on the atoms.
	// * This saves us from requiring full CQC checks. They are a
	// * bit hacky, and they change the cardinality of
	// * non-distinct queries.
	// */
	//
	// List<Function> newbody = pev.getBody();
	// int newatomcount = mappingRule.getBody().size();
	// int oldatoms = newbody.size() - newatomcount - 1;
	// for (int newatomidx = oldatoms + 1; newatomidx < newbody
	// .size(); newatomidx++) {
	// Function newatom = newbody.get(newatomidx);
	// if (newatom.getPredicate() instanceof BooleanOperationPredicate)
	// continue;
	//
	// /*
	// * OPTIMIZATION 1: PRIMARY KEYS
	// *
	// * We now take into account Primary Key constraints on
	// * the database to avoid adding redundant atoms to the
	// * query. This could also be done as an afterstep, using
	// * unification and CQC checks, however, its is much more
	// * expensive that way.
	// */
	//
	// /*
	// * Given a primary Key on A, on columns 1,2, and an atom
	// * A(x,y,z) added by the resolution engine (always added
	// * at the end of the CQ body), we will look for other
	// * atom A(x,y,z') if the atom exists, we can unify both
	// * atoms, apply the MGU to the query and remove one of
	// * the atoms.
	// */
	//
	// List<Integer> pkey = primaryKeys.get(newatom
	// .getPredicate());
	// if (pkey != null && !pkey.isEmpty()) {
	// /*
	// * the predicate has a primary key, looking for
	// * candidates for unification, when we find one we
	// * can stop, since the application of this
	// * optimization at each step of the derivation tree
	// * guarantees there wont be any other redundant
	// * atom.
	// */
	// Function replacement = null;
	//
	// Map<Variable, NewLiteral> mgu = null;
	// for (int idx2 = 0; idx2 <= oldatoms; idx2++) {
	// Function tempatom = newbody.get(idx2);
	//
	// if (tempatom.getPredicate().equals(
	// newatom.getPredicate())) {
	//
	// boolean redundant = true;
	// for (Integer termidx : pkey) {
	// if (!newatom.getTerm(termidx - 1)
	// .equals(tempatom
	// .getTerm(termidx - 1))) {
	// redundant = false;
	// break;
	// }
	// }
	// if (redundant) {
	// /* found a candidate replacement atom */
	// mgu = Unifier.getMGU(newatom, tempatom);
	// if (mgu != null) {
	// replacement = tempatom;
	// break;
	// }
	// }
	//
	// }
	// }
	//
	// if (replacement != null) {
	//
	// if (mgu == null)
	// throw new RuntimeException(
	// "Unexcpected case found while performing JOIN elimination. Contact the
	// authors for debugging.");
	// pev = Unifier.applySubstitution(pev, mgu);
	// newbody = pev.getBody();
	// newbody.remove(newatomidx);
	// newatomidx -= 1;
	// continue;
	// }
	// }
	//
	// /*
	// * We remove all atoms that do not impose extra
	// * conditions on existing data. These are atoms that are
	// * implied by other atoms, and only check for the
	// * existance of data. They are redundant because there
	// * exists another atom that guarnatees satisfiabiliy of
	// * this atom. E.g.,
	// */
	//
	// // Function replacement = null;
	// // Map<Variable,Integer> variableCount =
	// // pev.getVariableCount();
	// //
	// // Map<Variable, Term> mgu = null;
	// // for (int idx2 = 0; idx2 <= oldatoms; idx2++) {
	// // Function tempatom = newbody.get(idx2);
	// //
	// // if
	// // (tempatom.getPredicate().equals(newatom.getPredicate()))
	// // {
	// //
	// // /*
	// // * Checking if all terms are the same, or if they
	// // * are different, the all variables in the current
	// // * atom are free variables (they do not appear
	// // anywhere
	// // else)
	// // */
	// // int termindex = 0;
	// // boolean redundant = true;
	// // for (termindex = 0; termindex <
	// // tempatom.getTerms().size(); termindex++) {
	// // Term currenTerm = newatom.getTerm(termindex);
	// // if (!currenTerm.equals(tempatom.getTerm(termindex))
	// // &&
	// // !(variableCount.get(currenTerm) == 1))
	// // {
	// // redundant = false;
	// // break;
	// // }
	// // }
	// //
	// // if (redundant) {
	// // /* found a candidate replacement atom */
	// // mgu = Unifier.getMGU(newatom, tempatom);
	// // if (mgu != null) {
	// // replacement = tempatom;
	// // break;
	// // }
	// // }
	// //
	// // }
	// // }
	// //
	// // if (replacement != null) {
	// //
	// // if (mgu == null)
	// // throw new RuntimeException(
	// //
	// "Unexcpected case found while performing JOIN elimination. Contact the
	// authors for debugging.");
	// // pev = Unifier.applySubstitution(pev, mgu);
	// // newbody = pev.getBody();
	// // newbody.remove(newatomidx);
	// // newatomidx -= 1;
	// // continue;
	// // }
	//
	// /*
	// * We remove all atoms that do not impose extra
	// * conditions on existing data. These are atoms that are
	// * implied by other atoms, and only check for the
	// * existance of data. They are redundant because there
	// * exists another atom that guarnatees satisfiabiliy of
	// * this atom. E.g.,
	// *
	// * b1 = r(x,y,z), r(m,n,o) b1 = r(x,y,z), r(x,n,o) b1 =
	// * r(x,y,z), r(x,y,o)
	// *
	// * In all these bodies, the second atoms is redundant
	// * w.r.t. set semantics. Note that with bag semantics,
	// * removing the atoms changes the cardinality of the
	// * query. E.g., let the data for r be:
	// *
	// * r(1,2,3), r(4,5,6), r(1,7,8).
	// *
	// * Then we have that |b1| = 9, |b2| = 5 and |b3| = 3.
	// * However, since the current implementation of the
	// * system is relaxed w.r.t. count of non-distinct values
	// * (it will probably stay like that), we dont care and
	// * we can remove these atoms.
	// *
	// * The condition is, given 2 atoms A, B, freeze B, and
	// * try to unify A,B, if true, then B is redundant,
	// * eliminate, else non redundant.
	// */
	//
	// // boolean redundant = false;
	// // List<Function> body = pev.getBody();
	// // Map<Variable, Term> mgu = null;
	// // for (int idx2 = 0; idx2 <= oldatoms; idx2++) {
	// //
	// // Function atom2 = body.get(idx2);
	// // Function frozenAtom = atom2.clone();
	// // CQCUtilities.getCanonicalAtom(frozenAtom, 1, new
	// // HashMap<Variable, Term>());
	// // if (Unifier.getMGU(frozenAtom, newatom) != null) {
	// // System.out.println("Redundant");
	// // mgu = Unifier.getMGU(atom2, newatom);
	// // redundant = true;
	// // break;
	// // }
	// // }
	// // if (redundant) {
	// // pev = Unifier.applySubstitution(pev, mgu);
	// // newbody = pev.getBody();
	// // newbody.remove(newatomidx);
	// // newatomidx -= 1;
	// // continue;
	// // }
	//
	// }
	//
	// partialEvaluations.add(pev);
	// }
	// }
	// }
	//
	// return partialEvaluations;
	// }

	// /***
	// * Checks if a literal is unfoldable, i.e., a rule can be resolved against
	// * the literal or against an inner literal. Or, the literal can be
	// "broken"
	// * into its subcomponents.
	// *
	// * @param term
	// * @return
	// */
	// private boolean isUnfoldable(NewLiteral term) {
	// if (term instanceof Variable || term instanceof Constant) {
	// return false;
	// } else if (term instanceof Function) {
	// Predicate p = ((Function) term).getFunctionSymbol();
	// if (p instanceof BooleanOperationPredicate
	// || p instanceof DataTypePredicate
	// || p instanceof URITemplatePredicate) {
	// return false;
	// } else if (p instanceof AlgebraOperatorPredicate) {
	// // /*
	// // * This is an algebra operator. If its a Join, is unfoldable
	// // if
	// // * a) its parent is not a LeftJoin or b) at least one of its
	// // * inner terms is unfoldable If its a Left Join, it is
	// // * unfoldable is at least one of the inner terms is
	// // unfoldable.
	// // */
	// // String name = p.getName().toString();
	// // if (name.equals(OBDAVocabulary.SPARQL_JOIN_URI)
	// // && (term.getParent() == null || !((Function) term
	// // .getParent()).getFunctionSymbol().getName()
	// // .toASCIIString()
	// // .equals(OBDAVocabulary.SPARQL_LEFTJOIN_URI)))
	// // return true;
	// for (NewLiteral innerLit : ((Function) term).getTerms()) {
	// if (isUnfoldable(innerLit))
	// return true;
	// }
	// return false;
	// } else {
	// /*
	// * This is a data atom/term, it is unfoldable only if there is a
	// * rule int he mapping program that can be unified with the term
	// */
	// List<CQIE> rules = unfoldingProgram.getRules(p);
	// for (CQIE rule : rules) {
	// Map<Variable, NewLiteral> mgu = Unifier.getMGU(
	// rule.getHead(), (Function) term);
	// if (mgu != null)
	// return true;
	// }
	// return false;
	// }
	// }
	// throw new RuntimeException("Term type not supported: "
	// + term.getClass() + " Term: " + term.toString());
	//
	// }

	/***
	 * This method assumes that the inner term (termidx) of term is a data atom, or
	 * a nested atom.
	 * <p>
	 * If the term is a data atom, it returns all the new rule resulting from
	 * resolving that atom with unifiable rules in the unfoldign program. If there
	 * are no such rules it returns null (the atom is logically empty).
	 * <p>
	 * If the atom is a Join or LeftJoin (algebra operators) it will recursively
	 * call unfoldin into each term until one method returns something different
	 * than the rule itself.
	 * <p>
	 * If the term is not a data atom, e.g., datatype atom, variable, constant,
	 * boolean atom., the method returns the original rule, without change.
	 * 
	 * otherwise it does nothing (i.e., variables, constants, etc cannot be resolved
	 * against rule
	 * 
	 * 
	 * @return
	 */
	private void computePartialEvaluation(List<CQIE> workingList, Map<Long, Node> idToCQs) {

		ListIterator<CQIE> iterator = workingList.listIterator();

		while (iterator.hasNext()) {
			CQIE rule = iterator.next();
			

			List<CQIE> result = computePartialEvaluation(rule.getBody(), rule, new Stack<Integer>(), false, idToCQs);

			if (result == null) {
				// if the result is null the rule is logically empty
				iterator.remove();
			} else if (!result.isEmpty()) {
				// one more step in the partial evaluation was computed, we need to
				// remove the old query and add the result instead. Each of the new
				// queries could still require more steps of evaluation, so we
				// move to the previous position
				iterator.remove();
				for (CQIE newquery : result)
					if (!workingList.contains(newquery)) {
						iterator.add(newquery);
						iterator.previous();
					}
			}
			// otherwise, the result is empty and so,
			// this rule is already a partial evaluation
		}
	}

	/***
	 * Goes through each term, and recursively each inner term trying to resolve
	 * each atom. Returns an empty list if the partial evaluation is completed (no
	 * atoms can be resolved and each atom is a leaf atom), null if there is at
	 * least one atom that is not leaf and cant be resolved, or a list with one or
	 * more queries if there was one atom that could be resolved against one or more
	 * rules. The list containts the result of the resolution steps against those
	 * rules.
	 * 
	 * @param currentTerms
	 * @param rule
	 * @param termidx
	 * @return
	 */

	private List<CQIE> computePartialEvaluation(List<Function> atoms, CQIE rule, Stack<Integer> termidx,
			boolean parentIsLeftJoin, Map<Long, Node> idToCQs) {

		int nonBooleanAtomCounter = 0;

		for (int atomIdx = 0; atomIdx < atoms.size(); atomIdx++) {
			termidx.push(atomIdx);

			Function atom = atoms.get(atomIdx);

			if (atom.isDataFunction()) {
				nonBooleanAtomCounter += 1;

				/*
				 * This is a data atom, it should be unfolded with the usual resolution
				 * algorithm.
				 */
				boolean isLeftJoinSecondArgument = nonBooleanAtomCounter == 2 && parentIsLeftJoin;
				List<CQIE> result = resolveDataAtom(atom, rule, termidx, parentIsLeftJoin, isLeftJoinSecondArgument,
						idToCQs);

				if (result == null)
					return null;

				if (!result.isEmpty())
					return result;
			} else if (atom.isAlgebraFunction()) {
				nonBooleanAtomCounter += 1;
				/*
				 * These may contain data atoms that need to be unfolded, we need to recursively
				 * unfold each term.
				 */
				Predicate predicate = atom.getFunctionSymbol();
				boolean focusAtomIsLeftJoin = predicate == OBDAVocabulary.SPARQL_LEFTJOIN;

				List<Function> innerTerms = new ArrayList<>(3);
				for (Term t : atom.getTerms())
					innerTerms.add((Function) t);

				List<CQIE> result = computePartialEvaluation(innerTerms, rule, termidx, focusAtomIsLeftJoin, idToCQs);

				if (result == null)
					return null;

				if (!result.isEmpty())
					return result;
			}
			// ROMAN: commented out because this condition can never be satisfied -- see
			// PredicateImpl.isDataPredicate()
			// else {
			// if (!focusLiteral.isBooleanFunction() &&
			// !focusLiteral.isArithmeticFunction() &&
			// !focusLiteral.isDataTypeFunction())
			// throw new IllegalArgumentException("Error during unfolding," +
			// "trying to unfold a non-algebra/non-data function. Offending atom: " +
			// focusLiteral);
			// }
			termidx.pop();
		}

		return Collections.emptyList();
	}

	/***
	 * Applies a resolution step over a non-boolean/non-algebra atom (i.e. data
	 * atoms). The resolution step will will try to match the <strong>focus atom
	 * a</strong> in the input <strong>rule r</strong> againts the rules in
	 * {@link #unfoldingProgram}.
	 * <p>
	 * For each <strong>rule s</strong>, if the <strong>head h</strong> of s is
	 * unifiable with a, then this method will do the following:
	 * <ul>
	 * <li>Compute a most general unifier <strong>mgu</strong> for h and a (see
	 * {@link UnifierUtilities#getMGU(Function, Function)})</li>
	 * <li>Create a clone r' of r</li>
	 * <li>We replace a in r' with the body of s
	 * <li>
	 * <li>We apply mgu to r' (see
	 * {@link UnifierUtilities#applyUnifier(it.unibz.inf.ontop.model.CQIE, it.unibz.inf.ontop.owlrefplatform.core.basicoperations.Unifier)}
	 * )</li>
	 * <li>return r'
	 * </ul>
	 * 
	 * 
	 * 
	 * @param focusAtom
	 *            The atom to be resolved.
	 * @param rule
	 *            The rule in which this atom resides
	 * @param termidx
	 *            The index of the atom in the rule (ifts nested, the stack
	 *            indicates the nesting, position by position, the first being
	 *            "list" positions (function term lists) and the last the focus
	 *            atoms position.
	 * @param atomindx
	 *            The location of the focustAtom in the currentlist
	 * @return
	 *         <ul>
	 *         <li>null if there is no s whose head unifies with a, we return null.
	 *         </li>
	 *         <li>An empty list if the atom a is <strong>extensional predicate
	 *         (those that have no defining rules)</strong> or the second data atom
	 *         in a left join</li>
	 *         <li>a list with one ore more rules otherwise</li>
	 *         <ul>
	 * 
	 * @see UnifierUtilities
	 */
	private List<CQIE> resolveDataAtom(Function focusAtom, CQIE rule, Stack<Integer> termidx, boolean isLeftJoin,
			boolean isSecondAtomInLeftJoin, Map<Long, Node> idToCQs) {

		/*
		 * Leaf predicates are ignored (as boolean or algebra predicates)
		 */
		Predicate pred = focusAtom.getFunctionSymbol();
		if (extensionalPredicates.contains(pred)) {
			// The atom is a leaf, that means that is a data atom that
			// has no resolvent rule, and marks the end points to compute
			// partial evaluations

			return Collections.emptyList();
		}
		/*
		 * This is a real data atom, it either generates something, or null (empty)
		 */

		List<CQIE> rulesDefiningTheAtom = ruleIndex.get(pred);

		/*
		 * If there are none, the atom is logically empty, careful, LEFT JOIN alert!
		 */

		List<CQIE> result = null;
		if (rulesDefiningTheAtom == null) {
			if (!isSecondAtomInLeftJoin)
				return null;
			else
				result = generateNullBindingsForLeftJoin(focusAtom, rule, termidx);
		} else {
			// Note, in this step result may get new CQIEs inside
			result = generateResolutionResult(focusAtom, rule, termidx, rulesDefiningTheAtom, isLeftJoin,
					isSecondAtomInLeftJoin, idToCQs);
		}

		if (result == null) {
			// this is the case for second atom in left join generating more
			// than one rull, we
			// must reutrn an empty result i ndicating its already a partial
			// evaluation.
			result = Collections.emptyList();
		} else if (result.size() == 0) {
			if (!isSecondAtomInLeftJoin)
				return null;
			else
				result = generateNullBindingsForLeftJoin(focusAtom, rule, termidx);
		}
		return result;
	}

	/***
	 * * Normalizes a rule that has multiple data atoms to a rule in which there is
	 * one single Join atom by creating a nested Join structure. Required to resolve
	 * atoms in LeftJoins (any, left or right) to avoid ending up with left joins
	 * with more than 2 table definitions. If the body contains only one data atom
	 * (or none) it will return <strong>null</strong>. For example:
	 * 
	 * <pre>
	 * m(x,y) :- R(x,y), R(y,z), R(z,m)
	 * 
	 * into
	 * 
	 * m(x,y) :- Join(R(x,y), Join(R(y,z), R(z,m))
	 * </pre>
	 * 
	 * @param rule
	 * @return a new query with the nested joins.
	 */
	private CQIE foldJOIN(CQIE rule) {
		// Checking if the rule has more that 1 data atom, otherwise we do
		// nothing. Now we count, and at the same time collect the atoms we
		// will need to manipulate in 2 temporal lists.

		// Data atoms in the list will be folded, boolean atoms will be
		// added to the body in the end

		List<Function> dataAtomsList = new LinkedList<>();
		List<Function> otherAtomsList = new LinkedList<>();

		for (Function subAtom : rule.getBody()) {
			if (subAtom.isDataFunction() || subAtom.isAlgebraFunction())
				dataAtomsList.add(subAtom);
			else
				otherAtomsList.add(subAtom);
		}

		// This mapping can be transformed into a normal join with ON
		// conditions. Doing so.

		Function foldedJoinAtom = null;

		while (dataAtomsList.size() > 1) {
			Function atom0 = dataAtomsList.remove(0);
			Function atom1 = dataAtomsList.remove(0);
			foldedJoinAtom = termFactory.getSPARQLJoin(atom0, atom1);
			dataAtomsList.add(0, foldedJoinAtom);
		}

		if (foldedJoinAtom == null)
			return rule;

		otherAtomsList.add(0, foldedJoinAtom);

		CQIE newrule = termFactory.getCQIE(rule.getHead(), otherAtomsList);
		return newrule;
	}

	/***
	 * Helper method for resolveDataAtom. Do not use anywhere else. This method
	 * returns a list with all the succesfull resolutions againts focusAtom. It will
	 * return a list with 0 ore more elements that result from successfull
	 * resolution steps, or null if there are more than 1 successfull resoluiton
	 * steps but focusAtom is the second atom of a left join (that is,
	 * isSecondAtomOfLeftJoin is true).
	 * 
	 * <p>
	 * Note the meaning of NULL in this method is different than the meaning of null
	 * and empty list in
	 * {@link #resolveDataAtom(it.unibz.inf.ontop.model.Function, it.unibz.inf.ontop.model.CQIE, java.util.Stack, int[], boolean, boolean)}
	 * which is the caller method. The job of interpreting correctly the output of
	 * this method is done in the caller.
	 * 
	 * 
	 * @param focusAtom
	 * @param rule
	 * @param termidx
	 * @param rulesDefiningTheAtom
	 * @param isSecondAtomOfLeftJoin
	 * @return
	 */
	private List<CQIE> generateResolutionResult(Function focusAtom, CQIE rule, Stack<Integer> termidx,
			List<CQIE> rulesDefiningTheAtom, boolean isLeftJoin, boolean isSecondAtomOfLeftJoin,
			Map<Long, Node> idToCQs) {
		
		List<CQIE> candidateMatches = new LinkedList<>(rulesDefiningTheAtom);
		List<CQIE> result = new LinkedList<>();
		UnionPair unions = new UnionPair(focusAtom.getFunctionSymbol());
		int rulesGeneratedSoFar = 0;
		Map<CQIE, CQIE> resultedQueryToOriginalMapping = new HashMap<CQIE, CQIE>();
		long id=rule.getId();
		Node n=null;
		if(!idToCQs.containsKey(id)) {
			System.out.println("Query not found!");
			//n=new Node(id, candidateMatches.size());
			//idToCQs.put(id, n);
		}
		else {
			n=idToCQs.get(id);
		}
		List<CQIE> matches=new ArrayList<CQIE>();
		for (CQIE candidateRule : candidateMatches) {

			/* getting a rule with unique variables */
			CQIE freshRule = termFactory.getFreshCQIECopy(candidateRule);

			Substitution mgu = UnifierUtilities.getMGU(freshRule.getHead(), focusAtom);
			if (mgu == null) {
				// Failed attempt
				continue;
			}

			/*
			 * We have a matching rule, now we prepare for the resolution step
			 */
			matches.add(candidateRule);
			// if we are in a left join, we need to make sure the fresh rule
			// has only one data atom
			if (isLeftJoin) {
				freshRule = foldJOIN(freshRule);
			}

			/*
			 * generating the new body of the rule
			 */

			CQIE partialEvalution = rule.clone();
			/*
			 * locating the list that contains the current Function (either body or inner
			 * term) and replacing the current atom, with the body of the matching rule.
			 */

			List<Function> innerAtoms = getNestedList(termidx, partialEvalution);

			innerAtoms.remove((int) termidx.peek());
			innerAtoms.addAll((int) termidx.peek(), freshRule.getBody());

			SubstitutionUtilities.applySubstitution(partialEvalution, mgu, false);

			/***
			 * DONE WITH BASIC RESOLUTION STEP
			 */

			/***
			 * OPTIMIZING
			 */

			int newatomcount = freshRule.getBody().size();
			//int oldSize = unions.size();
			boolean toRemoveOtherUnions = joinEliminationPKBased(termidx, newatomcount, partialEvalution, unions, candidateRule);
			/***
			 * DONE OPTIMIZING RETURN THE RESULT
			 */
			//if (unions.size() != oldSize) {
				resultedQueryToOriginalMapping.put(partialEvalution, candidateRule);
			//}
			rulesGeneratedSoFar += 1;

			if (isSecondAtomOfLeftJoin && rulesGeneratedSoFar > 1) {
				/*
				 * We had disjunction on the second atom of the lejoin, that is, more than two
				 * rules that unified. LeftJoin is not distributable on the right component,
				 * hence, we cannot simply generate 2 rules for the seocnd atom.
				 * 
				 * The rules must be untouched, no partial evaluation is possible. We must
				 * return the original rule.
				 */
				return null;

			}
			if (toRemoveOtherUnions) {
				result.clear();
				result.add(partialEvalution);
				n.removeChildren();
				idToCQs.put(partialEvalution.getId(), n);
				return result;
			}
			result.add(partialEvalution);
			Node child=new Node(partialEvalution.getId(), 10, termidx.peek(), newatomcount);
			n.addChild(this.tMappingIDIndex.get(focusAtom.getFunctionSymbol()), 
					this.mappingIDIndex.get(candidateRule), child);
			idToCQs.put(partialEvalution.getId(), child);
		} // end for candidate matches

		/*for (UnionPair up : root) {
			for (UnionSet us : up.getSets()) {
				UnionInfo uiresult = null;
				for (UnionInfo ui : us.getInfo()) {

					if (ui.getCQ() == rule) {
						uiresult = ui;
						break;
					}
				}
				if (uiresult != null) {
					us.remove(uiresult);
					for (CQIE newCQ : resultedQueryToOriginalMapping.keySet()) {
						UnionInfo newUI = new UnionInfo(newCQ);
						newUI.setSequence(new ArrayList<CQIE>(uiresult.getSequence()));
						newUI.addToSequence(resultedQueryToOriginalMapping.get(newCQ));
						us.add(newUI);

					}
				}
			}
		}
		if (unions.size() > 1) {
			System.out.println("Size:::"+unions.size());
			root.add(unions);
		}*/
		List<Term> projection=null;
		for(int i=1;i<matches.size();i++) {
			Substitution mgu=UnifierUtilities.getMGU( matches.get(0).getHead(), matches.get(i).getHead());
			if(mgu==null) {
				n.setCompatible(false);
				break;
			}
			if(i==1) {
				projection=new ArrayList<Term>();
				List<Variable> vars = new ArrayList<Variable>();
				TermUtils.addReferencedVariablesTo(vars, matches.get(0).getHead());
				for(Variable t:vars) {
					if(t instanceof Variable) {
						projection.add(t);
					}
				}
				n.addProjection(projection);
			}
			projection=new ArrayList<Term>();
			List<Variable> vars = new ArrayList<Variable>();
			TermUtils.addReferencedVariablesTo(vars, matches.get(i).getHead());
			for(Variable t:vars) {
				if(t instanceof Variable) {
					projection.add(t);
				}
			}
			n.addProjection(projection);
			/*
			List<Term> nextProjection=new ArrayList<Term>(projection.size());
			for(Term t:projection) {
				if(mgu.getMap().containsKey(t)) {
					nextProjection.add(mgu.get((Variable) t));
				}
				else {
					nextProjection.add(t);
				}
			}
			n.addProjection(nextProjection);*/
		}
		return result;
	}

	private List<CQIE> generateNullBindingsForLeftJoin(Function focusLiteral, CQIE originalRuleWithLeftJoin,
			Stack<Integer> termidx) {

		log.debug("Empty evaluation - Data Function {}", focusLiteral);

		CQIE freshRule = originalRuleWithLeftJoin.clone();

		Stack<Integer> termidx1 = new Stack<>();
		termidx1.addAll(termidx);

		termidx1.pop();
		termidx1.add(0);
		List<Function> innerAtoms = getNestedList(termidx1, freshRule);

		int argumentAtoms = 0;
		List<Function> newbody = new LinkedList<>();
		Set<Variable> variablesArg1 = new HashSet<>();
		Set<Variable> variablesArg2 = new HashSet<>();

		// Here we build the new LJ body where we remove the 2nd
		// data atom
		for (Function atom : innerAtoms) {
			if (atom.isDataFunction() || atom.isAlgebraFunction()) {
				argumentAtoms++;
				// we found the first argument of the LJ, we need
				// the variables
				if (argumentAtoms == 1) {
					TermUtils.addReferencedVariablesTo(variablesArg1, atom);
					newbody.add(atom);
				} else if (argumentAtoms == 2) {
					// Here we keep the variables of the second LJ
					// data argument
					TermUtils.addReferencedVariablesTo(variablesArg2, atom);

					// and we remove the variables that are in both arguments
					variablesArg2.removeAll(variablesArg1);
				} else
					newbody.add(atom);
			} else
				newbody.add(atom);
		} // end for rule body

		// freshRule.updateBody(newbody);
		replaceInnerLJ(freshRule, newbody, termidx1);

		Substitution unifier = SubstitutionUtilities.getNullifier(variablesArg2);

		// Now I need to add the null to the variables of the second
		// LJ data argument
		SubstitutionUtilities.applySubstitution(freshRule, unifier, false); // in-place unification

		List<CQIE> result = new LinkedList<>();
		result.add(freshRule);
		return result;
	}

	private static void replaceInnerLJ(CQIE rule, List<Function> replacementTerms, Stack<Integer> termidx) {
		Function parentFunction = null;
		if (termidx.size() > 1) {
			/*
			 * Its a nested term
			 */
			Term nestedTerm = null;
			for (int y = 0; y < termidx.size() - 1; y++) {
				int i = termidx.get(y);
				if (nestedTerm == null)
					nestedTerm = rule.getBody().get(i);
				else {
					parentFunction = (Function) nestedTerm;
					nestedTerm = ((Function) nestedTerm).getTerm(i);
				}
			}
			// Function focusFunction = (Function) nestedTerm;
			if (parentFunction == null) {
				// its just one Left Join, replace rule body directly
				rule.updateBody(replacementTerms);
				return;
			}
			List<Term> tempTerms = parentFunction.getTerms();
			tempTerms.remove(0);
			List<Term> newTerms = new LinkedList<Term>();
			newTerms.addAll(replacementTerms);
			newTerms.addAll(tempTerms);
			parentFunction.updateTerms(newTerms);
		} else {
			throw new RuntimeException("Unexpected OPTIONAL condition!");
		}
	}

	/***
	 * 
	 * We now take into account Primary Key constraints on the database to avoid
	 * adding redundant atoms to the query. This could also be done as an afterstep,
	 * using unification and CQC checks, however, its is much more expensive that
	 * way. Given a primary Key on A, on columns 1,2, and an atom A(x,y,z) added by
	 * the resolution engine (always added at the end of the CQ body), we will look
	 * for another atom A(x,y,z') if the atom exists, we can unify both atoms, apply
	 * the MGU to the query and remove one of the atoms.
	 * 
	 * 
	 * @param termidx
	 * 
	 * @param newatomcount
	 *            The number of new atoms introduced by this resolution step (the
	 *            body size of the fresh rule used for this resolution step)
	 * 
	 * @param partialEvalution
	 *            The CQIE currently being optimized, i.e., the result of the
	 *            resolution step.
	 * @param unions
	 * 
	 */
	private boolean joinEliminationPKBased(Stack<Integer> termidx, int newatomcount, CQIE partialEvalution,
			UnionPair unions, CQIE mapping) {
		System.out.println("goooo");
		List<Function> innerAtoms = getNestedList(termidx, partialEvalution);

		Function currentAtom = getTerm(termidx, partialEvalution);

		Map<Variable, Integer> variablesCount = null;

		if (currentAtom == null) {
			/*
			 * Case where the resolution atemt didn't add any atoms, the body was null.
			 */

			return false;
		}
		Set<Function> atoms = new HashSet<Function>();
		int newatomsfirstIndex = termidx.peek();

		if (newatomsfirstIndex <= 0) {
			//System.out.println("index:" + newatomsfirstIndex + ":" + partialEvalution);
			return false;

		}
		int noOfDataAtoms = 0;
		//int coveredDataAtoms = 0;
		Map<Function, Function> toRemove=new HashMap<Function, Function>();
		for (int newatomidx = newatomsfirstIndex; newatomidx < newatomsfirstIndex + newatomcount; newatomidx++) {

			Function newatom = innerAtoms.get(newatomidx);
			atoms.add(newatom);
			System.out.println("next atom::" + newatom);
			if (!newatom.isDataFunction()) {
				continue;
			}
			noOfDataAtoms++;
			//System.out.println("next data function");

			Substitution mgu = null;

			Function tempatom = null;

			for (int idx2 = 0; idx2 < termidx.peek(); idx2++) {
				tempatom = innerAtoms.get(idx2);

				// predicates are different, atoms cannot be unified
				if (!tempatom.getFunctionSymbol().equals(newatom.getFunctionSymbol()))
					continue;

				mgu = UnifierUtilities.getMGU(newatom, tempatom);
				if (mgu == null) {
					// removeUnions = false;
					continue;
				}

				if (currentAtom.isAlgebraFunction()
						&& (currentAtom.getFunctionSymbol() == OBDAVocabulary.SPARQL_LEFTJOIN)) {
					continue;
				}

				boolean redundant = true;

				if (variablesCount == null) {
					variablesCount = new HashMap<Variable, Integer>();
					UniqueConstraintOptimizer.computeVariablesCount(variablesCount, partialEvalution, notNulls, mgu);
				}

				for (int i = 0; i < currentAtom.getArity(); i++) {
					Term next = currentAtom.getTerm(i);
					if (next instanceof Constant) {
						if (!tempatom.getTerm(i).equals(next)) {
							redundant = false;
							break;
						}
					} else if (next instanceof Variable) {
						Variable v = (Variable) currentAtom.getTerm(i);
						if (variablesCount.get(v) == 1) {
							// this column is not used anywhere else in the query
							continue;
						} else {
							if (!tempatom.getTerm(i).equals(next)) {
								redundant = false;
								break;
							} else {
								continue;
							}
						}
					}
				}

				// for (Integer termidx2 : pKey) {
				// if (!currentAtom.getTerm(termidx2 - 1).equals(tempatom.getTerm(termidx2 -
				// 1))) {
				// redundant = false;
				// break;
				// }
				// }

				if (redundant) {
					// found a candidate replacement atom
					toRemove.put(newatom, tempatom);
				/*	SubstitutionUtilities.applySubstitution(partialEvalution, mgu, false);
				//	modified = true;
					log.debug("covered join elimination for redundant self join of {} and {}", newatom, tempatom);

					System.out.println("eliminating covered self join of " + newatom + " and " + tempatom);
					//coveredDataAtoms++;
					innerAtoms.remove(newatomidx);
					newatomidx -= 1;
					newatomcount -= 1;
					//removed = true;*/
					break;

				}

			}
			/* if (removed)
				continue;

			Collection<List<Integer>> pKeys = primaryKeys.get(newatom.getFunctionSymbol());

			for (List<Integer> pKey : pKeys) {
				// no pkeys for this predicate
				if (pKey == null || pKey.isEmpty()) {

					continue;

				}

			//	
			//	  the predicate has a primary key, looking for candidates for unification, when
			//	  we find one we can stop, since the application of this optimization at each
			//	  step of the derivation tree guarantees there wont be any other redundant
			//	  atom.
			//	 
				mgu = null;

				tempatom = null;

				for (int idx2 = 0; idx2 < termidx.peek(); idx2++) {
					tempatom = innerAtoms.get(idx2);

					// predicates are different, atoms cannot be unified
					if (!tempatom.getFunctionSymbol().equals(newatom.getFunctionSymbol()))
						continue;

					boolean redundant = true;
					for (Integer termidx2 : pKey) {
						if (!newatom.getTerm(termidx2 - 1).equals(tempatom.getTerm(termidx2 - 1))) {
							redundant = false;
							break;
						}
					}

					if (redundant) {
						// found a candidate replacement atom 
						mgu = UnifierUtilities.getMGU(newatom, tempatom);
						if (mgu != null)
							break;
					}

				}

				if (mgu == null) {
					continue;
				}

				if (currentAtom.isAlgebraFunction()
						&& (currentAtom.getFunctionSymbol() == OBDAVocabulary.SPARQL_LEFTJOIN)) {
					continue;
				}

				
				 // for(int t=0;t<newatom.getTerms().size();t++ ) { Term old=newatom.getTerm(t);
				 // if(old instanceof Constant && !(old.equals(tempatom.getTerm(t)))) {
				 // System.out.println("consntannnt"); allDataFunctionsRemoved=false; break; } }
				 //

				SubstitutionUtilities.applySubstitution(partialEvalution, mgu, false);

				log.debug("The Unique Constraint {}{} is used for eliminating the redundant self join of {} and {}",
						newatom.getFunctionSymbol(), pKey, newatom, tempatom);

				System.out.println("The Unique Constraint " + newatom.getFunctionSymbol() + " " + pKey
						+ " is used for eliminating the redundant self join of " + newatom + " and " + tempatom);
				modified = true;
				innerAtoms.remove(newatomidx);
				newatomidx -= 1;
				newatomcount -= 1;
				break;

			}*/
		}

		/*
		 * As the result of optimizing PKs, it can be that JOINs become invalid, i.e.,
		 * they contian one single data item (no longer a join). In this case we need to
		 * eliminate the join atom attach the inner atoms to the parent of the join
		 * (body or another join/leftjoin). This is done with the normalizer.
		 */
		
		if (noOfDataAtoms > 0 && noOfDataAtoms == toRemove.size()) {
			for(Function newatom:toRemove.keySet()) {
				Substitution mgu = UnifierUtilities.getMGU(newatom, toRemove.get(newatom));
				SubstitutionUtilities.applySubstitution(partialEvalution, mgu, false);
				for (int newatomidx = newatomsfirstIndex; newatomidx < newatomsfirstIndex + newatomcount; newatomidx++) {
					if(innerAtoms.get(newatomidx).equals(newatom)) {
						innerAtoms.remove(newatomidx);
						break;
					}
				}
				//partialEvalution.getBody().re.remove(newatom);
			}
			int dataAtoms = DatalogNormalizer.countDataItems(innerAtoms);
			if (dataAtoms == 1) {
				// Eliminates Join atoms when they only have one data atom, i.e., they are
				// not really JOINs

				DatalogNormalizer.unfoldJoinTrees(partialEvalution);
			}
				System.out.println("Removing other unions!!!");
				System.out.println(partialEvalution);
				return true;

			
		}else {
			int dataAtoms = DatalogNormalizer.countDataItems(innerAtoms);
			if (dataAtoms == 1) {
				// Eliminates Join atoms when they only have one data atom, i.e., they are
				// not really JOINs

				DatalogNormalizer.unfoldJoinTrees(partialEvalution);
			}
		
			//UnionInfo info = new UnionInfo(partialEvalution);
			//UnionSet unionset = new UnionSet(atoms, info);
			//unions.add(mapping, unionset);
			return false; 
		
		}
		
	}

	/***
	 * Goes through a list of atoms (indicated by the termidx) removing any
	 * duplicated ISNOTNULL atoms.
	 * 
	 * @param termidx
	 * @param partialEvalution
	 */
	private static void eliminateRedundantISNOTNULL(Stack<Integer> termidx, CQIE partialEvalution) {
		List<Function> innerAtoms = getNestedList(termidx, partialEvalution);
		Function currentAtom = getTerm(termidx, partialEvalution);

		int newatomsfirstIndex = termidx.peek();
		if (newatomsfirstIndex <= 0) {
			return;
		}
		for (int newatomidx = 0; newatomidx < innerAtoms.size(); newatomidx++) {

			Function newatom = innerAtoms.get(newatomidx);
			if (newatom.getFunctionSymbol() != ExpressionOperation.IS_NOT_NULL)
				continue;

			Function replacement = null;

			for (int idx2 = 0; idx2 < termidx.peek(); idx2++) {
				Function tempatom = innerAtoms.get(idx2);
				if (!tempatom.equals(newatom))
					continue;

				replacement = tempatom;
				break;

			}

			if (replacement == null)
				continue;

			innerAtoms.remove(newatomidx);
			newatomidx -= 1;
		}
	}

	/***
	 * Returns the list of terms contained in the nested atom indicated by term idx.
	 * If termidx is empty, then this is the list of atoms in the body of the rule,
	 * otherwise the list correspond to the terms of the nested atom indicated by
	 * termidx viewed as a path of atoms. For example, if termidx = <2,4> then this
	 * atom returns the list of terms of the 4 atom, of the second atom in the body
	 * of the rule.
	 * 
	 * <p>
	 * Example two. IF the rule is q(x):-A(x), Join(R(x,y), Join(P(s),R(x,y) and
	 * termidx = <1,2>, then this method returns the the terms of the second join
	 * atom, ie., <P(s),R(x,y)> ,
	 * 
	 * <p>
	 * note that this list is the actual list of terms of the atom, so manipulating
	 * the list will change the atom.
	 * 
	 * 
	 * @param termidx
	 * @param rule
	 * @return
	 */
	private static List<Function> getNestedList(Stack<Integer> termidx, CQIE rule) {

		if (termidx.size() > 1) {
			// it's a nested term
			int i0 = termidx.get(0);
			Function newfocusFunction = rule.getBody().get(i0);

			for (int y = 1; y < termidx.size() - 1; y++) {
				int i = termidx.get(y);
				newfocusFunction = (Function) newfocusFunction.getTerm(i);
			}

			return (List<Function>) (List) newfocusFunction.getTerms();
		} else {
			// it's the body of the query
			return rule.getBody();
		}
	}

	private static Function getTerm(Stack<Integer> termidx, CQIE rule) {
		Function atom = null;
		if (termidx.size() > 1) {
			Stack<Integer> stack = new Stack<>();
			stack.addAll(termidx.subList(0, termidx.size() - 1));
			List<Function> innerTerms = getNestedList(stack, rule);
			atom = innerTerms.get(stack.peek());
		} else {
			List<Function> body = rule.getBody();
			Integer peek = termidx.peek();
			if (peek >= body.size())
				return null;
			atom = body.get(peek);
		}
		return atom;
	}

	public DatalogProgram unfold(DatalogProgram inputquery, int mode) {

		List<CQIE> workingSet = new LinkedList<>();
		for (CQIE query : inputquery.getRules())
			workingSet.add(query.clone());
		for (CQIE q : workingSet) {
			Set<Function> existingAtoms = new HashSet<Function>();
			System.out.println("initial size:::" + q.getBody().size());
			for (int i = 0; i < q.getBody().size(); i++) {
				if (!existingAtoms.add(q.getBody().get(i))) {
					q.getBody().remove(i);
					i--;
				}
			}
			System.out.println("final size:::" + q.getBody().size());
		}
		Map<Long, Node> idToCQs=new HashMap<Long, Node>();
		List<Node> forest=new ArrayList<Node>(workingSet.size());
		for (CQIE query : workingSet) {
			EQNormalizer.enforceEqualities(query);
			
				long id=query.getId();
				Node root=new Node(id, 10, 0, 0);
				if(!idToCQs.containsKey(id)) {
					idToCQs.put(id, root);	
					forest.add(root);
			}
		}
		computePartialEvaluation(workingSet, idToCQs);
		Map<Integer, UnionInfo> unions=new HashMap<Integer, UnionInfo>();

		for(int i=0;i<forest.size();i++) {
			Node nextRoot=forest.get(i);
			List<SequenceInfo> sequences=new ArrayList<SequenceInfo>();
			nextRoot.traverse(unions, sequences);
			
		}
		
		int card=0;
		UnionInfo maxUnion=null;
		for(UnionInfo ui:unions.values()) {
			if(card<ui.getCardinality()) {
				card=ui.getCardinality();
				maxUnion=ui;
			}
		}
		
		Map<Long, List<Integer>> removedPositions=new HashMap<Long, List<Integer>>();
		
		boolean useUnions=true;
		//if(maxUnion!=null&&useUnions) {
		for(UnionInfo ui:unions.values()) {
			maxUnion=ui;
			Set<CQIE> unionqueries=new HashSet<CQIE>();
			String viewName="uniontable"+Util.createUniqueIdString();
			Map<List<Integer>, Set<Long>> groupedQueries =new HashMap<List<Integer>, Set<Long>>();
			List<Integer> first=null;
			Iterator<Integer> entries=maxUnion.getMappings();
			Set<Long> toRemove=new HashSet<Long>();
			Set<List<Integer>> addedSeqs=new HashSet<List<Integer>>();
			while(entries.hasNext()) {
				Integer mapId=entries.next();
				PredEntry next=maxUnion.getPredicate(mapId);
				//boolean notadded=true;
				List<Function> preds=new ArrayList<Function>();
				
				for(CQIE mapping:this.mappingIDIndex.keySet()) {
					if(this.mappingIDIndex.get(mapping).equals(mapId)) {
						System.out.println("mapping:"+mapId);
						for(Function f:mapping.getBody()) {
							preds.add(f);
						}
						break;
					}
				}
				
				for(List<Integer> seq:next.getSequences()) {
					boolean added=false;
					if(!groupedQueries.containsKey(seq)) {
						groupedQueries.put(seq, new HashSet<Long>());
	
					}
					if(!addedSeqs.contains(seq)) {
					//if(notadded && (first==null||first.equals(seq))) {
						if(first==null) {
							first=seq;
						}
						NodeAtomReplacement queryId=next.getQueryForSequence(seq);
						for(CQIE q:workingSet) {
							if(q.getId()==queryId.getQuery()) {
								System.out.println("query:"+q.getId());
								
								List<Function> removed=new ArrayList<Function>();
								
								if(!removedPositions.containsKey(q.getId())) {
									removedPositions.put(q.getId(), new ArrayList<Integer>());
								}
								int minus=0;
								for(Integer i:removedPositions.get(q.getId())) {
									if(i<queryId.getStartPos())
										minus++;
								}
								List<Integer> removedPos=removedPositions.get(q.getId());
								for(int i=queryId.getStartPos();i<queryId.getStartPos()+queryId.getAtomCount();i++) {
									removed.add(q.getBody().remove(queryId.getStartPos()-minus));
									
									removedPos.add(i);
									
									//preds.add(q.getBody().get(i));
									//to remove
								}
								Substitution mgu=UnifierUtilities.getMGU(preds.get(0), removed.get(0));
								if(mgu==null) {
									System.out.println("null substitution");
								}
								for(int i=1;i<removed.size();i++) {
									//Substitution mgu1=UnifierUtilities.getMGU(removed.get(i), preds.get(i));
									//if(mgu1==null) {
									//	System.out.println("null substitution");
									//}
									//mgu.compose(mgu1);
									mgu.composeFunctions(preds.get(i), removed.get(i));
								}
								
								System.out.println("projections: "+next.getProjection());
								COL_TYPE[]  types= new COL_TYPE[next.getProjection().size()] ;
								Predicate p2=termFactory.getPredicate(viewName, types);
								Function ans=termFactory.getFunction(p2, next.getProjection());
								List<Term> toReplace=new ArrayList<Term>(next.getProjection().size());
								for(Term t:next.getProjection()) {
									toReplace.add(mgu.get((Variable) t));
								}
								Function ansReplace=termFactory.getFunction(p2, toReplace);
								CQIE q1=termFactory.getCQIE(ans, preds);
								q.getBody().add(ansReplace);
								unionqueries.add(q1);
								//notadded=false;
								addedSeqs.add(seq);
								break;
							}
						}
						
					}
					else {
						toRemove.add(next.getQueryForSequence(seq).getQuery());
						if(!added) {
							Long queryId=next.getQueryForSequence(seq).getQuery();
							for(CQIE q:workingSet) {
								if(q.getId()==queryId) {
									
									
									System.out.println("projections: "+next.getProjection());
									COL_TYPE[]  types= new COL_TYPE[next.getProjection().size()] ;
									Predicate p2=termFactory.getPredicate(viewName, types);
									Function ans=termFactory.getFunction(p2, next.getProjection());
									
									CQIE q1=termFactory.getCQIE(ans, preds);
									unionqueries.add(q1);
									//notadded=false;
									break;
								}
								
							}
							added=true;
							
						}
					}
					groupedQueries.get(seq).add(next.getQueryForSequence(seq).getQuery());
				}
				
			}
			//System.out.println("first unions:");
			Set<CQIE> toRemoveQ=new HashSet<CQIE>(toRemove.size());
			for(Long qID:toRemove) {
				for(CQIE q:workingSet) {
					if(q.getId()==qID) {
						toRemoveQ.add(q);
					
						//System.out.println(q);
						//System.out.println(" UNION ");
					}
					}
			}
			workingSet.removeAll(toRemoveQ);
			
			
			
			for(CQIE un:unionqueries) {
				workingSet.add(0, un);
			}
			
			//System.out.println("query after:");
			//for(Function f:atoms.get(first.getId())) {
			//	first.getBody().remove(f);
			//}
			//System.out.println(first);
			
		}

		// We need to enforce equality again, because at this point it is
		// possible that there is still some EQ(...)
		for (CQIE query : workingSet) {
			EQNormalizer.enforceEqualities(query);
			UniqueConstraintOptimizer.selfJoinElimination(query, primaryKeys);
			if (mode == 1) {
				long start = System.currentTimeMillis();
				UniqueConstraintOptimizer.coveredJoinElimination(query, notNulls);
				System.out.println("covered join elimination in " + (System.currentTimeMillis() - start) + " ms.");
			}
		}

		DatalogProgram result = termFactory.getDatalogProgram(inputquery.getQueryModifiers());
		result.appendRule(workingSet);

		return result;
	}

}
