DECLARE 
  num NUMBER;
BEGIN
  SELECT COUNT(*) INTO num FROM KRIM_AFLTN_TYP_T WHERE AFLTN_TYP_CD = 'GRD_STDNT_STAFF';
  IF (num = 0)
  THEN
    INSERT INTO KRIM_AFLTN_TYP_T (ACTV_IND,AFLTN_TYP_CD,DISPLAY_SORT_CD,EMP_AFLTN_TYP_IND,LAST_UPDT_DT,NM,OBJ_ID,VER_NBR)
      VALUES ('Y','GRD_STDNT_STAFF','e','Y',SYSDATE,'Graduate Student Staff',SYS_GUID(),1);
  END IF;
END;
/

DECLARE 
  num NUMBER;
BEGIN
  SELECT COUNT(*) INTO num FROM KRIM_AFLTN_TYP_T WHERE AFLTN_TYP_CD = 'RSRCH_STAFF';
  IF (num = 0)
  THEN
    INSERT INTO KRIM_AFLTN_TYP_T (ACTV_IND,AFLTN_TYP_CD,DISPLAY_SORT_CD,EMP_AFLTN_TYP_IND,LAST_UPDT_DT,NM,OBJ_ID,VER_NBR)
      VALUES ('Y','RSRCH_STAFF','f','Y',SYSDATE,'Research Staff',SYS_GUID(),1);
  END IF;
END;
/

DECLARE 
  num NUMBER;
BEGIN
  SELECT COUNT(*) INTO num FROM KRIM_AFLTN_TYP_T WHERE AFLTN_TYP_CD = 'SRVC_STAFF';
  IF (num = 0)
  THEN
    INSERT INTO KRIM_AFLTN_TYP_T (ACTV_IND,AFLTN_TYP_CD,DISPLAY_SORT_CD,EMP_AFLTN_TYP_IND,LAST_UPDT_DT,NM,OBJ_ID,VER_NBR)
      VALUES ('Y','SRVC_STAFF','g','Y',SYSDATE,'Service Staff',SYS_GUID(),1);
  END IF;
END;
/

DECLARE 
  num NUMBER;
BEGIN
  SELECT COUNT(*) INTO num FROM KRIM_AFLTN_TYP_T WHERE AFLTN_TYP_CD = 'SUPPRT_STAFF';
  IF (num = 0)
  THEN
    INSERT INTO KRIM_AFLTN_TYP_T (ACTV_IND,AFLTN_TYP_CD,DISPLAY_SORT_CD,EMP_AFLTN_TYP_IND,LAST_UPDT_DT,NM,OBJ_ID,VER_NBR)
      VALUES ('Y','SUPPRT_STAFF','h','Y',SYSDATE,'Support Staff',SYS_GUID(),1);
  END IF;
END;
/

DECLARE 
  num NUMBER;
BEGIN
  SELECT COUNT(*) INTO num FROM KRIM_AFLTN_TYP_T WHERE AFLTN_TYP_CD = 'OTH_ACADMC_GRP';
  IF (num = 0)
  THEN
    INSERT INTO KRIM_AFLTN_TYP_T (ACTV_IND,AFLTN_TYP_CD,DISPLAY_SORT_CD,EMP_AFLTN_TYP_IND,LAST_UPDT_DT,NM,OBJ_ID,VER_NBR)
      VALUES ('Y','OTH_ACADMC_GRP','i','N',SYSDATE,'Other Academic Group',SYS_GUID(),1);
  END IF;
END;
/

DECLARE 
  num NUMBER;
BEGIN
  SELECT COUNT(*) INTO num FROM KRIM_AFLTN_TYP_T WHERE AFLTN_TYP_CD = 'MED_STAFF';
  IF (num = 0)
  THEN
    INSERT INTO KRIM_AFLTN_TYP_T (ACTV_IND,AFLTN_TYP_CD,DISPLAY_SORT_CD,EMP_AFLTN_TYP_IND,LAST_UPDT_DT,NM,OBJ_ID,VER_NBR)
      VALUES ('Y','MED_STAFF','j','Y',SYSDATE,'Medical Staff',SYS_GUID(),1);
  END IF;
END;
/