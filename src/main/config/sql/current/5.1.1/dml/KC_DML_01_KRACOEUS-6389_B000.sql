insert into COEUS_SUB_MODULE (COEUS_SUB_MODULE_ID , MODULE_CODE , SUB_MODULE_CODE , DESCRIPTION, UPDATE_TIMESTAMP ,UPDATE_USER, VER_NBR, OBJ_ID)   values 
	(25, (SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'COI Disclosure'), 8, 'Screening', SYSDATE, 'admin', 1, SYS_GUID())
/

insert into COI_DISCLOSURE_EVENT_TYPE (EVENT_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID, EXCLUDE_FROM_MASTER_DISCL, ACTIVE_FLAG, 
		EXCLUDE_FIN_ENT, SYSTEM_EVENT, PROJECT_ID_LABEL, PROJECT_TITLE_LABEL)
	VALUES ('8', 'Screening Questionnaire Event Placeholder', SYSDATE, 'admin', 1, SYS_GUID(), 'Y', 'N', 
		'Y', 'Y', null, null)
/
