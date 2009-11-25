ALTER TABLE PROTOCOL_PERSONS 
    ADD CONSTRAINT FK_PROTOCOL_PERSONS_PROTOCOL FOREIGN KEY (PROTOCOL_ID) 
                REFERENCES PROTOCOL (PROTOCOL_ID) ;

ALTER TABLE PROTOCOL_PERSONS 
    ADD CONSTRAINT FK_PROTOCOL_PERS_AFFILIATION FOREIGN KEY (AFFILIATION_TYPE_CODE) 
                REFERENCES AFFILIATION_TYPE (AFFILIATION_TYPE_CODE) ;

ALTER TABLE PROTOCOL_PERSONS 
    ADD CONSTRAINT FK_PROTOCOL_PERSONS_ROLE FOREIGN KEY (PROTOCOL_PERSON_ROLE_ID) 
                REFERENCES PROTOCOL_PERSON_ROLES (PROTOCOL_PERSON_ROLE_ID) ;