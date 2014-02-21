DELIMITER /
CREATE TABLE IACUC_PROTO_AMEND_RENEWAL ( 
    PROTO_AMEND_RENEWAL_ID DECIMAL(12,0) NOT NULL, 
    PROTO_AMEND_REN_NUMBER VARCHAR(20) NOT NULL, 
    DATE_CREATED DATE NOT NULL, 
    SUMMARY VARCHAR(4000), 
    PROTOCOL_ID DECIMAL(12,0) NOT NULL, 
    PROTOCOL_NUMBER VARCHAR(20), 
    SEQUENCE_NUMBER DECIMAL(4,0), 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR(60) NOT NULL, 
    VER_NBR DECIMAL(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR(36) NOT NULL) 
/


ALTER TABLE IACUC_PROTO_AMEND_RENEWAL 
ADD CONSTRAINT PK_IACUC_PROTO_AMEND_RENEWAL 
PRIMARY KEY (PROTO_AMEND_RENEWAL_ID) 
/


DELIMITER ;
