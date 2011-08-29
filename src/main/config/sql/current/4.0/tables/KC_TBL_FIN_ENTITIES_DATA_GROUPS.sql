CREATE TABLE FIN_ENTITIES_DATA_GROUPS ( 
    DATA_GROUP_ID VARCHAR2(3) NOT NULL, 
    DATA_GROUP_NAME VARCHAR2(30) NOT NULL, 
    DATA_GROUP_SORT_ID NUMBER(3,0) NOT NULL, 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) NOT NULL)
/
ALTER TABLE FIN_ENTITIES_DATA_GROUPS 
ADD CONSTRAINT PK_FIN_ENTITIES_DATA_GROUPS 
PRIMARY KEY (DATA_GROUP_ID)
/
