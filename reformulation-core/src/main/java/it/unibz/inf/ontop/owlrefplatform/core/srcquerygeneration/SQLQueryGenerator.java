package it.unibz.inf.ontop.owlrefplatform.core.srcquerygeneration;

import it.unibz.inf.ontop.model.CQIE;

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

import it.unibz.inf.ontop.model.DatalogProgram;
import it.unibz.inf.ontop.model.OBDAException;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

/**
 * A general interface which should be use to implement new source query
 * generation which can than be integrated in to a technique wrapper
 * 
 * @author Manfred Gerstgrasser
 * 
 */

public interface SQLQueryGenerator extends Serializable {

	/**
	 * Translates the given datalog program into a source query, which can later
	 * be evaluated by a evaluation engine.
	 * 
	 * @param query
	 *            the datalog program
	 * @return the source query
	 * @throws Exception
	 */
	public List<String> generateSourceQuery(DatalogProgram query, List<String> signature) throws OBDAException;

	public boolean hasDistinctResultSet() ;
	
	public String getMappingSQL(CQIE cq);

	public Set<String> getOutputColumns(CQIE cq);
	
}
