-- Table Script
CREATE TABLE COMM_MEMBERSHIPS ( 
    COMM_MEMBERSHIPS_ID NUMBER(12,0) NOT NULL,
    COMMITTEE_ID VARCHAR2(15) NOT NULL,
    PERSON_ID VARCHAR2(9) NOT NULL,
    MEMBERSHIP_ID VARCHAR2(10) NOT NULL,
    SEQUENCE_NUMBER NUMBER(4,0) NOT NULL,
    NON_EMPLOYEE_FLAG VARCHAR2(1) NOT NULL,
    PAID_MEMBER_FLAG VARCHAR2(1) NOT NULL,
    TERM_START_DATE DATE NOT NULL,
    TERM_END_DATE DATE,
    MEMBERSHIP_TYPE_CODE VARCHAR2(3) NOT NULL,
    COMMENTS CLOB,
    CONTACT_NOTES CLOB,
    TRAINING_NOTES CLOB,
    UPDATE_TIMESTAMP DATE, 
    UPDATE_USER VARCHAR2(60), 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL);

-- Primary Key Constraint 
ALTER TABLE COMM_MEMBERSHIPS 
ADD CONSTRAINT PK_COMM_MEMBERSHIPS 
PRIMARY KEY (COMM_MEMBERSHIPS_ID);
 

-- Unique Constrains 
ALTER TABLE COMM_MEMBERSHIPS 
ADD CONSTRAINT UQ_COMM_MEMBERSHIPS 
UNIQUE (MEMBERSHIP_ID, SEQUENCE_NUMBER);

-- Foreign Key Constraint(s)  
ALTER TABLE COMM_MEMBERSHIPS 
ADD CONSTRAINT FK_COMM_MEMBERSHIPS 
FOREIGN KEY (COMMITTEE_ID) 
REFERENCES COMMITTEE (COMMITTEE_ID);

ALTER TABLE COMM_MEMBERSHIPS 
ADD CONSTRAINT FK_COMM_MEMBERSHIPS_2 
FOREIGN KEY (MEMBERSHIP_TYPE_CODE) 
REFERENCES COMM_MEMBERSHIP_TYPE (MEMBERSHIP_TYPE_CODE);

-- View for Coeus compatibility 
CREATE OR REPLACE VIEW OSP$COMM_MEMBERSHIPS AS

SELECT
    CM.COMMITTEE_ID,
    CM.PERSON_ID,
    CM.MEMBERSHIP_ID,
    CM.SEQUENCE_NUMBER,
    RD.LAST_NAME || ', ' || RD.FIRST_NAME || ' ' || RD.MIDDLE_NAME AS PERSON_NAME,
    CM.NON_EMPLOYEE_FLAG,
    CM.PAID_MEMBER_FLAG,
    CM.TERM_START_DATE,
    CM.TERM_END_DATE,
    CM.MEMBERSHIP_TYPE_CODE,
    CM.COMMENTS,
    CM.UPDATE_TIMESTAMP,
    CM.UPDATE_USER
FROM COMM_MEMBERSHIPS CM,
     ROLODEX RD
WHERE CM.PERSON_ID = RD.ROLODEX_ID
  AND CM.NON_EMPLOYEE_FLAG = 'Y'

UNION ALL

SELECT
    CM.COMMITTEE_ID,
    CM.PERSON_ID,
    CM.MEMBERSHIP_ID,
    CM.SEQUENCE_NUMBER,
    PS.LAST_NAME || ', ' || PS.FIRST_NAME || ' ' || PS.MIDDLE_NAME AS PERSON_NAME,
    CM.NON_EMPLOYEE_FLAG,
    CM.PAID_MEMBER_FLAG,
    CM.TERM_START_DATE,
    CM.TERM_END_DATE,
    CM.MEMBERSHIP_TYPE_CODE,
    CM.COMMENTS,
    CM.UPDATE_TIMESTAMP,
    CM.UPDATE_USER
FROM COMM_MEMBERSHIPS CM,
     PERSON PS
WHERE CM.PERSON_ID = PS.PERSON_ID
  AND CM.NON_EMPLOYEE_FLAG = 'N'

;

COMMIT;