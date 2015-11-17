package org.semanticweb.ontop.reformulation.tests;

import com.google.common.base.Optional;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMultimap;
import fj.P;
import fj.P2;
import org.junit.Test;
import org.semanticweb.ontop.model.*;
import org.semanticweb.ontop.model.impl.AtomPredicateImpl;
import org.semanticweb.ontop.model.impl.OBDADataFactoryImpl;
import org.semanticweb.ontop.pivotalrepr.*;
import org.semanticweb.ontop.pivotalrepr.impl.ConstructionNodeImpl;
import org.semanticweb.ontop.pivotalrepr.impl.ExtensionalDataNodeImpl;
import org.semanticweb.ontop.pivotalrepr.impl.InnerJoinNodeImpl;
import org.semanticweb.ontop.pivotalrepr.impl.MetadataForQueryOptimizationImpl;
import org.semanticweb.ontop.pivotalrepr.impl.tree.DefaultIntermediateQueryBuilder;
import org.semanticweb.ontop.pivotalrepr.proposal.InvalidQueryOptimizationProposalException;
import org.semanticweb.ontop.pivotalrepr.proposal.impl.InnerJoinOptimizationProposalImpl;

/**
 * TODO: explain
 */

public class RedundantJoinTest {

    private final static AtomPredicate TABLE1_PREDICATE = new AtomPredicateImpl("table1", 3);
    private final static OBDADataFactory DATA_FACTORY = OBDADataFactoryImpl.getInstance();
    private final static Variable x = DATA_FACTORY.getVariable("x");
    private final static Variable y = DATA_FACTORY.getVariable("y");
    private final static Variable z = DATA_FACTORY.getVariable("z");
    private final static Constant two = DATA_FACTORY.getConstantLiteral("2");

    private final MetadataForQueryOptimization metadata;

    public RedundantJoinTest() {
        metadata = initMetadata();
    }

    private static MetadataForQueryOptimization initMetadata() {
        ImmutableMultimap.Builder<AtomPredicate, ImmutableList<Integer>> uniqueKeyBuilder = ImmutableMultimap.builder();

        /**
         * Table 1: non-composite key and regular field
         */
        uniqueKeyBuilder.put(TABLE1_PREDICATE, ImmutableList.of(1));

        return new MetadataForQueryOptimizationImpl(uniqueKeyBuilder.build());
    }

    /**
     * TODO: explain
     */
    @Test
    public void testSelfJoinElimination() throws IntermediateQueryBuilderException,
            InvalidQueryOptimizationProposalException, EmptyQueryException {

        P2<IntermediateQueryBuilder, InnerJoinNode> initPair = initAns1(metadata);
        IntermediateQueryBuilder queryBuilder = initPair._1();
        InnerJoinNode joinNode = initPair._2();

        ExtensionalDataNode dataNode1 = new ExtensionalDataNodeImpl(DATA_FACTORY.getDataAtom(TABLE1_PREDICATE, x, y, z));
        queryBuilder.addChild(joinNode, dataNode1);
        ExtensionalDataNode dataNode2 = new ExtensionalDataNodeImpl(DATA_FACTORY.getDataAtom(TABLE1_PREDICATE, x, y, two));
        queryBuilder.addChild(joinNode, dataNode2);

        IntermediateQuery query = queryBuilder.build();
        System.out.println("\nBefore optimization: \n" +  query);

        IntermediateQuery optimizedQuery = query.applyProposal(new InnerJoinOptimizationProposalImpl(joinNode))
                .getResultingQuery();
        System.out.println("\n After optimization: \n" +  optimizedQuery);

        // TODO: continue
    }


    private static P2<IntermediateQueryBuilder, InnerJoinNode> initAns1(MetadataForQueryOptimization metadata) throws IntermediateQueryBuilderException {
        IntermediateQueryBuilder queryBuilder = new DefaultIntermediateQueryBuilder(metadata);

        DataAtom ans1Atom = DATA_FACTORY.getDataAtom(new AtomPredicateImpl("ans1", 1), y);
        ConstructionNode rootNode = new ConstructionNodeImpl(ans1Atom);
        queryBuilder.init(rootNode);
        InnerJoinNode joinNode = new InnerJoinNodeImpl(Optional.<ImmutableBooleanExpression>absent());
        queryBuilder.addChild(rootNode, joinNode);

        return P.p(queryBuilder, joinNode);
    }


}