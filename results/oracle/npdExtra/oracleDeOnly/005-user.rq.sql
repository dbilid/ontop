SELECT *
FROM (
SELECT DISTINCT 
   7 AS "licenceQuestType", NULL AS "licenceLang", QVIEW3."PRLNAME" AS "licence", 
   8 AS "licenseeFromQuestType", NULL AS "licenseeFromLang", CAST(QVIEW1."PRLLICENSEEDATEVALIDFROM" AS VARCHAR(4000)) AS "licenseeFrom", 
   7 AS "companyQuestType", NULL AS "companyLang", QVIEW2."CMPLONGNAME" AS "company"
 FROM 
"NPD"."LICENCE_LICENSEE_HST" QVIEW1,
"NPD"."COMPANY" QVIEW2,
"NPD"."LICENCE" QVIEW3
WHERE 
QVIEW1."CMPNPDIDCOMPANY" IS NOT NULL AND
QVIEW1."PRLLICENSEEDATEVALIDTO" IS NOT NULL AND
QVIEW1."PRLLICENSEEDATEVALIDFROM" IS NOT NULL AND
QVIEW1."PRLNPDIDLICENCE" IS NOT NULL AND
(QVIEW1."CMPNPDIDCOMPANY" = QVIEW2."CMPNPDIDCOMPANY") AND
QVIEW2."CMPLONGNAME" IS NOT NULL AND
('31-dec-9999' <> QVIEW1."PRLLICENSEEDATEVALIDFROM") AND
(QVIEW1."PRLNPDIDLICENCE" = QVIEW3."PRLNPDIDLICENCE") AND
QVIEW3."PRLNAME" IS NOT NULL
) SUB_QVIEW

ORDER BY SUB_QVIEW."licence", SUB_QVIEW."licenseeFrom"
