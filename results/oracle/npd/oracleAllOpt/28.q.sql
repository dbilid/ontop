SELECT

   1 AS "wellboreQuestType", NULL AS "wellboreLang", ('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(var0 AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS "wellbore", 
   1 AS "wellQuestType", NULL AS "wellLang", ('http://sws.ifi.uio.no/data/npd-v2/well/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(var1 AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS "well", 
   1 AS "wcQuestType", NULL AS "wcLang", ('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(var2 AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D') || '/core/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(var3 AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS "wc"
FROM (
 (
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."WLBCORENUMBER" as var3
 FROM 
"NPD"."WELLBORE_NPDID_OVERVIEW" QVIEW1,
"NPD"."WELLBORE_CORE" QVIEW2,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."WLBCORENUMBER" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."DSCNPDIDDISCOVERY" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."WLBCORENUMBER" as var3
 FROM 
"NPD"."WELLBORE_NPDID_OVERVIEW" QVIEW1,
"NPD"."WELLBORE_CORE" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."WLBCORENUMBER" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."DSCNPDIDDISCOVERY" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."WLBCORENUMBER" as var3
 FROM 
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW1,
"NPD"."WELLBORE_CORE" QVIEW2,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."WLBCORENUMBER" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE"))
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."WLBCORENUMBER" as var3
 FROM 
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW1,
"NPD"."WELLBORE_CORE" QVIEW2
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."WLBCORENUMBER" IS NOT NULL AND
QVIEW1."DSCNPDIDDISCOVERY" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."WLBCORENUMBER" as var3
 FROM 
"NPD"."WELLBORE_NPDID_OVERVIEW" QVIEW1,
"NPD"."WELLBORE_CORE" QVIEW2,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."WLBCORENUMBER" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE"))
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."WLBCORENUMBER" as var3
 FROM 
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW1,
"NPD"."WELLBORE_CORE" QVIEW2
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."WLBCORENUMBER" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."WLBCORENUMBER" as var3
 FROM 
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW1,
"NPD"."WELLBORE_CORE" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."WLBCORENUMBER" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE"))
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."WLBCORENUMBER" as var3
 FROM 
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW1,
"NPD"."WELLBORE_CORE" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."WLBCORENUMBER" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."DSCNPDIDDISCOVERY" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."WLBCORENUMBER" as var3
 FROM 
"NPD"."WELLBORE_NPDID_OVERVIEW" QVIEW1,
"NPD"."WELLBORE_CORE" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."WLBCORENUMBER" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE"))
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."WLBCORENUMBER" as var3
 FROM 
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW1,
"NPD"."WELLBORE_CORE" QVIEW2
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."WLBCORENUMBER" IS NOT NULL AND
QVIEW1."DSCNPDIDDISCOVERY" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."WLBCORENUMBER" as var3
 FROM 
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW1,
"NPD"."WELLBORE_CORE" QVIEW2,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."WLBCORENUMBER" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."DSCNPDIDDISCOVERY" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."WLBCORENUMBER" as var3
 FROM 
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW1,
"NPD"."WELLBORE_CORE" QVIEW2
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."WLBCORENUMBER" IS NOT NULL
 ) 
) SUBQALIAS 
 UNION ALL
SELECT

   1 AS "wellboreQuestType", NULL AS "wellboreLang", ('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(var0 AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS "wellbore", 
   1 AS "wellQuestType", NULL AS "wellLang", ('http://sws.ifi.uio.no/data/npd-v2/well/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(var1 AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS "well", 
   1 AS "wcQuestType", NULL AS "wcLang", ('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(var2 AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D') || '/stratum/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(var3 AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D') || '/cores') AS "wc"
FROM (
 (
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."LSUNPDIDLITHOSTRAT" as var3
 FROM 
"NPD"."WELLBORE_NPDID_OVERVIEW" QVIEW1,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."LSUNPDIDLITHOSTRAT" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE"))
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."LSUNPDIDLITHOSTRAT" as var3
 FROM 
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW1,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW2
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."LSUNPDIDLITHOSTRAT" IS NOT NULL AND
QVIEW1."DSCNPDIDDISCOVERY" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."LSUNPDIDLITHOSTRAT" as var3
 FROM 
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW1,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."LSUNPDIDLITHOSTRAT" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."DSCNPDIDDISCOVERY" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."LSUNPDIDLITHOSTRAT" as var3
 FROM 
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW1,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW2
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."LSUNPDIDLITHOSTRAT" IS NOT NULL AND
QVIEW1."DSCNPDIDDISCOVERY" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."LSUNPDIDLITHOSTRAT" as var3
 FROM 
"NPD"."WELLBORE_NPDID_OVERVIEW" QVIEW1,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW2,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."LSUNPDIDLITHOSTRAT" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE"))
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."LSUNPDIDLITHOSTRAT" as var3
 FROM 
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW1,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW2
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."LSUNPDIDLITHOSTRAT" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."LSUNPDIDLITHOSTRAT" as var3
 FROM 
"NPD"."WELLBORE_NPDID_OVERVIEW" QVIEW1,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW2,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."LSUNPDIDLITHOSTRAT" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."DSCNPDIDDISCOVERY" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."LSUNPDIDLITHOSTRAT" as var3
 FROM 
"NPD"."WELLBORE_NPDID_OVERVIEW" QVIEW1,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."LSUNPDIDLITHOSTRAT" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."DSCNPDIDDISCOVERY" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."LSUNPDIDLITHOSTRAT" as var3
 FROM 
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW1,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW2
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."LSUNPDIDLITHOSTRAT" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."LSUNPDIDLITHOSTRAT" as var3
 FROM 
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW1,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW2,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."LSUNPDIDLITHOSTRAT" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE"))
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."LSUNPDIDLITHOSTRAT" as var3
 FROM 
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW1,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW2,
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."LSUNPDIDLITHOSTRAT" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE") AND
QVIEW3."DSCNPDIDDISCOVERY" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."WLBWELL" as var1, 
   QVIEW1."WLBNPDIDWELLBORE" as var2, 
   QVIEW2."LSUNPDIDLITHOSTRAT" as var3
 FROM 
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW1,
"NPD"."STRAT_LITHO_WELLBORE_CORE" QVIEW2,
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."WLBWELL" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
QVIEW2."LSUNPDIDLITHOSTRAT" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORE")
 ) 
 
 ) SUBQALIAS