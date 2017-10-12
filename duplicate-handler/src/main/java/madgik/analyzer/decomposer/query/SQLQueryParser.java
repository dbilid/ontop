/**
 * Copyright MaDgIK Group 2010 - 2015.
 */
package madgik.analyzer.decomposer.query;

import com.foundationdb.sql.parser.StatementNode;

import madgik.analyzer.decomposer.dag.NodeHashValues;
import madgik.analyzer.decomposer.federation.DistSQLParser;
import madgik.analyzer.decomposer.query.visitors.SQLQueryVisitor;

/**
 * @author heraldkllapi
 */
public class SQLQueryParser {
    public static SQLQuery parse(String queryString, NodeHashValues hashes) throws Exception {
        DistSQLParser parser = new DistSQLParser();
        long sttt=System.currentTimeMillis();
        StatementNode node = parser.parseStatement(queryString);
        System.out.println(System.currentTimeMillis()-sttt);
        //node.treePrint();
        // Traverse the qury tree
        SQLQuery query = new SQLQuery();
        //query.readDBInfo();
        SQLQueryVisitor visitor = new SQLQueryVisitor(query, hashes);
        node.accept(visitor);
        return query;
    }
}
