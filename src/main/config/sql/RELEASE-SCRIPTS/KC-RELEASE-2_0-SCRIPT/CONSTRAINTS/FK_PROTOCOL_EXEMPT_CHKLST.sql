ALTER TABLE PROTOCOL_EXEMPT_CHKLST 
    ADD CONSTRAINT FK_PROTOCOL_EXEMPT_CHKLST1 FOREIGN KEY (PROTOCOL_ID) 
                REFERENCES PROTOCOL (PROTOCOL_ID) ;

ALTER TABLE PROTOCOL_EXEMPT_CHKLST 
    ADD CONSTRAINT FK_PROTOCOL_EXEMPT_CHKLST2 FOREIGN KEY (SUBMISSION_ID_FK) 
                REFERENCES PROTOCOL_SUBMISSION (SUBMISSION_ID) ;

ALTER TABLE PROTOCOL_EXEMPT_CHKLST 
    ADD CONSTRAINT FK_PROTOCOL_EXEMPT_CHKLST3 FOREIGN KEY (EXEMPT_STUDIES_CHECKLIST_CODE) 
                REFERENCES EXEMPT_STUDIES_CHECKLIST (EXEMPT_STUDIES_CHECKLIST_CODE) ;