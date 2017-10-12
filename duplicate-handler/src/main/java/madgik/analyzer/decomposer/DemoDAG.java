package madgik.analyzer.decomposer;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.google.gson.Gson;
import com.google.common.reflect.TypeToken;
import com.google.gson.*;

import madgik.analyzer.decomposer.dag.NodeHashValues;
import madgik.analyzer.decomposer.federation.NamesToAliases;
import madgik.analyzer.decomposer.federation.QueryDecomposer;
import madgik.analyzer.decomposer.query.NonUnaryWhereCondition;
import madgik.analyzer.decomposer.query.Operand;
import madgik.analyzer.decomposer.query.Output;
import madgik.analyzer.decomposer.query.QueryUtils;
import madgik.analyzer.decomposer.query.SQLQuery;
import madgik.analyzer.decomposer.query.SQLQueryParser;
import madgik.analyzer.estimator.NodeSelectivityEstimator;
import madgik.analyzer.decomposer.util.InterfaceAdapter;

public class DemoDAG {

	public static final String queryExample = "SELECT *\n" + "FROM (\n" + "SELECT \n"
			+ "   7 AS \"wellboreQuestType\", NULL AS \"wellboreLang\", CAST(QVIEW1.\"wlbWellboreName\" AS VARCHAR(10485760)) AS \"wellbore\", \n"
			+ "   5 AS \"lenghtMQuestType\", NULL AS \"lenghtMLang\", CAST(QVIEW4.\"lsuCoreLenght\" AS VARCHAR(10485760)) AS \"lenghtM\", \n"
			+ "   7 AS \"companyQuestType\", NULL AS \"companyLang\", CAST(QVIEW2.\"wlbDrillingOperator\" AS VARCHAR(10485760)) AS \"company\", \n"
			+ "   4 AS \"yearQuestType\", NULL AS \"yearLang\", CAST(QVIEW2.\"wlbCompletionYear\" AS VARCHAR(10485760)) AS \"year\"\n"
			+ " FROM \n" + "\"wellbore_development_all\" QVIEW1,\n" + "\"wellbore_exploration_all\" QVIEW2,\n"
			+ "\"company\" QVIEW3,\n" + "\"strat_litho_wellbore_core\" QVIEW4,\n"
			+ "\"wellbore_npdid_overview\" QVIEW5\n" + "WHERE \n" + "QVIEW1.\"wlbWellboreName\" IS NOT NULL AND\n"
			+ "QVIEW1.\"wlbNpdidWellbore\" IS NOT NULL AND\n"
			+ "(QVIEW1.\"wlbNpdidWellbore\" = QVIEW2.\"wlbNpdidWellbore\") AND\n"
			+ "QVIEW2.\"wlbCompletionYear\" IS NOT NULL AND\n"
			+ "(QVIEW2.\"wlbDrillingOperator\" = QVIEW3.\"cmpLongName\") AND\n"
			+ "QVIEW2.\"wlbDrillingOperator\" IS NOT NULL AND\n" + "QVIEW3.\"cmpNpdidCompany\" IS NOT NULL AND\n"
			+ "(QVIEW1.\"wlbNpdidWellbore\" = QVIEW4.\"wlbNpdidWellbore\") AND\n"
			+ "(QVIEW1.\"wlbNpdidWellbore\" = QVIEW5.\"wlbNpdidWellbore\") AND\n"
			+ "QVIEW4.\"lsuNpdidLithoStrat\" IS NOT NULL AND\n" + "QVIEW4.\"lsuCoreLenght\" IS NOT NULL AND\n"
			+ "((QVIEW4.\"lsuCoreLenght\" > 50) AND (QVIEW2.\"wlbCompletionYear\" >= 2008))\n" + "UNION\n" + "SELECT \n"
			+ "   7 AS \"wellboreQuestType\", NULL AS \"wellboreLang\", CAST(QVIEW1.\"wlbWellboreName\" AS VARCHAR(10485760)) AS \"wellbore\", \n"
			+ "   5 AS \"lenghtMQuestType\", NULL AS \"lenghtMLang\", CAST(QVIEW6.\"wlbTotalCoreLength\" AS VARCHAR(10485760)) AS \"lenghtM\", \n"
			+ "   7 AS \"companyQuestType\", NULL AS \"companyLang\", CAST(QVIEW2.\"wlbDrillingOperator\" AS VARCHAR(10485760)) AS \"company\", \n"
			+ "   4 AS \"yearQuestType\", NULL AS \"yearLang\", CAST(QVIEW2.\"wlbCompletionYear\" AS VARCHAR(10485760)) AS \"year\"\n"
			+ " FROM \n" + "\"wellbore_development_all\" QVIEW1,\n" + "\"wellbore_exploration_all\" QVIEW2,\n"
			+ "\"company\" QVIEW3,\n" + "\"wellbore_core\" QVIEW4,\n" + "\"wellbore_npdid_overview\" QVIEW5,\n"
			+ "\"wellbore_core\" QVIEW6\n" + "WHERE \n" + "QVIEW1.\"wlbWellboreName\" IS NOT NULL AND\n"
			+ "QVIEW1.\"wlbNpdidWellbore\" IS NOT NULL AND\n"
			+ "(QVIEW1.\"wlbNpdidWellbore\" = QVIEW2.\"wlbNpdidWellbore\") AND\n"
			+ "QVIEW2.\"wlbCompletionYear\" IS NOT NULL AND\n"
			+ "(QVIEW2.\"wlbDrillingOperator\" = QVIEW3.\"cmpLongName\") AND\n"
			+ "QVIEW2.\"wlbDrillingOperator\" IS NOT NULL AND\n" + "QVIEW3.\"cmpNpdidCompany\" IS NOT NULL AND\n"
			+ "(QVIEW1.\"wlbNpdidWellbore\" = QVIEW4.\"wlbNpdidWellbore\") AND\n"
			+ "(QVIEW1.\"wlbNpdidWellbore\" = QVIEW5.\"wlbNpdidWellbore\") AND\n"
			+ "QVIEW4.\"wlbCoreNumber\" IS NOT NULL AND\n"
			+ "(QVIEW4.\"wlbCoreNumber\" = QVIEW6.\"wlbCoreNumber\") AND\n"
			+ "(QVIEW1.\"wlbNpdidWellbore\" = QVIEW6.\"wlbNpdidWellbore\") AND\n"
			+ "QVIEW6.\"wlbTotalCoreLength\" IS NOT NULL AND\n"
			+ "((QVIEW6.\"wlbTotalCoreLength\" > 50) AND (QVIEW2.\"wlbCompletionYear\" >= 2008))) SUB";

