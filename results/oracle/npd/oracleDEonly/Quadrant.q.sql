CREATE GLOBAL TEMPORARY TABLE V48822A2FF0B842FCA9EA406A8A753 ON COMMIT PRESERVE ROWS AS select distinct alias2."WLBNAMEPART1" as "WLBNAMEPART1" from 
"NPD"."WELLBORE_DEVELOPMENT_ALL" alias2 
where 
alias2."WLBNAMEPART1" IS NOT NULL

CREATE GLOBAL TEMPORARY TABLE V0BC2113C1E9B43F1A09C429605EF3 ON COMMIT PRESERVE ROWS AS select distinct alias1."WLBNAMEPART1" as "WLBNAMEPART1" from 
"NPD"."WELLBORE_DEVELOPMENT_ALL" alias1 
where 
alias1."WLBNAMEPART1" IS NOT NULL

CREATE GLOBAL TEMPORARY TABLE V0E8D8BE6FE0C43EBB783297E3DB1D ON COMMIT PRESERVE ROWS AS select distinct alias0."WLBNAMEPART1" as "WLBNAMEPART1" from 
"NPD"."WELLBORE_EXPLORATION_ALL" alias0 
where 
alias0."WLBNAMEPART1" IS NOT NULL

CREATE GLOBAL TEMPORARY TABLE V5BE131BF5BF34BAAA98F6E925B1FE ON COMMIT PRESERVE ROWS AS select distinct alias4."WLBNAMEPART1" as "WLBNAMEPART1" from 
"NPD"."WELLBORE_EXPLORATION_ALL" alias4 
where 
alias4."WLBNAMEPART1" IS NOT NULL

CREATE GLOBAL TEMPORARY TABLE VF851862C569B4EB3832E52DDD7333 ON COMMIT PRESERVE ROWS AS select distinct alias3."WLBNAMEPART1" as "WLBNAMEPART1" from 
"NPD"."WELLBORE_SHALLOW_ALL" alias3 
where 
alias3."WLBNAMEPART1" IS NOT NULL

SELECT 
   1 AS "qQuestType", NULL AS "qLang", ('http://sws.ifi.uio.no/data/npd-v2/quadrant/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNAMEPART1" AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS "q", 
   7 AS "nQuestType", NULL AS "nLang", CAST(QVIEW1."WLBNAMEPART1" AS VARCHAR(4000)) AS "n"
 FROM 
V0BC2113C1E9B43F1A09C429605EF3 QVIEW1,
V0E8D8BE6FE0C43EBB783297E3DB1D QVIEW2
WHERE 
(QVIEW1."WLBNAMEPART1" = QVIEW2."WLBNAMEPART1")
UNION
SELECT 
   1 AS "qQuestType", NULL AS "qLang", ('http://sws.ifi.uio.no/data/npd-v2/quadrant/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNAMEPART1" AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS "q", 
   7 AS "nQuestType", NULL AS "nLang", CAST(QVIEW1."WLBNAMEPART1" AS VARCHAR(4000)) AS "n"
 FROM 
V48822A2FF0B842FCA9EA406A8A753 QVIEW1,
V0BC2113C1E9B43F1A09C429605EF3 QVIEW2
WHERE 
(QVIEW1."WLBNAMEPART1" = QVIEW2."WLBNAMEPART1")
UNION
SELECT 
   1 AS "qQuestType", NULL AS "qLang", ('http://sws.ifi.uio.no/data/npd-v2/quadrant/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNAMEPART1" AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS "q", 
   7 AS "nQuestType", NULL AS "nLang", CAST(QVIEW1."WLBNAMEPART1" AS VARCHAR(4000)) AS "n"
 FROM 
V0BC2113C1E9B43F1A09C429605EF3 QVIEW1,
VF851862C569B4EB3832E52DDD7333 QVIEW2
WHERE 
(QVIEW1."WLBNAMEPART1" = QVIEW2."WLBNAMEPART1")
UNION
SELECT 
   1 AS "qQuestType", NULL AS "qLang", ('http://sws.ifi.uio.no/data/npd-v2/quadrant/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNAMEPART1" AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS "q", 
   7 AS "nQuestType", NULL AS "nLang", CAST(QVIEW1."WLBNAMEPART1" AS VARCHAR(4000)) AS "n"
 FROM 
V0E8D8BE6FE0C43EBB783297E3DB1D QVIEW1,
V5BE131BF5BF34BAAA98F6E925B1FE QVIEW2
WHERE 
(QVIEW1."WLBNAMEPART1" = QVIEW2."WLBNAMEPART1")
UNION
SELECT 
   1 AS "qQuestType", NULL AS "qLang", ('http://sws.ifi.uio.no/data/npd-v2/quadrant/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNAMEPART1" AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS "q", 
   7 AS "nQuestType", NULL AS "nLang", CAST(QVIEW1."WLBNAMEPART1" AS VARCHAR(4000)) AS "n"
 FROM 
V0BC2113C1E9B43F1A09C429605EF3 QVIEW1,
V0E8D8BE6FE0C43EBB783297E3DB1D QVIEW2
WHERE 
(QVIEW1."WLBNAMEPART1" = QVIEW2."WLBNAMEPART1")
UNION
SELECT 
   1 AS "qQuestType", NULL AS "qLang", ('http://sws.ifi.uio.no/data/npd-v2/quadrant/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNAMEPART1" AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS "q", 
   7 AS "nQuestType", NULL AS "nLang", CAST(QVIEW1."WLBNAMEPART1" AS VARCHAR(4000)) AS "n"
 FROM 
V0E8D8BE6FE0C43EBB783297E3DB1D QVIEW1,
VF851862C569B4EB3832E52DDD7333 QVIEW2
WHERE 
(QVIEW1."WLBNAMEPART1" = QVIEW2."WLBNAMEPART1")