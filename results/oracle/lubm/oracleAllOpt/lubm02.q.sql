CREATE GLOBAL TEMPORARY TABLE V5AEF3040762D43DEAA046FBBA1E2A ON COMMIT PRESERVE ROWS  AS select distinct alias0."DOCD" as "DOCD" from 
"LUBM"."TEACHERS" alias0 
where 
(alias0."TTYPE" = 0 or (alias0."TTYPE" = 3 or (alias0."TTYPE" = 1 or alias0."TTYPE" = 2))) and 
alias0."DOCD" IS NOT NULL

CREATE GLOBAL TEMPORARY TABLE V79FFAC34B3374355A747133AA5D74 ON COMMIT PRESERVE ROWS  AS select distinct alias0."UNDERD" as "UNDERD" from 
"LUBM"."TEACHERS" alias0 
where 
(alias0."TTYPE" = 0 or (alias0."TTYPE" = 3 or (alias0."TTYPE" = 1 or alias0."TTYPE" = 2))) and 
alias0."UNDERD" IS NOT NULL

CREATE GLOBAL TEMPORARY TABLE VA129325F1D444F3389788339D8D4C ON COMMIT PRESERVE ROWS  AS select distinct alias1."UNDERD" as "UNDERD" from 
"LUBM"."TEACHERS" alias1 
where 
(alias1."TTYPE" = 0 or (alias1."TTYPE" = 3 or (alias1."TTYPE" = 1 or alias1."TTYPE" = 2))) and 
alias1."UNDERD" IS NOT NULL

CREATE GLOBAL TEMPORARY TABLE V218F796BA8F946B38D446344B489C ON COMMIT PRESERVE ROWS  AS select distinct alias0."MASTERD" as "MASTERD" from 
"LUBM"."TEACHERS" alias0 
where 
(alias0."TTYPE" = 0 or (alias0."TTYPE" = 3 or (alias0."TTYPE" = 1 or alias0."TTYPE" = 2))) and 
alias0."MASTERD" IS NOT NULL

CREATE GLOBAL TEMPORARY TABLE VBC074C0F30B34B10819159CB5E1FD ON COMMIT PRESERVE ROWS  AS select distinct alias1."DOCD" as "DOCD" from 
"LUBM"."TEACHERS" alias1 
where 
(alias1."TTYPE" = 0 or (alias1."TTYPE" = 3 or (alias1."TTYPE" = 1 or alias1."TTYPE" = 2))) and 
alias1."DOCD" IS NOT NULL

CREATE GLOBAL TEMPORARY TABLE VA6CF8A103D894035A421B9A7354FA ON COMMIT PRESERVE ROWS  AS select distinct alias1."MASTERD" as "MASTERD" from 
"LUBM"."TEACHERS" alias1 
where 
(alias1."TTYPE" = 0 or (alias1."TTYPE" = 3 or (alias1."TTYPE" = 1 or alias1."TTYPE" = 2))) and 
alias1."MASTERD" IS NOT NULL

