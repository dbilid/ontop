package it.unibz.krdb.obda.parser;


import it.unibz.krdb.obda.io.ModelIOManager;
import it.unibz.krdb.obda.model.OBDADataFactory;
import it.unibz.krdb.obda.model.OBDAModel;
import it.unibz.krdb.obda.model.impl.OBDADataFactoryImpl;
import it.unibz.krdb.obda.owlrefplatform.core.QuestPreferences;
import it.unibz.krdb.obda.owlrefplatform.owlapi3.*;
import org.junit.Before;
import org.junit.Test;
import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.model.OWLOntology;
import org.semanticweb.owlapi.model.OWLOntologyManager;
import org.semanticweb.owlapi.reasoner.SimpleConfiguration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.Properties;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

/**
 * Class to test if annotation property can be treated as data property
 *
 *
 */
public class AnnotationTest {

    private OBDADataFactory fac;

    Logger log = LoggerFactory.getLogger(this.getClass());
    private OBDAModel obdaModel;
    private OWLOntology ontology;

    final String owlFile = "src/test/resources/annotation/movieontology.owl";
    final String obdaFile = "src/test/resources/annotation/newSyntaxMovieontology.obda";

    @Before
    public void setUp() throws Exception {

        fac = OBDADataFactoryImpl.getInstance();

        // Loading the OWL file
        OWLOntologyManager manager = OWLManager.createOWLOntologyManager();
        ontology = manager.loadOntologyFromOntologyDocument((new File(owlFile)));

        // Loading the OBDA data
        obdaModel = fac.getOBDAModel();

        ModelIOManager ioManager = new ModelIOManager(obdaModel);
        ioManager.load(obdaFile);

    }




    @Test
    public void testAnnotationIRI() throws Exception {

        QuestPreferences p = new QuestPreferences();

        String queryBind = "PREFIX dc: <http://purl.org/dc/elements/1.1/>" +
                "PREFIX mo:		<http://www.movieontology.org/2009/10/01/movieontology.owl#>" +
                "\n" +
                "SELECT  ?r " +
                " ?movie \n" +
                "WHERE {?movie dc:description ?r . \n" +

                "}";



        String results = runTestQuery(p, queryBind);
        assertEquals("<http://www.imdb.com/title/Bästisar>", results);
    }

    @Test
    public void testAnnotationLiteral() throws Exception {

        QuestPreferences p = new QuestPreferences();

        String queryBind = "PREFIX dc: <http://purl.org/dc/elements/1.1/>" +
                "PREFIX mo:		<http://www.movieontology.org/2009/10/01/movieontology.owl#>" +
                "\n" +
                "SELECT  ?r " +
                " ?movie \n" +
                "WHERE {?movie dc:date ?r . \n" +

                "}";



        String results = runTestQuery(p, queryBind);
        assertEquals("\"2006\"", results);
    }

    @Test
    public void testAnnotationString() throws Exception {

        QuestPreferences p = new QuestPreferences();

        String queryBind = "PREFIX dbpedia: <http://dbpedia.org/ontology/>" +
                "PREFIX mo:		<http://www.movieontology.org/2009/10/01/movieontology.owl#>" +
                "\n" +
                "SELECT  ?r " +
                " ?movie \n" +
                "WHERE {?movie dbpedia:gross ?r . \n" +

                "}";



        String results = runTestQuery(p, queryBind);
        assertEquals("\"$446,237 (Worldwide)\"^^xsd:string", results);
    }


    @Test
    public void testAnnotationDatabaseValue() throws Exception {

        QuestPreferences p = new QuestPreferences();

        String queryBind = "PREFIX dc: <http://purl.org/dc/elements/1.1/>" +
                "PREFIX mo:		<http://www.movieontology.org/2009/10/01/movieontology.owl#>" +
                "\n" +
                "SELECT  ?r " +
                " ?movie \n" +
                "WHERE {?movie mo:belongsToGenre ?r . \n" +

                "}";



        String results = runTestQuery(p, queryBind);
        assertEquals("\"389486\"^^xsd:integer", results);
    }

    @Test //no check is executed to verify that the value is a valid uri
    public void testNewSyntaxUri() throws Exception {

        QuestPreferences p = new QuestPreferences();

        String queryBind = "PREFIX dc: <http://purl.org/dc/elements/1.1/>" +
                "PREFIX mo:		<http://www.movieontology.org/2009/10/01/movieontology.owl#>" +
                "\n" +
                "SELECT  ?r " +
                " ?movie \n" +
                "WHERE {?movie mo:hasMaleActor ?r . \n" +

                "}";



        String results = runTestQuery(p, queryBind);
        assertEquals("<1>", results);
    }

    @Test
    public void testAnnotationInt() throws Exception {

        QuestPreferences p = new QuestPreferences();

        String queryBind = "PREFIX dbpedia: <http://dbpedia.org/ontology/>" +
                "PREFIX mo:		<http://www.movieontology.org/2009/10/01/movieontology.owl#>" +
                "\n" +
                "SELECT  ?r " +
                " ?movie \n" +
                "WHERE {?movie dbpedia:productionStartYear ?r . \n" +

                "}";



        String results = runTestQuery(p, queryBind);
        assertEquals("\"2006\"^^xsd:int", results);
    }

    private String runTestQuery(Properties p, String query) throws Exception {

        // Creating a new instance of the reasoner
        QuestOWLFactory factory = new QuestOWLFactory();
        factory.setOBDAController(obdaModel);

        factory.setPreferenceHolder(p);

        QuestOWL reasoner = (QuestOWL) factory.createReasoner(ontology, new SimpleConfiguration());

        // Now we are ready for querying
        QuestOWLConnection conn = reasoner.getConnection();
        QuestOWLStatement st = conn.createStatement();


        log.debug("Executing query: ");
        log.debug("Query: \n{}", query);

        long start = System.nanoTime();
        QuestOWLResultSet res = st.executeTuple(query);
        long end = System.nanoTime();

        double time = (end - start) / 1000;
        String result = "";
        int count = 0;
                while (res.nextRow()) {
                    count += 1;
                    if(count == 1) {
                    for (int i = 1; i <= res.getColumnCount(); i++) {
                         log.debug("Example result " + res.getSignature().get(i-1) + " = " + res.getOWLObject(i));

                      }
                        result = res.getOWLObject("r").toString();
                    }
                }
                log.debug("Total results: {}", count);

                assertFalse(count == 0);

        log.debug("Elapsed time: {} ms", time);

        return result;



    }


}
