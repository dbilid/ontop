SELECT *
FROM (
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW3."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW2."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW5."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW2."WLBCOMPLETIONYEAR" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW5."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW6."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
((QVIEW2."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW5."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW2."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW2."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW4."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_CORE" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW2."WLBCOMPLETIONYEAR" IS NOT NULL AND
QVIEW2."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCORENUMBER" IS NOT NULL AND
(QVIEW3."WLBCORENUMBER" = QVIEW4."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW3."WLBCORENUMBER" = QVIEW5."WLBCORENUMBER") AND
(QVIEW5."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
((QVIEW2."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW4."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW3."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW2."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW5."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW2."WLBCOMPLETIONYEAR" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW5."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW6."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
((QVIEW2."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW5."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW3."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW2."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW5."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_NPDID_OVERVIEW" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW2."WLBCOMPLETIONYEAR" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW5."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW6."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
((QVIEW2."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW5."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW4."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW3."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW6."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW3,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6,
"NPD"."WELLBORE_CORE" QVIEW7
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCOMPLETIONYEAR" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBCORENUMBER" IS NOT NULL AND
(QVIEW5."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
QVIEW6."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW5."WLBCORENUMBER" = QVIEW7."WLBCORENUMBER") AND
(QVIEW7."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW7."WLBNPDIDWELLBORE") AND
((QVIEW3."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW6."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW2."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW3."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW5."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCOMPLETIONYEAR" IS NOT NULL AND
QVIEW2."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW5."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW6."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
((QVIEW3."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW5."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW3."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW3."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW5."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCOMPLETIONYEAR" IS NOT NULL AND
QVIEW3."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW5."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW6."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
((QVIEW3."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW5."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW4."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW3."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW6."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW3,
"NPD"."WELLBORE_NPDID_OVERVIEW" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6,
"NPD"."WELLBORE_CORE" QVIEW7
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCOMPLETIONYEAR" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBCORENUMBER" IS NOT NULL AND
(QVIEW5."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
QVIEW6."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW5."WLBCORENUMBER" = QVIEW7."WLBCORENUMBER") AND
(QVIEW7."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW7."WLBNPDIDWELLBORE") AND
((QVIEW3."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW6."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW3."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW3."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW5."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCOMPLETIONYEAR" IS NOT NULL AND
QVIEW3."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW5."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW6."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
((QVIEW3."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW5."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW2."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW3."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW5."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCOMPLETIONYEAR" IS NOT NULL AND
QVIEW2."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW5."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW6."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
((QVIEW3."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW5."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW4."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW3."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW6."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6,
"NPD"."WELLBORE_CORE" QVIEW7
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCOMPLETIONYEAR" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBCORENUMBER" IS NOT NULL AND
(QVIEW5."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
QVIEW6."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW5."WLBCORENUMBER" = QVIEW7."WLBCORENUMBER") AND
(QVIEW7."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW7."WLBNPDIDWELLBORE") AND
((QVIEW3."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW6."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW4."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW3."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW6."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3,
"NPD"."WELLBORE_NPDID_OVERVIEW" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6,
"NPD"."WELLBORE_CORE" QVIEW7
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCOMPLETIONYEAR" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBCORENUMBER" IS NOT NULL AND
(QVIEW5."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
QVIEW6."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW5."WLBCORENUMBER" = QVIEW7."WLBCORENUMBER") AND
(QVIEW7."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW7."WLBNPDIDWELLBORE") AND
((QVIEW3."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW6."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW2."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW3."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW5."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW2,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCOMPLETIONYEAR" IS NOT NULL AND
QVIEW2."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW5."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW6."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
((QVIEW3."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW5."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW3."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW3."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW5."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW2,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCOMPLETIONYEAR" IS NOT NULL AND
QVIEW3."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW5."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW6."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
((QVIEW3."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW5."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW4."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW3."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW6."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW2,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW3,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6,
"NPD"."WELLBORE_CORE" QVIEW7
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCOMPLETIONYEAR" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBCORENUMBER" IS NOT NULL AND
(QVIEW5."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
QVIEW6."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW5."WLBCORENUMBER" = QVIEW7."WLBCORENUMBER") AND
(QVIEW7."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW7."WLBNPDIDWELLBORE") AND
((QVIEW3."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW6."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW4."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW3."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW6."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW2,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW3,
"NPD"."WELLBORE_NPDID_OVERVIEW" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6,
"NPD"."WELLBORE_CORE" QVIEW7
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCOMPLETIONYEAR" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBCORENUMBER" IS NOT NULL AND
(QVIEW5."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
QVIEW6."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW5."WLBCORENUMBER" = QVIEW7."WLBCORENUMBER") AND
(QVIEW7."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW7."WLBNPDIDWELLBORE") AND
((QVIEW3."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW6."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW2."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW3."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW5."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW2,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCOMPLETIONYEAR" IS NOT NULL AND
QVIEW2."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW5."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW6."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
((QVIEW3."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW5."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW4."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW3."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW6."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW2,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW3,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6,
"NPD"."WELLBORE_CORE" QVIEW7
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCOMPLETIONYEAR" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBCORENUMBER" IS NOT NULL AND
(QVIEW5."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
QVIEW6."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW5."WLBCORENUMBER" = QVIEW7."WLBCORENUMBER") AND
(QVIEW7."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW7."WLBNPDIDWELLBORE") AND
((QVIEW3."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW6."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW3."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW3."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW5."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW2,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCOMPLETIONYEAR" IS NOT NULL AND
QVIEW3."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW5."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW6."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
((QVIEW3."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW5."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW4."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW3."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW6."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW2,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW3,
"NPD"."WELLBORE_NPDID_OVERVIEW" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6,
"NPD"."WELLBORE_CORE" QVIEW7
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCOMPLETIONYEAR" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBCORENUMBER" IS NOT NULL AND
(QVIEW5."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
QVIEW6."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW5."WLBCORENUMBER" = QVIEW7."WLBCORENUMBER") AND
(QVIEW7."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW7."WLBNPDIDWELLBORE") AND
((QVIEW3."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW6."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW2."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW2."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW4."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW2,
"NPD"."WELLBORE_CORE" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW2."WLBCOMPLETIONYEAR" IS NOT NULL AND
QVIEW2."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCORENUMBER" IS NOT NULL AND
(QVIEW3."WLBCORENUMBER" = QVIEW4."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW3."WLBCORENUMBER" = QVIEW5."WLBCORENUMBER") AND
(QVIEW5."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
((QVIEW2."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW4."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW3."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW2."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW5."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW2,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW2."WLBCOMPLETIONYEAR" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW5."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW6."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
((QVIEW2."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW5."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW3."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW2."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW5."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW2,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW2."WLBCOMPLETIONYEAR" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW5."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW6."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
((QVIEW2."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW5."WLBTOTALCORELENGTH" > 50))
UNION
SELECT 
   7 AS "wellboreQuestType", NULL AS "wellboreLang", QVIEW3."WLBWELLBORENAME" AS "wellbore", 
   4 AS "yearQuestType", NULL AS "yearLang", CAST(QVIEW2."WLBCOMPLETIONYEAR" AS VARCHAR(4000)) AS "year", 
   5 AS "lenghtMQuestType", NULL AS "lenghtMLang", CAST(QVIEW5."WLBTOTALCORELENGTH" AS VARCHAR(4000)) AS "lenghtM", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW1."CMPLONGNAME" AS "company"
 FROM 
"NPD"."COMPANY" QVIEW1,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW2,
"NPD"."WELLBORE_NPDID_OVERVIEW" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4,
"NPD"."WELLBORE_CORE" QVIEW5,
"NPD"."WELLBORE_CORE" QVIEW6
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."CMPLONGNAME" IS NOT NULL AND
(QVIEW1."CMPLONGNAME" = QVIEW2."WLBDRILLINGOPERATOR") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW2."WLBCOMPLETIONYEAR" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW5."WLBCORENUMBER") AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW5."WLBNPDIDWELLBORE") AND
QVIEW5."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW4."WLBCORENUMBER" = QVIEW6."WLBCORENUMBER") AND
(QVIEW6."WLBCOREINTERVALUOM" = '[m   ]') AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW6."WLBNPDIDWELLBORE") AND
((QVIEW2."WLBCOMPLETIONYEAR" >= 2008) AND (QVIEW5."WLBTOTALCORELENGTH" > 50))
) SUB_QVIEW

ORDER BY SUB_QVIEW."wellbore"