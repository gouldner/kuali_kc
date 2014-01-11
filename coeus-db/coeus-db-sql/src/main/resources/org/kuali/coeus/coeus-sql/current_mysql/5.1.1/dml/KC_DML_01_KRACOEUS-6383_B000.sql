DELIMITER /

INSERT INTO COI_RECOMENDED_ACTION_TYPE ( COI_RECOMENDED_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR ) 
VALUES ( 1, 'Recommend Management Plan', NOW(), 'admin', UUID(), 1 ) 
/
INSERT INTO COI_RECOMENDED_ACTION_TYPE ( COI_RECOMENDED_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR ) 
VALUES ( 2, 'Recommend Approve - No Conflict', NOW(), 'admin', UUID(), 1 ) 
/
INSERT INTO COI_RECOMENDED_ACTION_TYPE ( COI_RECOMENDED_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR ) 
VALUES ( 3, 'Recommend Further Review', NOW(), 'admin', UUID(), 1 ) 
/

DELIMITER ;
