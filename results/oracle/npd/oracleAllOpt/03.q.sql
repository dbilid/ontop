SELECT *
FROM (
SELECT

   7 AS "licenceQuestType", NULL AS "licenceLang", CAST(var0 AS VARCHAR(4000)) AS "licence", 
   8 AS "dateValidToQuestType", NULL AS "dateValidToLang", CAST(var1 AS VARCHAR(4000)) AS "dateValidTo", 
   8 AS "dateGrantedQuestType", NULL AS "dateGrantedLang", CAST(var2 AS VARCHAR(4000)) AS "dateGranted"
FROM (
 (
SELECT DISTINCT 
   QVIEW1."PRLNAME" as var0, 
   QVIEW1."PRLDATEVALIDTO" as var1, 
   QVIEW1."PRLDATEGRANTED" as var2
 FROM 
"NPD"."LICENCE" QVIEW1
WHERE 
('31-dec-9999' <> QVIEW1."PRLDATEGRANTED") AND
QVIEW1."PRLDATEGRANTED" IS NOT NULL AND
QVIEW1."PRLNPDIDLICENCE" IS NOT NULL AND
('31-dec-9999' <> QVIEW1."PRLDATEVALIDTO") AND
QVIEW1."PRLDATEVALIDTO" IS NOT NULL AND
QVIEW1."PRLNAME" IS NOT NULL AND
(QVIEW1."PRLDATEVALIDTO" > to_timestamp('1979-12-31 00:00:00','YYYY-MM-DD HH24:MI:SS'))
 ) 
 
 ) SUBQALIAS
) SUB_QVIEW

ORDER BY SUB_QVIEW."licence"
