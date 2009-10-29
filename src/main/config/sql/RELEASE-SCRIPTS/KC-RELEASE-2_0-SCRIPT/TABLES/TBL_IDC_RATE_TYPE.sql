CREATE TABLE IDC_RATE_TYPE (
    IDC_RATE_TYPE_CODE NUMBER (3, 0) NOT NULL, 
    DESCRIPTION VARCHAR2 (200) NOT NULL, 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2 (60) NOT NULL, 
    VER_NBR NUMBER (8, 0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2 (36) DEFAULT SYS_GUID () NOT NULL) ;

ALTER TABLE IDC_RATE_TYPE 
    ADD CONSTRAINT PK_IDC_RATE_TYPE_CODE 
            PRIMARY KEY (IDC_RATE_TYPE_CODE) ;