TRUNCATE TABLE NARRATIVE_STATUS DROP STORAGE
/
INSERT INTO NARRATIVE_STATUS (NARRATIVE_STATUS_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('C','Complete','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO NARRATIVE_STATUS (NARRATIVE_STATUS_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('I','Incomplete','admin',SYSDATE,SYS_GUID(),1)
/
