SELECT *
FROM (
SELECT DISTINCT 
   1 AS "frQuestType", NULL AS "frLang", CAST(('http://sws.ifi.uio.no/data/npd-v2/field/' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(QVIEW1."FLDNPDIDFIELD" AS VARCHAR(500)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D') || '/reserve') AS VARCHAR(500)) AS "fr", 
   5 AS "conQuestType", NULL AS "conLang", CAST(QVIEW1."FLDREMAININGCONDENSATE" AS VARCHAR(500)) AS "con", 
   5 AS "gasQuestType", NULL AS "gasLang", CAST(QVIEW1."FLDREMAININGGAS" AS VARCHAR(500)) AS "gas", 
   5 AS "NGLQuestType", NULL AS "NGLLang", CAST(QVIEW1."FLDREMAININGNGL" AS VARCHAR(500)) AS "NGL", 
   5 AS "oilQuestType", NULL AS "oilLang", CAST(QVIEW1."FLDREMAININGOIL" AS VARCHAR(500)) AS "oil", 
   5 AS "OEQuestType", NULL AS "OELang", CAST(QVIEW1."FLDREMAININGOE" AS VARCHAR(500)) AS "OE"
 FROM 
"PUBLIC"."FIELD_RESERVES" QVIEW1
WHERE 
QVIEW1."FLDREMAININGGAS" IS NOT NULL AND
QVIEW1."FLDNPDIDFIELD" IS NOT NULL AND
QVIEW1."FLDREMAININGOE" IS NOT NULL AND
QVIEW1."FLDREMAININGNGL" IS NOT NULL AND
QVIEW1."FLDREMAININGCONDENSATE" IS NOT NULL AND
QVIEW1."FLDREMAININGOIL" IS NOT NULL AND
(QVIEW1."FLDREMAININGGAS" < 100)
) SUB_QVIEW
ORDER BY SUB_QVIEW."OE" DESC

