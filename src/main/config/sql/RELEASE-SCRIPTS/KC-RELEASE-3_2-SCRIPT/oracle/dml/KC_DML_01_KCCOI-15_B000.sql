INSERT INTO COMMITTEE_TYPE (COMMITTEE_TYPE_CODE, DESCRIPTION, UPDATE_USER, UPDATE_TIMESTAMP, OBJ_ID, VER_NBR)
VALUES ('2', 'COI', 'admin', SYSDATE, SYS_GUID(), 1)
/

TRUNCATE TABLE COI_REVIEW_TYPE DROP STORAGE
/
INSERT INTO COI_REVIEW_TYPE (COI_REVIEW_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('1','Full','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COI_REVIEW_TYPE (COI_REVIEW_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('2','Expedited','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COI_REVIEW_TYPE (COI_REVIEW_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('3','COI Review not required','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COI_REVIEW_TYPE (COI_REVIEW_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('4','Response','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COI_REVIEW_TYPE (COI_REVIEW_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('5','FYI','admin',SYSDATE,SYS_GUID(),1)
/


TRUNCATE TABLE COI_COMMITTEE_ROLE_TYPE DROP STORAGE
/
INSERT INTO COI_COMMITTEE_ROLE_TYPE (COI_COMMITTEE_ROLE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('1','Chair','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COI_COMMITTEE_ROLE_TYPE (COI_COMMITTEE_ROLE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('2','Vice Chair','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COI_COMMITTEE_ROLE_TYPE (COI_COMMITTEE_ROLE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('3','Expedited Reviewer','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COI_COMMITTEE_ROLE_TYPE (COI_COMMITTEE_ROLE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('4','COI Coordinator/Administrator','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COI_COMMITTEE_ROLE_TYPE (COI_COMMITTEE_ROLE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('5','Legal Counsel','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COI_COMMITTEE_ROLE_TYPE (COI_COMMITTEE_ROLE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('6','Other Staff','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COI_COMMITTEE_ROLE_TYPE (COI_COMMITTEE_ROLE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('7','IP/Tech Transfer Office Staff','admin',SYSDATE,SYS_GUID(),1)
/
