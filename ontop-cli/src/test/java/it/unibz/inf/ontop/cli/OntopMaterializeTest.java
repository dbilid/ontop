package it.unibz.inf.ontop.cli;

import org.junit.Ignore;
import org.junit.Test;

public class OntopMaterializeTest {

    @Test
    public void testOntopHelpMaterialize(){
        Ontop.main("help", "materialize");
    }


    @Ignore("too expensive")
    @Test
    public void testOntopMaterializeSeparateFiles (){
        String[] argv = {"materialize",
                "-m", "/Users/xiao/Projects/npd-benchmark/mappings/postgres/no-spatial/npd-v2-ql_a_postgres.obda",
                "-t", "/Users/xiao/Projects/npd-benchmark/ontology/vocabulary.owl",
                "-f", "turtle", "-o", "/tmp/npd", "--separate-files"};
        Ontop.main(argv);
    }

    @Ignore("too expensive")
    @Test
    public void testOntopMaterializeSingleFile (){
        String[] argv = {"materialize",
                "-m", "/Users/xiao/Projects/npd-benchmark/mappings/postgres/no-spatial/npd-v2-ql_a_postgres.obda",
                "-t", "/Users/xiao/Projects/npd-benchmark/ontology/vocabulary.owl",
                "-f", "turtle", "-o", "/tmp/npd/npd.ttl"};
        Ontop.main(argv);
    }

    @Ignore("too expensive")
    @Test
    public void testOntopMaterializeR2RML (){
        String[] argv = {"materialize",
                "-m", "/Users/xiao/Projects/iswc2014-benchmark/LUBM/univ-benchQL.ttl",
                "-t", "/Users/xiao/Projects/iswc2014-benchmark/LUBM/univ-benchQL.owl",
                "-f", "turtle", "-o", "/tmp/univ-benchQL-triples.ttl",
                "-l",	"jdbc:mysql://10.7.20.39/lubm1",
                "-u",	"fish",
                "-p",	"fish",
                "-d",	"com.mysql.jdbc.Driver"
        };
        Ontop.main(argv);
    }

    @Ignore("too expensive")
    @Test
    public void testOntopMaterializeR2RMLNoOntology (){
        String[] argv = {"materialize",
                "-m", "/Users/xiao/Projects/iswc2014-benchmark/LUBM/univ-benchQL.ttl",
                "-f", "turtle", "-o", "/tmp/univ-benchQL-triples.ttl",
                "-l",	"jdbc:mysql://10.7.20.39/lubm1",
                "-u",	"fish",
                "-p",	"fish",
                "-d",	"com.mysql.jdbc.Driver"
        };
        Ontop.main(argv);
    }

    @Ignore("too expensive")
    @Test
    public void testOntopMaterializeR2RMLSeparateFiles (){
        String[] argv = {"materialize", "-m", "/Users/xiao/Projects/iswc2014-benchmark/LUBM/univ-benchQL.ttl",
                "-t", "/Users/xiao/Projects/iswc2014-benchmark/LUBM/univ-benchQL.owl",
                "-f", "turtle", "-o", "/tmp/",
                "-U",	"jdbc:mysql://10.7.20.39/lubm1",
                "-u",	"fish",
                "-p",	"fish",
                "-d",	"com.mysql.jdbc.Driver",
                "--separate-files"
        };
        Ontop.main(argv);
    }

    @Test
    public void testOntopMaterializeNoStreamResults (){
        String[] argv = {"materialize", "-m", "../quest-test/src/test/resources/example/exampleBooks.obda",
                "-t", "../quest-test/src/test/resources/example/exampleBooks.owl",
                "-f", "turtle", "-o", "/tmp/books.ttl",
                "--no-streaming"
        };
        Ontop.main(argv);
    }

    @Ignore("too expensive")
    @Test
    public void testOntopMaterializeAnnotation (){
        String[] argv = {"materialize", "-m", "../quest-test/src/test/resources/annotation/doid.obda",
                "-t", "../quest-test/src/test/resources/annotation/doid.owl",
                "-f", "turtle", "-o", "/tmp/doid.ttl",

        };
        Ontop.main(argv);
    }

    @Ignore("too expensive")
    @Test
    public void testOntopMaterializeSeparateFiles2 (){
        String[] argv = {"materialize",
                "-m", "../quest-test/src/test/resources/example/npd-v2-ql_a.ttl",
                "-t", "../quest-test/src/test/resources/example/npd-v2-ql_a.owl",
                "-f", "turtle", "-o", "/tmp/npd",
                "-l",	"jdbc:mysql://10.7.20.39/npd",
                "-u",	"fish",
                "-p",	"fish",
                "-d",	"com.mysql.jdbc.Driver",
                "--separate-files"};
        Ontop.main(argv);

    }

}
