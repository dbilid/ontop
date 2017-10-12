package madgik.analyzer.decomposer.util;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Properties;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import org.sqlite.javax.SQLiteConnectionPoolDataSource;

import madgik.exareme.master.queryProcessor.analyzer.fanalyzer.OptiqueAnalyzer;
import madgik.exareme.master.queryProcessor.analyzer.stat.StatUtils;
import madgik.analyzer.decomposer.DecomposerUtils;
import madgik.analyzer.decomposer.federation.DB;
import madgik.analyzer.decomposer.federation.DataImporter;
import madgik.analyzer.decomposer.query.Column;
import madgik.analyzer.decomposer.query.SQLQuery;
import madgik.analyzer.decomposer.query.Table;
import madgik.analyzer.estimator.db.Schema;

public class PostgresImporter {

	public static void main(String[] args) throws Exception {
		boolean importtables=false;
		boolean analyze=true;
		boolean analyzeSQLITE=false;
		boolean vacuum = false;
		String path="/media/dimitris/T/exaremefish/";
		DB dbinfo=new DB("ex");
		dbinfo.setSchema("public");
		dbinfo.setDriver("org.postgresql.Driver");
		dbinfo.setPass("gray769watt724!@#");
		dbinfo.setUser("postgres");
		dbinfo.setMadisString("postgres h:localhost port:5432 u:postgres p:gray769watt724!@# db:npd_new_scale500");
		dbinfo.setURL("jdbc:postgresql://localhost/npd_new_scale500");
		DB dbinfo2=new DB("ex2");
		dbinfo2.setSchema("lubm100");
		dbinfo2.setDriver("com.mysql.jdbc.Driver");
		dbinfo2.setPass("gray769watt724!@#");
		dbinfo2.setUser("root");
		dbinfo2.setMadisString("mysql h:127.0.0.1 u:root lubm100");
		dbinfo2.setURL("jdbc:mysql://127.0.0.1:3306/lubm100");
		/*String url = "jdbc:postgresql://localhost/npd_new_scale100";
		Properties props = new Properties();
		props.setProperty("user","postgres");
		props.setProperty("password","gray769watt724!@#");
		props.setProperty("ssl","true");
		Connection conn = DriverManager.getConnection(url, props);
		DatabaseMetaData md = conn.getMetaData();
		ResultSet rs = md.getTables(null, "public", "%", new String[] {"TABLE"});*/
		String url = "jdbc:mysql://127.0.0.1:3306/lubm100";
		Properties props = new Properties();
		props.setProperty("user","root");
		props.setProperty("password","gray769watt724!@#");
		Connection conn = DriverManager.getConnection(url, props);
		DatabaseMetaData md = conn.getMetaData();
		ResultSet rs = md.getTables(null, "lubm100", "%", new String[] {"TABLE"});
		while (rs.next()) {
			String tablename=rs.getString(3);
			//if(tablename.compareTo("collaborators")!=0){
			//	continue;
			//}
			//if(!tablename.equalsIgnoreCase("wellbore_development_all")&&!tablename.equalsIgnoreCase("wellbore_exploration_all")&&!tablename.equalsIgnoreCase("wellbore_core")){
			//	continue;
			//}
			SQLQuery s=new SQLQuery();
			s.setFederated(true);
			s.setMadisFunctionString("mysql h:localhost u:root");
			s.setTemporaryTableName(tablename.toLowerCase());
			s.addInputTable(new Table(tablename, tablename));
			ResultSet rs2 = md.getColumns(null, null, rs.getString(3), null);
			Set<String> attrs = new HashSet<String>();

	            while (rs2.next()) {
	            	String columnname=rs2.getString(4);
	            //	if(!columnname.equalsIgnoreCase("dscNpdidDiscovery")){
	            //		continue;
	           // 	}
	            	if(columnname.contains("-"))
	            		continue;
	            	attrs.add(columnname);
	                //Column c=new Column(tablename, columnname);
	                s.addOutput(tablename, columnname);
	            }
	            rs2.close();
	            
	            /*ResultSet rs3 = md.getIndexInfo(null, null, rs.getString(3), false, false);
	            while (rs3.next()) {
	            	System.out.println("Index for table: "+tablename+" column: "+rs3.getString(9));
	            }
	            rs3.close();*/
	            if(importtables){
	            	ResultSet rs3 = md.getPrimaryKeys(null, null, rs.getString(3));
	    			int keys=0;
	    			String keyDeclaration="";
	    			String del="";
	    	            while (rs3.next()) {
	    	            	keys++;
	    	            	
	    	            	String columnname=rs3.getString(4);
	    	            	keyDeclaration+=del+columnname;
	    	            	del=", ";
	    	            //	if(!columnname.equalsIgnoreCase("dscNpdidDiscovery")){
	    	            //		continue;
	    	           // 	}
	    	                //Column c=new Column(tablename, columnname);
	    	            }
	    	            rs3.close();
	    	            if(keys>0){
	    	            	keyDeclaration=" ,PRIMARY KEY("+keyDeclaration+")";
	    	            }
	    	            if(keys>1){
	    	            	
	    	            }
	           ExecutorService es = Executors.newCachedThreadPool();
						DataImporter di = new DataImporter(s, path, dbinfo2);
						di.setAddToRegisrty(true);
						di.setPrimaryKey(keyDeclaration);
							if(keys>1){
	    	            	di.setWithoutRowID(true);
	    	            }
						es.execute(di);
				es.shutdown();
				es.awaitTermination(40, TimeUnit.MINUTES);
	            }
	            if(analyze){
	            	//tablename="pipLine";
	            	//attrs.clear();
	            	///attrs.add("pipNpdidPipe");
	            	//if(tablename.toLowerCase().compareTo("occurrence_x")>0){
					OptiqueAnalyzer fa = new OptiqueAnalyzer(path, dbinfo2);
					fa.setUseDataImporter(false);
					System.out.println("analyzing: "+tablename);
					Schema sch = fa.analyzeAttrs(tablename.toLowerCase(), attrs);
					// change table name back to adding DB id
					
					StatUtils.addSchemaToFile(path + "histograms.json", sch);
					//break;
	            	//}
	            }
	            if(analyzeSQLITE){
	            	Class.forName("org.sqlite.JDBC");
	   			 org.sqlite.SQLiteConfig config = new org.sqlite.SQLiteConfig();
	   			 config.setCacheSize(1200000);
	   			 config.setPageSize(4096);
	   			 SQLiteConnectionPoolDataSource dataSource = new SQLiteConnectionPoolDataSource();
	   			    dataSource.setUrl("jdbc:sqlite:"+path+tablename.toLowerCase().replace("NCS", "ncs")+".0.db");
	   			    dataSource.setConfig(config);
	   			Connection connection=dataSource.getConnection();//DriverManager.getConnection("jdbc:sqlite:test.db");
	   			Statement st=connection.createStatement();
	   			st.execute("analyze "+tablename);
	   			st.close();
	   			connection.close();
	            }
	            if(vacuum){
	            	Class.forName("org.sqlite.JDBC");
	            	System.out.println("executing vacuum on table "+tablename);
	   			 org.sqlite.SQLiteConfig config = new org.sqlite.SQLiteConfig();
	   			 config.setCacheSize(1200000);
	   			 config.setPageSize(4096);
	   			 SQLiteConnectionPoolDataSource dataSource = new SQLiteConnectionPoolDataSource();
	   			    dataSource.setUrl("jdbc:sqlite:"+path+tablename.toLowerCase().replace("NCS", "ncs")+".0.db");
	   			    dataSource.setConfig(config);
	   			Connection connection=dataSource.getConnection();//DriverManager.getConnection("jdbc:sqlite:test.db");
	   			Statement st=connection.createStatement();
	   			st.execute("vacuum");
	   			st.close();
	   			connection.close();
	            }
		}
		rs.close();
		conn.close();

	}

}