	public static final String queryExampleOrderBy = "SELECT * from (SELECT \n"
			+ "   7 AS \"wellboreQuestType\", NULL AS \"wellboreLang\", CAST(QVIEW1.\"wlbWellboreName\" AS VARCHAR(10485760)) AS \"wellbore\", \n"
			+ "   5 AS \"lenghtMQuestType\", NULL AS \"lenghtMLang\", CAST(QVIEW6.\"wlbTotalCoreLength\" AS VARCHAR(10485760)) AS \"lenghtM\", \n"
			+ "   7 AS \"companyQuestType\", NULL AS \"companyLang\", CAST(QVIEW3.\"cmpLongName\" AS VARCHAR(10485760)) AS \"company\", \n"
			+ "   4 AS \"yearQuestType\", NULL AS \"yearLang\", CAST(QVIEW2.\"wlbCompletionYear\" AS VARCHAR(10485760)) AS \"year\"\n"
			+ " FROM \n" + "\"wellbore_npdid_overview\" QVIEW1,\n" + "\"wellbore_development_all\" QVIEW2,\n"
			+ "\"company\" QVIEW3,\n" + "\"wellbore_exploration_all\" QVIEW4,\n" + "\"wellbore_core\" QVIEW5,\n"
			+ "\"wellbore_core\" QVIEW6,\n" + "\"wellbore_core\" QVIEW7\n" + "WHERE \n"
			+ "QVIEW1.\"wlbNpdidWellbore\" IS NOT NULL AND\n" + "QVIEW1.\"wlbWellboreName\" IS NOT NULL AND\n"
			+ "(QVIEW1.\"wlbNpdidWellbore\" = QVIEW2.\"wlbNpdidWellbore\") AND\n"
			+ "QVIEW2.\"wlbCompletionYear\" IS NOT NULL AND\n" + "QVIEW3.\"cmpLongName\" IS NOT NULL AND\n"
			+ "QVIEW3.\"cmpNpdidCompany\" IS NOT NULL AND\n"
			+ "(QVIEW3.\"cmpLongName\" = QVIEW4.\"wlbDrillingOperator\") AND\n"
			+ "(QVIEW1.\"wlbNpdidWellbore\" = QVIEW4.\"wlbNpdidWellbore\") AND\n"
			+ "(QVIEW1.\"wlbNpdidWellbore\" = QVIEW5.\"wlbNpdidWellbore\") AND\n"
			+ "QVIEW5.\"wlbCoreNumber\" IS NOT NULL AND\n"
			+ "(QVIEW5.\"wlbCoreNumber\" = QVIEW6.\"wlbCoreNumber\") AND\n"
			+ "(QVIEW1.\"wlbNpdidWellbore\" = QVIEW6.\"wlbNpdidWellbore\") AND\n"
			+ "QVIEW6.\"wlbTotalCoreLength\" IS NOT NULL AND\n"
			+ "(QVIEW5.\"wlbCoreNumber\" = QVIEW7.\"wlbCoreNumber\") AND\n"
			+ "(QVIEW7.\"wlbCoreIntervalUom\" = '000001') AND\n"
			+ "(QVIEW1.\"wlbNpdidWellbore\" = QVIEW7.\"wlbNpdidWellbore\") AND\n"
			+ "((QVIEW6.\"wlbTotalCoreLength\" > 50) AND (QVIEW2.\"wlbCompletionYear\" >= 2008))\n" + "UNION\n"
			+ "SELECT \n"
			+ "   7 AS \"wellboreQuestType\", NULL AS \"wellboreLang\", CAST(QVIEW1.\"wlbWellboreName\" AS VARCHAR(10485760)) AS \"wellbore\", \n"
			+ "   5 AS \"lenghtMQuestType\", NULL AS \"lenghtMLang\", CAST(QVIEW5.\"wlbTotalCoreLength\" AS VARCHAR(10485760)) AS \"lenghtM\", \n"
			+ "   7 AS \"companyQuestType\", NULL AS \"companyLang\", CAST(QVIEW2.\"wlbDrillingOperator\" AS VARCHAR(10485760)) AS \"company\", \n"
			+ "   4 AS \"yearQuestType\", NULL AS \"yearLang\", CAST(QVIEW2.\"wlbCompletionYear\" AS VARCHAR(10485760)) AS \"year\"\n"
			+ " FROM \n" + "\"wellbore_npdid_overview\" QVIEW1,\n" + "\"wellbore_development_all\" QVIEW2,\n"
			+ "\"company\" QVIEW3,\n" + "\"wellbore_core\" QVIEW4,\n" + "\"wellbore_core\" QVIEW5,\n"
			+ "\"wellbore_core\" QVIEW6\n" + "WHERE \n" + "QVIEW1.\"wlbNpdidWellbore\" IS NOT NULL AND\n"
			+ "QVIEW1.\"wlbWellboreName\" IS NOT NULL AND\n"
			+ "(QVIEW1.\"wlbNpdidWellbore\" = QVIEW2.\"wlbNpdidWellbore\") AND\n"
			+ "QVIEW2.\"wlbCompletionYear\" IS NOT NULL AND\n"
			+ "(QVIEW2.\"wlbDrillingOperator\" = QVIEW3.\"cmpLongName\") AND\n"
			+ "QVIEW2.\"wlbDrillingOperator\" IS NOT NULL AND\n" + "QVIEW3.\"cmpNpdidCompany\" IS NOT NULL AND\n"
			+ "(QVIEW1.\"wlbNpdidWellbore\" = QVIEW4.\"wlbNpdidWellbore\") AND\n"
			+ "QVIEW4.\"wlbCoreNumber\" IS NOT NULL AND\n"
			+ "(QVIEW4.\"wlbCoreNumber\" = QVIEW5.\"wlbCoreNumber\") AND\n"
			+ "(QVIEW1.\"wlbNpdidWellbore\" = QVIEW5.\"wlbNpdidWellbore\") AND\n"
			+ "QVIEW5.\"wlbTotalCoreLength\" IS NOT NULL AND\n"
			+ "(QVIEW4.\"wlbCoreNumber\" = QVIEW6.\"wlbCoreNumber\") AND\n"
			+ "(QVIEW6.\"wlbCoreIntervalUom\" = '000001') AND\n"
			+ "(QVIEW1.\"wlbNpdidWellbore\" = QVIEW6.\"wlbNpdidWellbore\") AND\n"
			+ "((QVIEW5.\"wlbTotalCoreLength\" > 50) AND (QVIEW2.\"wlbCompletionYear\" >= 2008))\n" + ") SUB_QVIEW\n"
			+ "ORDER BY SUB_QVIEW.\"wellbore\"";

