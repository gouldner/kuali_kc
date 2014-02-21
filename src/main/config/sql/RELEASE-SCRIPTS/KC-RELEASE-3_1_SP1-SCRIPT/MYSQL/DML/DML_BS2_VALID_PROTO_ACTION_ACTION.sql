INSERT INTO VALID_PROTO_ACTION_ACTION
    (VALID_PROTO_ACTION_ACTION_ID, PROTOCOL_ACTION_TYPE_CODE, ACTION_NUMBER, FOLLOWUP_ACTION_CODE, USER_PROMPT_FLAG, USER_PROMPT, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID) 
VALUES
    (1, 205, 1, 109, 'Y', 'Do you want to include this submission in an Agenda', NOW(), 'admin', UUID());
    
INSERT INTO VALID_PROTO_ACTION_ACTION
    (VALID_PROTO_ACTION_ACTION_ID, PROTOCOL_ACTION_TYPE_CODE, ACTION_NUMBER, FOLLOWUP_ACTION_CODE, USER_PROMPT_FLAG, USER_PROMPT, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID) 
VALUES
    (2, 206, 1, 109, 'Y', 'Do you want to include this submission in an Agenda', NOW(), 'admin', UUID());

INSERT INTO VALID_PROTO_ACTION_ACTION(VALID_PROTO_ACTION_ACTION_ID, PROTOCOL_ACTION_TYPE_CODE, ACTION_NUMBER, FOLLOWUP_ACTION_CODE, USER_PROMPT_FLAG, USER_PROMPT, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, COMM_DECISION_MOTION_TYPE_CODE)
  VALUES(3, '308', 1, '204', 'N', NULL, NOW(), 'admin', UUID(), '1');
  
INSERT INTO VALID_PROTO_ACTION_ACTION(VALID_PROTO_ACTION_ACTION_ID, PROTOCOL_ACTION_TYPE_CODE, ACTION_NUMBER, FOLLOWUP_ACTION_CODE, USER_PROMPT_FLAG, USER_PROMPT, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, COMM_DECISION_MOTION_TYPE_CODE)
  VALUES(4, '308', 1, '304', 'N', NULL, NOW(), 'admin', UUID(), '2');

INSERT INTO VALID_PROTO_ACTION_ACTION(VALID_PROTO_ACTION_ACTION_ID, PROTOCOL_ACTION_TYPE_CODE, ACTION_NUMBER, FOLLOWUP_ACTION_CODE, USER_PROMPT_FLAG, USER_PROMPT, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, COMM_DECISION_MOTION_TYPE_CODE)
  VALUES(5, '308', 1, '203', 'N', NULL, NOW(), 'admin', UUID(), '3');

INSERT INTO VALID_PROTO_ACTION_ACTION(VALID_PROTO_ACTION_ACTION_ID, PROTOCOL_ACTION_TYPE_CODE, ACTION_NUMBER, FOLLOWUP_ACTION_CODE, USER_PROMPT_FLAG, USER_PROMPT, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, COMM_DECISION_MOTION_TYPE_CODE)
  VALUES(6, '308', 1, '202', 'N', NULL, NOW(), 'admin', UUID(), '4');

COMMIT;
