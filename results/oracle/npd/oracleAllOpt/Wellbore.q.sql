CREATE GLOBAL TEMPORARY TABLE V0B3F825D759E41C396694822808A9 ON COMMIT PRESERVE ROWS  AS select distinct alias2."WLBNPDIDWELLBORERECLASS" as "WLBNPDIDWELLBORERECLASS" from 
"NPD"."WELLBORE_EXPLORATION_ALL" alias2 
where 
alias2."WLBNPDIDWELLBORERECLASS" IS NOT NULL

CREATE GLOBAL TEMPORARY TABLE V2D15B5909E6B4DD28F13A1A0CEFE1 ON COMMIT PRESERVE ROWS  AS select distinct alias1."WLBNPDIDWELLBORERECLASS" as "WLBNPDIDWELLBORERECLASS" from 
"NPD"."WELLBORE_EXPLORATION_ALL" alias1 
where 
alias1."WLBNPDIDWELLBORERECLASS" IS NOT NULL

CREATE GLOBAL TEMPORARY TABLE V31B7D44A76054B3DB91387280E17B ON COMMIT PRESERVE ROWS  AS select distinct alias3."WLBNPDIDWELLBORERECLASS" as "WLBNPDIDWELLBORERECLASS" from 
"NPD"."WELLBORE_DEVELOPMENT_ALL" alias3 
where 
alias3."WLBNPDIDWELLBORERECLASS" IS NOT NULL

SELECT

   1 AS "qQuestType", NULL AS "qLang", ('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(var0 AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS "q", 
   1 AS "discoveryQuestType", NULL AS "discoveryLang", ('http://sws.ifi.uio.no/data/npd-v2/discovery/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(var1 AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS "discovery", 
   4 AS "yQuestType", NULL AS "yLang", CAST(var2 AS VARCHAR(4000)) AS "y"
FROM (
 (
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."DSCNPDIDDISCOVERY" as var1, 
   QVIEW2."DSCDISCOVERYYEAR" as var2
 FROM 
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW1,
"NPD"."DISCOVERY" QVIEW2,
V31B7D44A76054B3DB91387280E17B QVIEW3
WHERE 
QVIEW1."DSCNPDIDDISCOVERY" IS NOT NULL AND
(QVIEW1."DSCNPDIDDISCOVERY" = QVIEW2."DSCNPDIDDISCOVERY") AND
QVIEW2."DSCDISCOVERYYEAR" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORERECLASS"))
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."DSCNPDIDDISCOVERY" as var1, 
   QVIEW2."DSCDISCOVERYYEAR" as var2
 FROM 
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW1,
"NPD"."DISCOVERY" QVIEW2,
V31B7D44A76054B3DB91387280E17B QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."DSCNPDIDDISCOVERY" IS NOT NULL AND
(QVIEW1."DSCNPDIDDISCOVERY" = QVIEW2."DSCNPDIDDISCOVERY") AND
QVIEW2."DSCDISCOVERYYEAR" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORERECLASS"))
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."DSCNPDIDDISCOVERY" as var1, 
   QVIEW2."DSCDISCOVERYYEAR" as var2
 FROM 
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW1,
"NPD"."DISCOVERY" QVIEW2,
V0B3F825D759E41C396694822808A9 QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."DSCNPDIDDISCOVERY" IS NOT NULL AND
(QVIEW1."DSCNPDIDDISCOVERY" = QVIEW2."DSCNPDIDDISCOVERY") AND
QVIEW2."DSCDISCOVERYYEAR" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORERECLASS"))
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."DSCNPDIDDISCOVERY" as var1, 
   QVIEW3."DSCDISCOVERYYEAR" as var2
 FROM 
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW1,
"NPD"."WELLBORE_NPDID_OVERVIEW" QVIEW2,
"NPD"."DISCOVERY" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."DSCNPDIDDISCOVERY" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
(QVIEW1."DSCNPDIDDISCOVERY" = QVIEW3."DSCNPDIDDISCOVERY") AND
QVIEW3."DSCDISCOVERYYEAR" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."DSCNPDIDDISCOVERY" as var1, 
   QVIEW3."DSCDISCOVERYYEAR" as var2
 FROM 
"NPD"."WELLBORE_EXPLORATION_ALL" QVIEW1,
"NPD"."WELLBORE_NPDID_OVERVIEW" QVIEW2,
"NPD"."DISCOVERY" QVIEW3
WHERE 
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL AND
QVIEW1."DSCNPDIDDISCOVERY" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW2."WLBNPDIDWELLBORE") AND
(QVIEW1."DSCNPDIDDISCOVERY" = QVIEW3."DSCNPDIDDISCOVERY") AND
QVIEW3."DSCDISCOVERYYEAR" IS NOT NULL)
 
UNION
(
SELECT 
   QVIEW1."WLBNPDIDWELLBORE" as var0, 
   QVIEW1."DSCNPDIDDISCOVERY" as var1, 
   QVIEW2."DSCDISCOVERYYEAR" as var2
 FROM 
"NPD"."WELLBORE_DEVELOPMENT_ALL" QVIEW1,
"NPD"."DISCOVERY" QVIEW2,
V2D15B5909E6B4DD28F13A1A0CEFE1 QVIEW3
WHERE 
QVIEW1."DSCNPDIDDISCOVERY" IS NOT NULL AND
(QVIEW1."DSCNPDIDDISCOVERY" = QVIEW2."DSCNPDIDDISCOVERY") AND
QVIEW2."DSCDISCOVERYYEAR" IS NOT NULL AND
(QVIEW1."WLBNPDIDWELLBORE" = QVIEW3."WLBNPDIDWELLBORERECLASS")
 ) 
 
 ) SUBQALIAS