	public static void main(String[] args) throws Exception {

		String leftjoinsimple = "select a.id from A a left join ( B b left join C c on b.id=c.id and b.n is not null)  on a.id=b.id";
		String file = readFile("/home/dimitris/example.sql");
		String simple = "select A.id from A A, B B where A.id=B.id " + "union "
				+ "select A.id from C C, A A, B B where B.name=C.name  and A.id=B.id  ";

		String testPlan = "select m1.wellbore_mud_id from " + "wellbore_mud m1, wellbore_mud m2, apaAreaGross g "
				+ "where " + "m1.wellbore_mud_id=m2.wellbore_mud_id and " + "m2.wellbore_mud_id=g.apaAreaGross_id";

		//getDFLsFromDir("/home/dimitris/Dropbox/npdsql/alllubmall/");
		 getDFLsFromDir("/home/dimitris/Dropbox/npdsql/npdnew100/");
		/*
		 * NodeHashValues hashes=new NodeHashValues(); NodeSelectivityEstimator
		 * nse = null; try { nse = new
		 * NodeSelectivityEstimator("/media/dimitris/T/exaremenpd100/" +
		 * "histograms.json"); } catch (Exception e) {
		 * 
		 * } hashes.setSelectivityEstimator(nse); SQLQuery query =
		 * SQLQueryParser.parse(testPlan, hashes); QueryDecomposer d = new
		 * QueryDecomposer(query, "/tmp/", 1, hashes);
		 * 
		 * d.setN2a(new NamesToAliases()); StringBuffer sb=new StringBuffer();
		 * for (SQLQuery s : d.getSubqueries()) { sb.append("\n");
		 * sb.append(s.toDistSQL()); } System.out.println(sb.toString());
		 */

	}