SELECT

   1 AS "xQuestType", NULL AS "xLang", ('http://www.Department' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(var0 AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D') || '.University' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(var1 AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D') || '.edu/GraduateStudent' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(var2 AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D')) AS "x", 
   1 AS "yQuestType", NULL AS "yLang", ('http://www.University' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(var3 AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D') || '.edu') AS "y", 
   1 AS "zQuestType", NULL AS "zLang", ('http://www.Department' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(var4 AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D') || '.University' || REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CAST(var5 AS VARCHAR(4000)), ' ', '%20'), '!', '%21'), '''', '%22'), '#', '%23'), '$', '%24'), '&', '%26'), '(', '%28'), ')', '%29'), '*', '%2A'), '+', '%2B'), ',', '%2C'), '/', '%2F'), ':', '%3A'), ';', '%3B'), '=', '%3D'), '?', '%3F'), '@', '%40'), '[', '%5B'), ']', '%5D') || '.edu') AS "z"
FROM (
 (
SELECT 
   QVIEW1."DEPID" as var0, 
   QVIEW1."UNIID" as var1, 
   QVIEW1."ID" as var2, 
   QVIEW1."UNIID" as var3, 
   QVIEW1."DEPID" as var4, 
   QVIEW1."UNIID" as var5
 FROM 
"LUBM"."STUDENTS" QVIEW1,
"LUBM"."DEPARTMENTS" QVIEW2,
V218F796BA8F946B38D446344B489C QVIEW3,
VBC074C0F30B34B10819159CB5E1FD QVIEW4
WHERE 
(QVIEW1."STYPE" = 1) AND
(QVIEW1."UNIID" = QVIEW1."DEGREEUNIID") AND
QVIEW1."DEPID" IS NOT NULL AND
QVIEW1."ID" IS NOT NULL AND
(QVIEW1."DEPID" = QVIEW2."DEPARTMENTID") AND
(QVIEW1."UNIID" = QVIEW2."UNIVERSITYID") AND
(QVIEW1."UNIID" = QVIEW3."MASTERD") AND
(QVIEW1."UNIID" = QVIEW4."DOCD"))
 
UNION
(
SELECT 
   QVIEW1."DEPID" as var0, 
   QVIEW1."UNIID" as var1, 
   QVIEW1."ID" as var2, 
   QVIEW1."UNIID" as var3, 
   QVIEW1."DEPID" as var4, 
   QVIEW1."UNIID" as var5
 FROM 
"LUBM"."STUDENTS" QVIEW1,
"LUBM"."DEPARTMENTS" QVIEW2,
V5AEF3040762D43DEAA046FBBA1E2A QVIEW3
WHERE 
(QVIEW1."STYPE" = 1) AND
(QVIEW1."UNIID" = QVIEW1."DEGREEUNIID") AND
QVIEW1."DEPID" IS NOT NULL AND
QVIEW1."ID" IS NOT NULL AND
(QVIEW1."DEPID" = QVIEW2."DEPARTMENTID") AND
(QVIEW1."UNIID" = QVIEW2."UNIVERSITYID") AND
(QVIEW1."UNIID" = QVIEW3."DOCD"))
 
UNION
(
SELECT 
   QVIEW1."DEPID" as var0, 
   QVIEW1."UNIID" as var1, 
   QVIEW1."ID" as var2, 
   QVIEW1."UNIID" as var3, 
   QVIEW1."DEPID" as var4, 
   QVIEW1."UNIID" as var5
 FROM 
"LUBM"."STUDENTS" QVIEW1,
"LUBM"."DEPARTMENTS" QVIEW2,
V79FFAC34B3374355A747133AA5D74 QVIEW3
WHERE 
(QVIEW1."STYPE" = 1) AND
(QVIEW1."UNIID" = QVIEW1."DEGREEUNIID") AND
QVIEW1."DEPID" IS NOT NULL AND
QVIEW1."ID" IS NOT NULL AND
(QVIEW1."DEPID" = QVIEW2."DEPARTMENTID") AND
(QVIEW1."UNIID" = QVIEW2."UNIVERSITYID") AND
(QVIEW1."UNIID" = QVIEW3."UNDERD"))
 
UNION
(
SELECT 
   QVIEW1."DEPID" as var0, 
   QVIEW1."UNIID" as var1, 
   QVIEW1."ID" as var2, 
   QVIEW1."UNIID" as var3, 
   QVIEW1."DEPID" as var4, 
   QVIEW1."UNIID" as var5
 FROM 
"LUBM"."STUDENTS" QVIEW1,
"LUBM"."DEPARTMENTS" QVIEW2,
V218F796BA8F946B38D446344B489C QVIEW3
WHERE 
(QVIEW1."STYPE" = 1) AND
(QVIEW1."UNIID" = QVIEW1."DEGREEUNIID") AND
QVIEW1."UNIID" IS NOT NULL AND
QVIEW1."DEPID" IS NOT NULL AND
QVIEW1."ID" IS NOT NULL AND
(QVIEW1."DEPID" = QVIEW2."DEPARTMENTID") AND
(QVIEW1."UNIID" = QVIEW2."UNIVERSITYID") AND
(QVIEW1."UNIID" = QVIEW3."MASTERD"))
 
UNION
(
SELECT 
   QVIEW1."DEPID" as var0, 
   QVIEW1."UNIID" as var1, 
   QVIEW1."ID" as var2, 
   QVIEW1."UNIID" as var3, 
   QVIEW1."DEPID" as var4, 
   QVIEW1."UNIID" as var5
 FROM 
"LUBM"."STUDENTS" QVIEW1,
"LUBM"."DEPARTMENTS" QVIEW2,
V5AEF3040762D43DEAA046FBBA1E2A QVIEW3,
VBC074C0F30B34B10819159CB5E1FD QVIEW4
WHERE 
(QVIEW1."STYPE" = 1) AND
(QVIEW1."UNIID" = QVIEW1."DEGREEUNIID") AND
QVIEW1."DEPID" IS NOT NULL AND
QVIEW1."ID" IS NOT NULL AND
(QVIEW1."DEPID" = QVIEW2."DEPARTMENTID") AND
(QVIEW1."UNIID" = QVIEW2."UNIVERSITYID") AND
(QVIEW1."UNIID" = QVIEW3."DOCD") AND
(QVIEW1."UNIID" = QVIEW4."DOCD"))
 
UNION
(
SELECT 
   QVIEW1."DEPID" as var0, 
   QVIEW1."UNIID" as var1, 
   QVIEW1."ID" as var2, 
   QVIEW1."UNIID" as var3, 
   QVIEW1."DEPID" as var4, 
   QVIEW1."UNIID" as var5
 FROM 
"LUBM"."STUDENTS" QVIEW1,
"LUBM"."DEPARTMENTS" QVIEW2,
V5AEF3040762D43DEAA046FBBA1E2A QVIEW3,
VA129325F1D444F3389788339D8D4C QVIEW4
WHERE 
(QVIEW1."STYPE" = 1) AND
(QVIEW1."UNIID" = QVIEW1."DEGREEUNIID") AND
QVIEW1."DEPID" IS NOT NULL AND
QVIEW1."ID" IS NOT NULL AND
(QVIEW1."DEPID" = QVIEW2."DEPARTMENTID") AND
(QVIEW1."UNIID" = QVIEW2."UNIVERSITYID") AND
(QVIEW1."UNIID" = QVIEW3."DOCD") AND
(QVIEW1."UNIID" = QVIEW4."UNDERD"))
 
UNION
(
SELECT 
   QVIEW1."DEPID" as var0, 
   QVIEW1."UNIID" as var1, 
   QVIEW1."ID" as var2, 
   QVIEW1."UNIID" as var3, 
   QVIEW1."DEPID" as var4, 
   QVIEW1."UNIID" as var5
 FROM 
"LUBM"."STUDENTS" QVIEW1,
"LUBM"."DEPARTMENTS" QVIEW2,
V5AEF3040762D43DEAA046FBBA1E2A QVIEW3,
VA6CF8A103D894035A421B9A7354FA QVIEW4
WHERE 
(QVIEW1."STYPE" = 1) AND
(QVIEW1."UNIID" = QVIEW1."DEGREEUNIID") AND
QVIEW1."DEPID" IS NOT NULL AND
QVIEW1."ID" IS NOT NULL AND
(QVIEW1."DEPID" = QVIEW2."DEPARTMENTID") AND
(QVIEW1."UNIID" = QVIEW2."UNIVERSITYID") AND
(QVIEW1."UNIID" = QVIEW3."DOCD") AND
(QVIEW1."UNIID" = QVIEW4."MASTERD"))
 
UNION
(
SELECT 
   QVIEW1."DEPID" as var0, 
   QVIEW1."UNIID" as var1, 
   QVIEW1."ID" as var2, 
   QVIEW1."UNIID" as var3, 
   QVIEW1."DEPID" as var4, 
   QVIEW1."UNIID" as var5
 FROM 
"LUBM"."STUDENTS" QVIEW1,
"LUBM"."DEPARTMENTS" QVIEW2,
V79FFAC34B3374355A747133AA5D74 QVIEW3,
VA6CF8A103D894035A421B9A7354FA QVIEW4
WHERE 
(QVIEW1."STYPE" = 1) AND
(QVIEW1."UNIID" = QVIEW1."DEGREEUNIID") AND
QVIEW1."DEPID" IS NOT NULL AND
QVIEW1."ID" IS NOT NULL AND
(QVIEW1."DEPID" = QVIEW2."DEPARTMENTID") AND
(QVIEW1."UNIID" = QVIEW2."UNIVERSITYID") AND
(QVIEW1."UNIID" = QVIEW3."UNDERD") AND
(QVIEW1."UNIID" = QVIEW4."MASTERD"))
 
UNION
(
SELECT 
   QVIEW1."DEPID" as var0, 
   QVIEW1."UNIID" as var1, 
   QVIEW1."ID" as var2, 
   QVIEW1."UNIID" as var3, 
   QVIEW1."DEPID" as var4, 
   QVIEW1."UNIID" as var5
 FROM 
"LUBM"."STUDENTS" QVIEW1,
"LUBM"."DEPARTMENTS" QVIEW2,
V218F796BA8F946B38D446344B489C QVIEW3,
VA6CF8A103D894035A421B9A7354FA QVIEW4
WHERE 
(QVIEW1."STYPE" = 1) AND
(QVIEW1."UNIID" = QVIEW1."DEGREEUNIID") AND
QVIEW1."UNIID" IS NOT NULL AND
QVIEW1."DEPID" IS NOT NULL AND
QVIEW1."ID" IS NOT NULL AND
(QVIEW1."DEPID" = QVIEW2."DEPARTMENTID") AND
(QVIEW1."UNIID" = QVIEW2."UNIVERSITYID") AND
(QVIEW1."UNIID" = QVIEW3."MASTERD") AND
(QVIEW1."UNIID" = QVIEW4."MASTERD"))
 
UNION
(
SELECT 
   QVIEW1."DEPID" as var0, 
   QVIEW1."UNIID" as var1, 
   QVIEW1."ID" as var2, 
   QVIEW1."UNIID" as var3, 
   QVIEW1."DEPID" as var4, 
   QVIEW1."UNIID" as var5
 FROM 
"LUBM"."STUDENTS" QVIEW1,
"LUBM"."DEPARTMENTS" QVIEW2,
V79FFAC34B3374355A747133AA5D74 QVIEW3,
VA129325F1D444F3389788339D8D4C QVIEW4
WHERE 
(QVIEW1."STYPE" = 1) AND
(QVIEW1."UNIID" = QVIEW1."DEGREEUNIID") AND
QVIEW1."DEPID" IS NOT NULL AND
QVIEW1."ID" IS NOT NULL AND
(QVIEW1."DEPID" = QVIEW2."DEPARTMENTID") AND
(QVIEW1."UNIID" = QVIEW2."UNIVERSITYID") AND
(QVIEW1."UNIID" = QVIEW3."UNDERD") AND
(QVIEW1."UNIID" = QVIEW4."UNDERD"))
 
UNION
(
SELECT 
   QVIEW1."DEPID" as var0, 
   QVIEW1."UNIID" as var1, 
   QVIEW1."ID" as var2, 
   QVIEW1."UNIID" as var3, 
   QVIEW1."DEPID" as var4, 
   QVIEW1."UNIID" as var5
 FROM 
"LUBM"."STUDENTS" QVIEW1,
"LUBM"."DEPARTMENTS" QVIEW2,
V218F796BA8F946B38D446344B489C QVIEW3
WHERE 
(QVIEW1."STYPE" = 1) AND
(QVIEW1."UNIID" = QVIEW1."DEGREEUNIID") AND
QVIEW1."DEPID" IS NOT NULL AND
QVIEW1."ID" IS NOT NULL AND
(QVIEW1."DEPID" = QVIEW2."DEPARTMENTID") AND
(QVIEW1."UNIID" = QVIEW2."UNIVERSITYID") AND
(QVIEW1."UNIID" = QVIEW3."MASTERD"))
 
UNION
(
SELECT 
   QVIEW1."DEPID" as var0, 
   QVIEW1."UNIID" as var1, 
   QVIEW1."ID" as var2, 
   QVIEW1."UNIID" as var3, 
   QVIEW1."DEPID" as var4, 
   QVIEW1."UNIID" as var5
 FROM 
"LUBM"."STUDENTS" QVIEW1,
"LUBM"."DEPARTMENTS" QVIEW2
WHERE 
(QVIEW1."STYPE" = 1) AND
(QVIEW1."UNIID" = QVIEW1."DEGREEUNIID") AND
QVIEW1."UNIID" IS NOT NULL AND
QVIEW1."DEPID" IS NOT NULL AND
QVIEW1."ID" IS NOT NULL AND
(QVIEW1."DEPID" = QVIEW2."DEPARTMENTID") AND
(QVIEW1."UNIID" = QVIEW2."UNIVERSITYID"))
 
UNION
(
SELECT 
   QVIEW1."DEPID" as var0, 
   QVIEW1."UNIID" as var1, 
   QVIEW1."ID" as var2, 
   QVIEW1."UNIID" as var3, 
   QVIEW1."DEPID" as var4, 
   QVIEW1."UNIID" as var5
 FROM 
"LUBM"."STUDENTS" QVIEW1,
"LUBM"."DEPARTMENTS" QVIEW2,
V79FFAC34B3374355A747133AA5D74 QVIEW3,
VBC074C0F30B34B10819159CB5E1FD QVIEW4
WHERE 
(QVIEW1."STYPE" = 1) AND
(QVIEW1."UNIID" = QVIEW1."DEGREEUNIID") AND
QVIEW1."DEPID" IS NOT NULL AND
QVIEW1."ID" IS NOT NULL AND
(QVIEW1."DEPID" = QVIEW2."DEPARTMENTID") AND
(QVIEW1."UNIID" = QVIEW2."UNIVERSITYID") AND
(QVIEW1."UNIID" = QVIEW3."UNDERD") AND
(QVIEW1."UNIID" = QVIEW4."DOCD")
 ) 
 
 ) SUBQALIAS