DELIMITER /

CREATE TABLE COI_RECOMENDED_ACTION_TYPE ( 
    COI_RECOMENDED_TYPE_CODE VARCHAR(3) NOT NULL, 
    DESCRIPTION VARCHAR(200) NOT NULL, 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR(60) NOT NULL, 
    VER_NBR DECIMAL(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR(36) NOT NULL) 
/


ALTER TABLE COI_RECOMENDED_ACTION_TYPE 
ADD CONSTRAINT COI_RECOMM_ACTION_TYPE_PK 
PRIMARY KEY (COI_RECOMENDED_TYPE_CODE) 
/

DELIMITER ;