	private static void getDFLsFromDir(String dir) throws Exception {
		for (String file : readFilesFromDir(dir)) {
			System.out.println("file:" + file);
			getDFLFromFile(file);
		}
	}

	private static void getDFLFromFile(String file) throws Exception {
		String q = readFile(file);
		if (q.isEmpty()) {
			return;
		}
		NodeHashValues hashes = new NodeHashValues();

		NodeSelectivityEstimator nse = null;
		Map<Set<String>, Set<ViewInfo>> viewinfos = new HashMap<Set<String>, Set<ViewInfo>>();
		try {
			//nse = new NodeSelectivityEstimator("/media/dimitris/T/exaremelubm100/" + "histograms.json");
			 nse = new
			 NodeSelectivityEstimator("/media/dimitris/T/exaremenpd500new/" +
			 "histograms.json");
			// nse = new NodeSelectivityEstimator("/home/dimitris/" +
			// "histograms-replaced.json");
			BufferedReader br;
			br = new BufferedReader(new FileReader("/tmp/" + "views.json"));
			// br = new BufferedReader(new
			// FileReader("/media/dimitris/T/exaremelubm100/" + "views.json"));
			// br = new BufferedReader(new
			// FileReader("/media/dimitris/T/exaremenpd100new/" +
			// "views.json"));
			// convert the json string back to object
			// Gson gson = new Gson();
			Gson gson = new GsonBuilder().registerTypeAdapter(Operand.class, new InterfaceAdapter<Operand>()).create();
			java.lang.reflect.Type viewType = new TypeToken<Map<String, Set<ViewInfo>>>() {
			}.getType();
			viewinfos = gson.fromJson(br, viewType);
			/*
			 * System.out.println(viewinfos); for(Set<ViewInfo>
			 * vi:viewinfos.values()){ Set<ViewInfo> toAdd=new
			 * HashSet<ViewInfo>(); ViewInfo[] viewArray = vi.toArray(new
			 * ViewInfo[vi.size()]); int initialSize=vi.size(); for(int
			 * i=0;i<initialSize;i++){ ViewInfo info=viewArray[i];
			 * if(info==null){ continue; } ViewInfo combined=new
			 * ViewInfo(info.getTableName()+"all", info.getOutput()); boolean
			 * add=false; if(info.getNumberOfConditions()!=1){ continue; }
			 * combined.addConditions(info);
			 * 
			 * for(int j=i+1;j<initialSize;j++){ ViewInfo info2=viewArray[j];
			 * if(info2==null){ continue; }
			 * if(info2.getOutput().equals(info.getOutput()) &&
			 * info2.getNumberOfConditions()==1){ combined.addConditions(info2);
			 * add=true;
			 * 
			 * viewArray[j]=null; } } if(add){ toAdd.add(combined); }
			 * viewArray[i]=null; } for(ViewInfo vi2:toAdd){ vi2.setOr(true);
			 * vi.add(vi2); } } String jsonStr = gson.toJson(viewinfos,
			 * viewType);
			 * 
			 * PrintWriter writer = new
			 * PrintWriter("/media/dimitris/T/exaremelubm100/" +
			 * "views.json.bak", "UTF-8"); writer.println(jsonStr);
			 * writer.close();
			 */
		} catch (Exception e) {
			e.printStackTrace(System.out);
		}
		hashes.setSelectivityEstimator(nse);
		SQLQuery query = SQLQueryParser.parse(q, hashes);
		QueryDecomposer d = new QueryDecomposer(query, "/tmp/", 1, hashes);
		d.setViewInfos(viewinfos);

		d.setN2a(new NamesToAliases());
		StringBuffer sb = new StringBuffer();
		List<SQLQuery> result = d.getSubqueries();
		boolean mysql = true;
		SQLQuery last = result.get(result.size() - 1);
		if (last.getUnionqueries().isEmpty()) {
			if (mysql) {
				for (Output out : last.getOutputs()) {
					Operand o = out.getObject();
					out.setObject(QueryUtils.convertToMySQLDialect(o));
				}
				for (NonUnaryWhereCondition bwc : last.getBinaryWhereConditions()) {
					for (Operand o : bwc.getOperands()) {
						o = QueryUtils.convertToMySQLDialect(o);
					}
				}
			}
			writeFile(file + ".dfl", last.toSQL());
		} else {
			sb.append("SELECT * FROM ( \n");
			
			String del = "";
			for (SQLQuery s : last.getUnionqueries()) {
				if (mysql) {
					for (Output out : s.getOutputs()) {
						Operand o = out.getObject();
						out.setObject(QueryUtils.convertToMySQLDialect(o));
					}
					for (NonUnaryWhereCondition bwc : s.getBinaryWhereConditions()) {
						for (Operand o : bwc.getOperands()) {
							o = QueryUtils.convertToMySQLDialect(o);
						}
					}
				}
				sb.append("\n");
				sb.append(del);
				String sql = s.toSQL();
				sb.append(sql.substring(0, sql.length() - 1));
				del = " UNION ALL \n";
			}
			sb.append(" \n ) q");
			writeFile(file + ".dfl", sb.toString());
		}
	}

