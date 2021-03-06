SELECT *
FROM (
SELECT

   7 AS "wellboreQuestType", NULL AS "wellboreLang", CAST(var0 AS VARCHAR(500)) AS "wellbore"
FROM (
 (
SELECT 
   QVIEW1."WLBWELLBORENAME" as var0
 FROM 
"PUBLIC"."WELLBORE_SHALLOW_ALL" QVIEW1,
"PUBLIC"."FIELD" QVIEW2,
"PUBLIC"."WELLBORE_NPDID_OVERVIEW" QVIEW3
WHERE 
QVIEW1."WLBWELLBORENAME" IS NOT NULL AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE"))
 
UNION
(
SELECT 
   QVIEW1."WLBWELLBORENAME" as var0
 FROM 
"PUBLIC"."WELLBORE_NPDID_OVERVIEW" QVIEW1,
"PUBLIC"."FIELD" QVIEW2
WHERE 
QVIEW1."WLBWELLBORENAME" IS NOT NULL AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE"))
 
UNION
(
SELECT 
   QVIEW1."WLBWELLBORENAME" as var0
 FROM 
"PUBLIC"."WELLBORE_NPDID_OVERVIEW" QVIEW1,
"PUBLIC"."DISCOVERY" QVIEW2
WHERE 
QVIEW1."WLBWELLBORENAME" IS NOT NULL AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE"))
 
UNION
(
SELECT 
   QVIEW1."WLBWELLBORENAME" as var0
 FROM 
"PUBLIC"."WELLBORE_DEVELOPMENT_ALL" QVIEW1,
"PUBLIC"."DISCOVERY" QVIEW2,
"PUBLIC"."WELLBORE_NPDID_OVERVIEW" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE"))
 
UNION
(
SELECT 
   QVIEW1."WLBWELLBORENAME" as var0
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1,
"PUBLIC"."FIELD" QVIEW2,
"PUBLIC"."WELLBORE_NPDID_OVERVIEW" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE"))
 
UNION
(
SELECT 
   QVIEW1."WLBWELLBORENAME" as var0
 FROM 
"PUBLIC"."WELLBORE_DEVELOPMENT_ALL" QVIEW1,
"PUBLIC"."FIELD" QVIEW2,
"PUBLIC"."WELLBORE_NPDID_OVERVIEW" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE"))
 
UNION
(
SELECT 
   QVIEW1."WLBWELLBORENAME" as var0
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1,
"PUBLIC"."DISCOVERY" QVIEW2,
"PUBLIC"."WELLBORE_NPDID_OVERVIEW" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELLBORENAME" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE"))
 
UNION
(
SELECT 
   QVIEW1."WLBWELLBORENAME" as var0
 FROM 
"PUBLIC"."WELLBORE_SHALLOW_ALL" QVIEW1,
"PUBLIC"."DISCOVERY" QVIEW2,
"PUBLIC"."WELLBORE_NPDID_OVERVIEW" QVIEW3
WHERE 
QVIEW1."WLBWELLBORENAME" IS NOT NULL AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE")
 ) 
 
 ) SUBQALIAS
) SUB_QVIEW
ORDER BY SUB_QVIEW."wellbore"

