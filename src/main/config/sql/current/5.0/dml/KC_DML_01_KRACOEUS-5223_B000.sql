INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '552','Sent when a protocol is added as a special review in  an award, that will result in IRB Linking.',
	'Special Review Inserted - {AWARD_NUMBER}',
	'Special Review Inserted - {AWARD_NUMBER}',  'Y', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '553','Sent when a linked award is removed from the award.',
	'Special Review Deleted - {AWARD_NUMBER}',
	'Special Review Deleted - {AWARD_NUMBER}',  'Y', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '552'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '553'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

insert into NOTIFICATION_MODULE_ROLE (NOTIFICATION_MODULE_ROLE_ID, MODULE_CODE, ROLE_NAME, OBJ_ID, VER_NBR, UPDATE_TIMESTAMP, UPDATE_USER)
	VALUES (SEQ_NTFCTN_MODULE_ROLE_ID.NEXTVAL, 1, 'KC-WKFLW:Unit Administrator', sys_guid(), 1, sysdate, 'admin')
/

insert into NOTIFICATION_MDL_ROLE_QLFR (NOTIFICATION_MDL_ROLE_QLFR_ID, NOTIFICATION_MODULE_ROLE_ID, QUALIFIER, OBJ_ID, VER_NBR, UPDATE_TIMESTAMP, UPDATE_USER)
	VALUES (SEQ_NTFCTN_MDL_ROLE_QLFR_ID.NEXTVAL, SEQ_NTFCTN_MODULE_ROLE_ID.CURRVAL ,
			'unitNumber', sys_guid(), 1, sysdate, 'admin')
/

insert into NOTIFICATION_MODULE_ROLE (NOTIFICATION_MODULE_ROLE_ID, MODULE_CODE, ROLE_NAME, OBJ_ID, VER_NBR, UPDATE_TIMESTAMP, UPDATE_USER)
	VALUES (SEQ_NTFCTN_MODULE_ROLE_ID.NEXTVAL, 1, 'KC-AWARD:Investigators', sys_guid(), 1, sysdate, 'admin')
/

insert into NOTIFICATION_MDL_ROLE_QLFR (NOTIFICATION_MDL_ROLE_QLFR_ID, NOTIFICATION_MODULE_ROLE_ID, QUALIFIER, OBJ_ID, VER_NBR, UPDATE_TIMESTAMP, UPDATE_USER)
	VALUES (SEQ_NTFCTN_MDL_ROLE_QLFR_ID.NEXTVAL, (select NOTIFICATION_MODULE_ROLE_ID from NOTIFICATION_MODULE_ROLE where MODULE_CODE = 1 and ROLE_NAME = 'KC-AWARD:Investigators'),
			'award', sys_guid(), 1, sysdate, 'admin')
/

insert into NOTIFICATION_MODULE_ROLE (NOTIFICATION_MODULE_ROLE_ID, MODULE_CODE, ROLE_NAME, OBJ_ID, VER_NBR, UPDATE_TIMESTAMP, UPDATE_USER)
	VALUES (SEQ_NTFCTN_MODULE_ROLE_ID.NEXTVAL, 1, 'KC-AWARD:All Unit Administrators', sys_guid(), 1, sysdate, 'admin')
/

insert into NOTIFICATION_MDL_ROLE_QLFR (NOTIFICATION_MDL_ROLE_QLFR_ID, NOTIFICATION_MODULE_ROLE_ID, QUALIFIER, OBJ_ID, VER_NBR, UPDATE_TIMESTAMP, UPDATE_USER)
	VALUES (SEQ_NTFCTN_MDL_ROLE_QLFR_ID.NEXTVAL, (select NOTIFICATION_MODULE_ROLE_ID from NOTIFICATION_MODULE_ROLE where MODULE_CODE = 1 and ROLE_NAME = 'KC-AWARD:All Unit Administrators'),
			'award', sys_guid(), 1, sysdate, 'admin')
/