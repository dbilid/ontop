package it.unibz.inf.ontop.spec.trans;

import it.unibz.inf.ontop.dbschema.DBMetadata;
import it.unibz.inf.ontop.exception.DBMetadataExtractionException;
import it.unibz.inf.ontop.exception.MappingException;
import it.unibz.inf.ontop.exception.OntologyException;
import it.unibz.inf.ontop.mapping.Mapping;
import it.unibz.inf.ontop.ontology.Ontology;
import it.unibz.inf.ontop.owlrefplatform.core.dagjgrapht.TBoxReasoner;
import it.unibz.inf.ontop.spec.OBDASpecInput;
import it.unibz.inf.ontop.spec.OBDASpecification;

/**
 * TODO: find a better name
 */
public interface MappingTransformer {

    OBDASpecification transform(OBDASpecInput specInput, Mapping mapping, DBMetadata dbMetadata,
                                Ontology ontology, TBoxReasoner tBox)
            throws MappingException, OntologyException, DBMetadataExtractionException;
}
