TRUNCATE TABLE COMM_DECISION_MOTION_TYPE DROP STORAGE
/
INSERT INTO COMM_DECISION_MOTION_TYPE (COMM_DECISION_MOTION_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('1','Approve','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COMM_DECISION_MOTION_TYPE (COMM_DECISION_MOTION_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('2','Disapprove','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COMM_DECISION_MOTION_TYPE (COMM_DECISION_MOTION_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('3','Specific Minor Revisions','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COMM_DECISION_MOTION_TYPE (COMM_DECISION_MOTION_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('4','Substantive Revisions Required','admin',SYSDATE,SYS_GUID(),1)
/
