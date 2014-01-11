INSERT INTO PROTOCOL_STATUS ( PROTOCOL_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID ) 
VALUES ( '402', 'Recalled in Routing', sysdate, 'admin', SYS_GUID() ) 
/

INSERT INTO SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID ) 
VALUES ( '406', 'Recalled in Routing', sysdate, 'admin', SYS_GUID() ) 
/

INSERT INTO PROTOCOL_ACTION_TYPE ( PROTOCOL_ACTION_TYPE_CODE, DESCRIPTION, TRIGGER_SUBMISSION, TRIGGER_CORRESPONDENCE, FINAL_ACTION_FOR_BATCH_CORRESP, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID ) 
VALUES ( '405', 'Recalled in Routing', 'N', 'N', 'N', sysdate, 'admin', SYS_GUID() ) 
/