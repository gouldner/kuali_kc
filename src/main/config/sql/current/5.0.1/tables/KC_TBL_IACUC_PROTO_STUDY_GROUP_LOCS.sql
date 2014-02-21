CREATE TABLE IACUC_PROTO_STUDY_GROUP_LOCS ( 
    IACUC_PROT_STUD_GROU_LOCS_ID NUMBER(12,0) NOT NULL, 
    PROTOCOL_ID NUMBER(12,0) NOT NULL, 
    PROTOCOL_NUMBER VARCHAR2(20) NOT NULL, 
    SEQUENCE_NUMBER NUMBER(3,0) NOT NULL, 
    IACUC_PROTOCOL_STUDY_GROUPS_ID NUMBER(12,0) NOT NULL, 
    STUDY_GROUP_LOCATION_ID NUMBER(3,0) NOT NULL, 
    LOCATION_TYPE_CODE NUMBER(3,0) NOT NULL, 
    LOCATION_ID NUMBER(3,0) NOT NULL, 
    STUDY_GROUP_LOCATION_DESC VARCHAR2(2000), 
    LOCATION_ROOM VARCHAR2(60), 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    LOCATION_GROUP_INDEX NUMBER(6,0)NOT NULL, 
    OBJ_ID VARCHAR2(36) NOT NULL) 
/


ALTER TABLE IACUC_PROTO_STUDY_GROUP_LOCS 
ADD CONSTRAINT PK_IACUC_PROTO_STUDY_GROUP_LOC 
PRIMARY KEY (IACUC_PROT_STUD_GROU_LOCS_ID) 
/

