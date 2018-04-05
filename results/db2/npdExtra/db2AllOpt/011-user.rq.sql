SELECT *
FROM (
SELECT

   7 AS "wellboreQuestType", NULL AS "wellboreLang", CAST(var0 AS VARCHAR(500)) AS "wellbore", 
   5 AS "lengthQuestType", NULL AS "lengthLang", CAST(var1 AS VARCHAR(500)) AS "length"
FROM (
 (
SELECT 
   QVIEW2."WLBWELLBORENAME" as var0, 
   QVIEW1."WLBTOTALCORELENGTH" as var1
 FROM 
"PUBLIC"."WELLBORE_CORE" QVIEW1,
"PUBLIC"."WELLBORE_DEVELOPMENT_ALL" QVIEW2
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW1."WLBTOTALCORELENGTH" > 30))
 
UNION
(
SELECT 
   QVIEW2."WLBWELLBORENAME" as var0, 
   QVIEW1."WLBTOTALCORELENGTH" as var1
 FROM 
"PUBLIC"."WELLBORE_CORE" QVIEW1,
"PUBLIC"."WELLBORE_NPDID_OVERVIEW" QVIEW2
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW1."WLBTOTALCORELENGTH" > 30))
 
UNION
(
SELECT 
   QVIEW2."WLBWELLBORENAME" as var0, 
   QVIEW1."WLBTOTALCORELENGTH" as var1
 FROM 
"PUBLIC"."WELLBORE_CORE" QVIEW1,
"PUBLIC"."WELLBORE_SHALLOW_ALL" QVIEW2
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW1."WLBTOTALCORELENGTH" > 30))
 
UNION
(
SELECT 
   QVIEW2."WLBWELLBORENAME" as var0, 
   QVIEW1."WLBTOTALCORELENGTH" as var1
 FROM 
"PUBLIC"."WELLBORE_CORE" QVIEW1,
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW2
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBTOTALCORELENGTH" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW1."WLBTOTALCORELENGTH" > 30)
 ) 
 
 ) SUBQALIAS
) SUB_QVIEW
ORDER BY SUB_QVIEW."wellbore"

