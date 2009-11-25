CREATE TABLE PROTOCOL_PERSON_ROLES (
    PROTOCOL_PERSON_ROLE_ID VARCHAR2 (12) NOT NULL, 
    DESCRIPTION VARCHAR2 (250) NOT NULL, 
    UNIT_DETAILS_REQUIRED CHAR (1) DEFAULT 'N' NOT NULL, 
    UPDATE_TIMESTAMP DATE, 
    UPDATE_USER VARCHAR2 (60) , 
    AFFILIATION_DETAILS_REQUIRED CHAR (1) DEFAULT 'N' NOT NULL, 
    TRAINING_DETAILS_REQUIRED CHAR (1) DEFAULT 'N' NOT NULL, 
    VER_NBR NUMBER (8, 0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2 (36) DEFAULT SYS_GUID () NOT NULL) ;

ALTER TABLE PROTOCOL_PERSON_ROLES 
    ADD CONSTRAINT PK_PROTOCOL_PERSON_ROLES 
            PRIMARY KEY (PROTOCOL_PERSON_ROLE_ID) ;