	private static String readFile(String file) throws IOException {
		BufferedReader reader = new BufferedReader(new FileReader(file));
		String line = null;
		StringBuilder stringBuilder = new StringBuilder();
		String ls = System.getProperty("line.separator");

		while ((line = reader.readLine()) != null) {
			stringBuilder.append(line);
			stringBuilder.append(ls);
		}
		reader.close();
		return stringBuilder.toString();
	}

	private static String[] readFilesFromDir(String string) throws IOException {
		File folder = new File(string);
		File[] listOfFiles = folder.listFiles();
		List<String> files = new ArrayList<String>();
		for (int i = 0; i < listOfFiles.length; i++) {
			if (listOfFiles[i].isFile() && listOfFiles[i].getCanonicalPath().endsWith("30.q.sql")) {
				files.add(listOfFiles[i].getCanonicalPath());
			}
		}
		return files.toArray(new String[files.size()]);
	}

	public static void writeFile(String filename, String string) {
		writeFile(filename, string.getBytes());
	}

	public static void writeFile(String filename, byte[] string) {
		try {
			File file = new File(filename);
			file.getParentFile().mkdirs();
			OutputStream out = new FileOutputStream(file);
			out.write(string);
			out.close();
		} catch (Exception e) {
			System.err.println("Error writing file: " + filename);
			e.printStackTrace();
		}
	}

}