SELECT

   7 AS "fieldnameQuestType", NULL AS "fieldnameLang", CAST(var0 AS VARCHAR(4000)) AS "fieldname", 
   1 AS "wellboreQuestType", NULL AS "wellboreLang", ('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(var1 AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS "wellbore"
FROM (
 (
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_CORE" QVIEW3
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'LATE PALEOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW2."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW2."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCORENUMBER" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'LATE PALEOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW3."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW3
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'DANIAN') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW2."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW2."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."LSUNPDIDLITHOSTRAT" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'OLIGOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW3."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW3
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'PALEOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW2."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW2."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."LSUNPDIDLITHOSTRAT" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW3,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW4
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'PALEOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW3."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."LSUNPDIDLITHOSTRAT" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'DANIAN') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW3."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW4
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'PALEOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW3."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."LSUNPDIDLITHOSTRAT" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'PALEOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW3."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_CORE" QVIEW3
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'EOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW2."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW2."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCORENUMBER" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW3
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'OLIGOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW2."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW2."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."LSUNPDIDLITHOSTRAT" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_CORE" QVIEW3
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'DANIAN') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW2."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW2."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCORENUMBER" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW3,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW4
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'LATE PALEOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW3."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."LSUNPDIDLITHOSTRAT" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_CORE" QVIEW3
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'OLIGOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW2."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW2."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCORENUMBER" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW3
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'EOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW2."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW2."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."LSUNPDIDLITHOSTRAT" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_CORE" QVIEW3
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'PALEOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW2."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW2."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBCORENUMBER" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'OLIGOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW3."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'EOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW3."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'DANIAN') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW3."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'EOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW3."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW4
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'LATE PALEOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW3."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."LSUNPDIDLITHOSTRAT" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW3,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW4
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'EOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW3."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."LSUNPDIDLITHOSTRAT" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW4
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'EOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW3."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."LSUNPDIDLITHOSTRAT" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW3
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'LATE PALEOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW2."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW2."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."LSUNPDIDLITHOSTRAT" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW3,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW4
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'DANIAN') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW3."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."LSUNPDIDLITHOSTRAT" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'PALEOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW3."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW4
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'OLIGOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW3."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."LSUNPDIDLITHOSTRAT" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW4
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'DANIAN') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW3."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."LSUNPDIDLITHOSTRAT" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW3,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW4
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'OLIGOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW3."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."LSUNPDIDLITHOSTRAT" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."FLDNAME" as var0, 
   QVIEW2."WLBNPDIDWELLBORE" as var1
 FROM 
"NPD"."FIELD" QVIEW1,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW2,
"NPD"."WELLBORE_SHALLOW_ALL" QVIEW3,
"NPD"."WELLBORE_CORE" QVIEW4
WHERE 
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDNAME" IS NOT NULL AND
(QVIEW2."WLBAGEATTD" = 'LATE PALEOCENE') AND
(QVIEW1."FLDNPDIDFIELD" = QVIEW2."FLDNPDIDFIELD") AND
QVIEW2."WLBNPDIDWELLBORE" IS NOT NULL AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."WLBENTRYYEAR" IS NOT NULL AND
(QVIEW3."WLBENTRYYEAR" < 1990) AND
(QVIEW2."WLBNPDIDWELLBORE" = QVIEW4."WLBNPDIDWELLBORE") AND
QVIEW4."WLBCORENUMBER" IS NOT NULL
 ) 
 
 ) SUBQALIAS