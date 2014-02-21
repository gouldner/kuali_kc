-- KEW data for Proposal Development Person Certification Questionnaire

SET DEFINE OFF;

INSERT INTO KREW_ACTN_TKN_T (ACTN_TKN_ID,DOC_HDR_ID,PRNCPL_ID,ACTN_CD,ACTN_DT,DOC_VER_NBR,CUR_IND,VER_NBR) 
  VALUES (KREW_ACTN_TKN_S.NEXTVAL,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'Proposal Person Certification'),'admin','S',TO_TIMESTAMP('08-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),1,1,1);
INSERT INTO KREW_ACTN_TKN_T (ACTN_TKN_ID,DOC_HDR_ID,PRNCPL_ID,ACTN_CD,ACTN_DT,DOC_VER_NBR,CUR_IND,VER_NBR) 
  VALUES (KREW_ACTN_TKN_S.NEXTVAL,(SELECT DOC_HDR_ID FROM KREW_DOC_HDR_T WHERE TTL = 'Proposal Person Certification'),'admin','C',TO_TIMESTAMP('08-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),1,1,1);
  
COMMIT;