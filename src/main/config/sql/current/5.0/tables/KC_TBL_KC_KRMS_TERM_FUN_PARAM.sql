CREATE TABLE KC_KRMS_TERM_FUN_PARAM(
	KC_KRMS_TERM_FUN_PARAM_ID NUMBER(12,0),
	KC_KRMS_TERM_FUNCTION_ID NUMBER(12,0),
	PARAM_NAME VARCHAR2(40) NOT NULL,
	PARAM_TYPE VARCHAR2(100) default 'java.lang.Object' NOT NULL,
	PARAM_ORDER NUMBER(2,0) NOT NULL,
	UPDATE_TIMESTAMP DATE NOT NULL,
	UPDATE_USER VARCHAR2(60) NOT NULL,
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) NOT NULL
)
/

ALTER TABLE KC_KRMS_TERM_FUN_PARAM 
ADD CONSTRAINT PK_KC_KRMS_TERM_FUN_PARAM 
PRIMARY KEY (KC_KRMS_TERM_FUN_PARAM_ID)
/
