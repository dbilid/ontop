SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Triassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'TRIASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Silurian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'SILURIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Pliocene' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'PLIOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Pleistocene' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'PLEISTOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Permian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'PERMIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Paleocene' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'PALEOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Oligocene' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'OLIGOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Miocene' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'MIOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/MiddleTriassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'MIDDLE TRIASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/MiddleJurassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'MIDDLE JURASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/UpperTriassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'LATE TRIASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Piacenzian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'LATE PLIOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Lopingian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'LATE PERMIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Thanetian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'LATE PALEOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/UpperJurassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'LATE JURASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/UpperCretaceous' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'LATE CRETACEOUS') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Pennsylvanian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'LATE CARBONIFEROUS') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Jurassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'JURASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Eocene' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'EOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/LowerTriassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'EARLY TRIASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Cisuralian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'EARLY PERMIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/LowerJurassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'EARLY JURASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/LowerCretaceous' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'EARLY CRETACEOUS') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Mississippian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'EARLY CARBONIFEROUS') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Devonian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'DEVONIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Danian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'DANIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Cretaceous' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'CRETACEOUS') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Carboniferous' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'CARBONIFEROUS') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Campanian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC3" = 'CAMPANIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Triassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'TRIASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Silurian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'SILURIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Pliocene' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'PLIOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Pleistocene' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'PLEISTOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Permian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'PERMIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Paleocene' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'PALEOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Oligocene' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'OLIGOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Miocene' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'MIOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/MiddleTriassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'MIDDLE TRIASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/MiddleJurassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'MIDDLE JURASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/UpperTriassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'LATE TRIASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Piacenzian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'LATE PLIOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Lopingian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'LATE PERMIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Thanetian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'LATE PALEOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/UpperJurassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'LATE JURASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/UpperCretaceous' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'LATE CRETACEOUS') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Pennsylvanian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'LATE CARBONIFEROUS') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Jurassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'JURASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Eocene' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'EOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/LowerTriassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'EARLY TRIASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Cisuralian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'EARLY PERMIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/LowerJurassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'EARLY JURASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/LowerCretaceous' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'EARLY CRETACEOUS') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Mississippian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'EARLY CARBONIFEROUS') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Devonian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'DEVONIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Danian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'DANIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Cretaceous' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'CRETACEOUS') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Carboniferous' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'CARBONIFEROUS') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Campanian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC2" = 'CAMPANIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Triassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'TRIASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Silurian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'SILURIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Pliocene' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'PLIOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Pleistocene' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'PLEISTOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Permian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'PERMIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Paleocene' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'PALEOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Oligocene' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'OLIGOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Miocene' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'MIOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/MiddleTriassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'MIDDLE TRIASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/MiddleJurassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'MIDDLE JURASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/UpperTriassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'LATE TRIASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Piacenzian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'LATE PLIOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Lopingian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'LATE PERMIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Thanetian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'LATE PALEOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/UpperJurassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'LATE JURASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/UpperCretaceous' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'LATE CRETACEOUS') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Pennsylvanian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'LATE CARBONIFEROUS') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Jurassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'JURASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Eocene' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'EOCENE') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/LowerTriassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'EARLY TRIASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Cisuralian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'EARLY PERMIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/LowerJurassic' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'EARLY JURASSIC') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/LowerCretaceous' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'EARLY CRETACEOUS') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Mississippian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'EARLY CARBONIFEROUS') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Devonian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'DEVONIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Danian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'DANIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Cretaceous' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'CRETACEOUS') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Carboniferous' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'CARBONIFEROUS') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL
UNION
SELECT 
   1 AS "aQuestType", NULL AS "aLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/wellbore/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."WLBNPDIDWELLBORE" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS VARCHAR(500)) AS "a", 
   1 AS "bQuestType", NULL AS "bLang", 'http://resource.geosciml.org/classifier/ics/ischart/Campanian' AS "b"
 FROM 
"PUBLIC"."WELLBORE_EXPLORATION_ALL" QVIEW1
WHERE 
(QVIEW1."WLBAGEWITHHC1" = 'CAMPANIAN') AND
QVIEW1."WLBNPDIDWELLBORE" IS NOT NULL