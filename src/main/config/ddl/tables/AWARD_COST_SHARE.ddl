CREATE TABLE AWARD_COST_SHARE ( 
	AWARD_COST_SHARE_ID		NUMBER(8,0)constraint AWARD_COST_SHAREN0 NOT NULL ENABLE,
    AWARD_ID       			NUMBER constraint AWARD_COST_SHAREN1 NOT NULL ENABLE,
    SEQUENCE_NUMBER        	NUMBER(8,0) constraint AWARD_COST_SHAREN2 NOT NULL ENABLE,
    FISCAL_YEAR            	VARCHAR2(4) constraint AWARD_COST_SHAREN3 NOT NULL ENABLE,
    COST_SHARE_PERCENTAGE	NUMBER(5,2),
    COST_SHARE_TYPE_CODE 	NUMBER(3,0) constraint AWARD_COST_SHAREN4 NOT NULL ENABLE,
    SOURCE         			VARCHAR2(7) constraint AWARD_COST_SHAREN5 NOT NULL ENABLE,
    DESTINATION		    	VARCHAR2(7) constraint AWARD_COST_SHAREN6 NOT NULL ENABLE,
    COMMITMENT_AMOUNT       NUMBER(12,2),
    UPDATE_TIMESTAMP       	DATE constraint AWARD_COST_SHAREN7 NOT NULL ENABLE,
    UPDATE_USER            	VARCHAR2(60) constraint AWARD_COST_SHAREN8 NOT NULL ENABLE,
    VER_NBR 				NUMBER(8,0) DEFAULT 1  constraint  AWARD_COST_SHAREN9  NOT NULL ENABLE,
	OBJ_ID 					VARCHAR2(36) DEFAULT SYS_GUID()  constraint  AWARD_COST_SHAREN10  NOT NULL ENABLE,
    CONSTRAINT PK_AWARD_COST_SHARE PRIMARY KEY(AWARD_COST_SHARE_ID) ENABLE,
    CONSTRAINT U_AWARD_COST_SHARE UNIQUE(AWARD_ID,SEQUENCE_NUMBER,FISCAL_YEAR,COST_SHARE_TYPE_CODE,SOURCE,DESTINATION) ENABLE,
    CONSTRAINT FK_AWARD_COST_SHARE_TYPE FOREIGN KEY(COST_SHARE_TYPE_CODE)REFERENCES COST_SHARE_TYPE(COST_SHARE_TYPE_CODE) ENABLE,
	CONSTRAINT FK_AWARD_COST_SHARE_AWARD_ID FOREIGN KEY (AWARD_ID) REFERENCES AWARD(AWARD_ID) ENABLE
)