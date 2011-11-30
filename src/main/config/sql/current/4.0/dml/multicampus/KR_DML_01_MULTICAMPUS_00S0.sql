UPDATE KRNS_PARM_T SET TXT = 'Y' WHERE NMSPC_CD = 'KC-GEN' AND PARM_NM = 'MULTI_CAMPUS_ENABLED'
/

UPDATE KRIM_PRNCPL_T SET PRNCPL_NM = REGEXP_REPLACE(PRNCPL_NM, '(.+)', '\1@indiana.edu') WHERE PRNCPL_ID >= '10000000001' AND PRNCPL_ID <= '10000000058' AND PRNCPL_ID != '10000000005' AND PRNCPL_ID != '10000000007' AND PRNCPL_ID != '10000000008'
/
UPDATE KRIM_PRNCPL_T SET PRNCPL_NM = REGEXP_REPLACE(PRNCPL_NM, '(.+)', '\1@iub.edu') WHERE PRNCPL_ID = '10000000005' OR PRNCPL_ID = '10000000007'
/
UPDATE KRIM_PRNCPL_T SET PRNCPL_NM = REGEXP_REPLACE(PRNCPL_NM, '(.+)', '\1@iupui.edu') WHERE PRNCPL_ID = '10000000008'
/

INSERT INTO KRIM_ENTITY_T (ENTITY_ID,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ENTITY_ID_S.NEXTVAL,'Y',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID,ENTITY_ID,FIRST_NM,LAST_NM,NM_TYP_CD,DFLT_IND,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ENTITY_NM_ID_S.NEXTVAL,KRIM_ENTITY_ID_S.CURRVAL,'Anne','Cate','PRFR','Y','Y',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENTITY_ID,ENT_TYP_CD,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES ((SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Anne' AND LAST_NM = 'Cate'),'PERSON','Y',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID,ENTITY_ID,PRNCPL_NM,PRNCPL_PSWD,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES ('10000000060',(SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Anne' AND LAST_NM = 'Cate'),'cate@iub.edu','fK69ATFsAydwQuteang+xMva+Tc=','Y',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ENTITY_ADDR_T (ENTITY_ADDR_ID,ENTITY_ID,ENT_TYP_CD,ADDR_TYP_CD,ADDR_LINE_1,CITY_NM,POSTAL_STATE_CD,POSTAL_CD,POSTAL_CNTRY_CD,DFLT_IND,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ENTITY_ADDR_ID_S.NEXTVAL,(SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Anne' AND LAST_NM = 'Cate'),'PERSON','WRK','2000 Kuali Drive','Coeus','MA','53421','US','Y','Y',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ENTITY_AFLTN_T (ENTITY_AFLTN_ID,ENTITY_ID,AFLTN_TYP_CD,CAMPUS_CD,DFLT_IND,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR)
    VALUES (KRIM_ENTITY_AFLTN_ID_S.NEXTVAL,(SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Anne' AND LAST_NM = 'Cate'),'STAFF','BL','Y','Y',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID,ENTITY_ID,ENT_TYP_CD,EMAIL_TYP_CD,EMAIL_ADDR,DFLT_IND,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ENTITY_EMAIL_ID_S.NEXTVAL,(SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Anne' AND LAST_NM = 'Cate'),'PERSON','WRK','acate@kuali.org','Y','Y',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID,ENTITY_ID,ENTITY_AFLTN_ID,EMP_REC_ID,EMP_ID,EMP_STAT_CD,EMP_TYP_CD,BASE_SLRY_AMT,PRMRY_DEPT_CD,PRMRY_IND,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ENTITY_EMP_ID_S.NEXTVAL,(SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Anne' AND LAST_NM = 'Cate'),(SELECT ENTITY_AFLTN_ID FROM KRIM_ENTITY_AFLTN_T WHERE ENTITY_ID = (SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Anne' AND LAST_NM = 'Cate')),'1',(SELECT PRNCPL_NM FROM KRIM_PRNCPL_T WHERE ENTITY_ID = (SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Anne' AND LAST_NM = 'Cate')),'A','P',100000,'000001','Y','Y',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID,ENTITY_ID,ENT_TYP_CD,PHONE_TYP_CD,PHONE_NBR,POSTAL_CNTRY_CD,DFLT_IND,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ENTITY_PHONE_ID_S.NEXTVAL,(SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Anne' AND LAST_NM = 'Cate'),'PERSON','WRK','321-321-2000','US','Y','Y',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID,ENTITY_ID,ENT_TYP_CD,PHONE_TYP_CD,PHONE_NBR,POSTAL_CNTRY_CD,DFLT_IND,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ENTITY_PHONE_ID_S.NEXTVAL,(SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Anne' AND LAST_NM = 'Cate'),'PERSON','FAX','321-321-2001','US','N','Y',SYSDATE,SYS_GUID(),1)
/

INSERT INTO KRIM_GRP_MBR_T (GRP_MBR_ID,GRP_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_GRP_ID_S.NEXTVAL,(SELECT GRP_ID FROM KRIM_GRP_T WHERE NMSPC_CD = 'KR-WKFLW' AND GRP_NM = 'WorkflowAdmin'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_GRP_MBR_T (GRP_MBR_ID,GRP_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_GRP_ID_S.NEXTVAL,(SELECT GRP_ID FROM KRIM_GRP_T WHERE NMSPC_CD = 'KC-WKFLW' AND GRP_NM = 'KcAdmin'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_GRP_MBR_T (GRP_MBR_ID,GRP_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_GRP_ID_S.NEXTVAL,(SELECT GRP_ID FROM KRIM_GRP_T WHERE NMSPC_CD = 'KC-WKFLW' AND GRP_NM = 'OSP Superuser'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_GRP_MBR_T (GRP_MBR_ID,GRP_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_GRP_ID_S.NEXTVAL,(SELECT GRP_ID FROM KRIM_GRP_T WHERE NMSPC_CD = 'KC-WKFLW' AND GRP_NM = 'ProposalAdmin'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_GRP_MBR_T (GRP_MBR_ID,GRP_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_GRP_ID_S.NEXTVAL,(SELECT GRP_ID FROM KRIM_GRP_T WHERE NMSPC_CD = 'KC-WKFLW' AND GRP_NM = 'IRBAdmin'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_GRP_MBR_T (GRP_MBR_ID,GRP_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_GRP_ID_S.NEXTVAL,(SELECT GRP_ID FROM KRIM_GRP_T WHERE NMSPC_CD = 'KC-WKFLW' AND GRP_NM = 'QuestionnaireAdmin'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-WKFLW' AND ROLE_NM = 'IRBApprover'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-PD' AND ROLE_NM = 'Aggregator'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-UNT' AND ROLE_NM = 'Proposal Creator'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Unit'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'BL-BL',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-AB' AND ROLE_NM = 'Award Budget Administrator'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'BL-BL',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'Y',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-IP' AND ROLE_NM = 'Institutional Proposal Maintainer'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'BL-BL',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'Y',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'BL-BL',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'Y',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-AWARD' AND ROLE_NM = 'Award Modifier'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'BL-BL',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'Y',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-UNT' AND ROLE_NM = 'IRB Administrator'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'BL-BL',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'Y',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-UNT' AND ROLE_NM = 'Protocol Creator'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'BL-BL',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'Y',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-ADM' AND ROLE_NM = 'Proposal Submission'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'BL-BL',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'N',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-ADM' AND ROLE_NM = 'OSP Administrator'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'BL-BL',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'Y',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-IP' AND ROLE_NM = 'Create Proposal Log'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'BL-BL',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'Y',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-IP' AND ROLE_NM = 'Modify Proposal Log'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'BL-BL',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'Y',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-T' AND ROLE_NM = 'Time And Money Modifier'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'BL-BL',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'Y',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-PD' AND ROLE_NM = 'Delete Proposal'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'BL-BL',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR)
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SUBAWARD' AND ROLE_NM = 'Modify Subaward'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR)
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SUBAWARD' AND ROLE_NM = 'View Subaward'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iub.edu'),'P',SYSDATE,SYS_GUID(),1)
/

INSERT INTO KRIM_GRP_MBR_T (GRP_MBR_ID,GRP_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_GRP_ID_S.NEXTVAL,(SELECT GRP_ID FROM KRIM_GRP_T WHERE NMSPC_CD = 'KR-WKFLW' AND GRP_NM = 'WorkflowAdmin'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iupui.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_GRP_MBR_T (GRP_MBR_ID,GRP_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_GRP_ID_S.NEXTVAL,(SELECT GRP_ID FROM KRIM_GRP_T WHERE NMSPC_CD = 'KC-WKFLW' AND GRP_NM = 'OSP Superuser'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iupui.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_GRP_MBR_T (GRP_MBR_ID,GRP_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_GRP_ID_S.NEXTVAL,(SELECT GRP_ID FROM KRIM_GRP_T WHERE NMSPC_CD = 'KC-WKFLW' AND GRP_NM = 'QuestionnaireAdmin'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iupui.edu'),'P',SYSDATE,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iupui.edu'),'P',SYSDATE,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-WKFLW' AND ROLE_NM = 'IRBApprover'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iupui.edu'),'P',SYSDATE,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-PD' AND ROLE_NM = 'Aggregator'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iupui.edu'),'P',SYSDATE,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-AB' AND ROLE_NM = 'Award Budget Administrator'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iupui.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'IN-MED',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'Y',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-IP' AND ROLE_NM = 'Institutional Proposal Maintainer'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iupui.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'IN-MED',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'Y',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iupui.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'IN-MED',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'Y',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-AWARD' AND ROLE_NM = 'Award Modifier'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iupui.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'IN-MED',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'Y',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-UNT' AND ROLE_NM = 'IRB Administrator'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iupui.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'IN-MED',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'Y',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-UNT' AND ROLE_NM = 'Protocol Creator'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iupui.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'IN-MED',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'Y',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-ADM' AND ROLE_NM = 'Proposal Submission'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iupui.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'IN-MED',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'N',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-ADM' AND ROLE_NM = 'OSP Administrator'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iupui.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'IN-MED',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'Y',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-IP' AND ROLE_NM = 'Create Proposal Log'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iupui.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'IN-MED',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'Y',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-IP' AND ROLE_NM = 'Modify Proposal Log'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iupui.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'IN-MED',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'Y',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-T' AND ROLE_NM = 'Time And Money Modifier'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iupui.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'IN-MED',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'),'Y',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-PD' AND ROLE_NM = 'Delete Proposal'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iupui.edu'),'P',SYSDATE,SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID,ROLE_MBR_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL,KRIM_ROLE_MBR_ID_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'),'IN-MED',SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR)
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SUBAWARD' AND ROLE_NM = 'Modify Subaward'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iupui.edu'),'P',SYSDATE,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_ID,MBR_TYP_CD,LAST_UPDT_DT,OBJ_ID,VER_NBR)
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SUBAWARD' AND ROLE_NM = 'View Subaward'),(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'cate@iupui.edu'),'P',SYSDATE,SYS_GUID(),1)
/
