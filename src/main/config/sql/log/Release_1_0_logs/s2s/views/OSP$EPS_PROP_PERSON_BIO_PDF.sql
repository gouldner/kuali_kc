
CREATE OR REPLACE VIEW OSP$EPS_PROP_PERSON_BIO_PDF ( 
	   	  		  PROPOSAL_NUMBER, PERSON_ID, BIO_NUMBER, BIO_PDF, FILE_NAME, UPDATE_TIMESTAMP, UPDATE_USER ) 
	   AS select  EPS_PROP_PERSON_BIO.PROPOSAL_NUMBER, decode(PERSON_ID,null,ROLODEX_ID,PERSON_ID) PERSON_ID, 
	   	  		  				   EPS_PROP_PERSON_BIO.BIO_NUMBER,BIO_DATA, 
	   	  		  				   EPS_PROP_PERSON_BIO.FILE_NAME, EPS_PROP_PERSON_BIO.UPDATE_TIMESTAMP, EPS_PROP_PERSON_BIO.UPDATE_USER
	   from EPS_PROP_PERSON_BIO, EPS_PROP_PERSON_BIO_ATTACHMENT
	   where  EPS_PROP_PERSON_BIO.PROPOSAL_NUMBER = EPS_PROP_PERSON_BIO_ATTACHMENT.PROPOSAL_NUMBER(+) and
	   		  EPS_PROP_PERSON_BIO.PROP_PERSON_NUMBER = EPS_PROP_PERSON_BIO_ATTACHMENT.PROP_PERSON_NUMBER(+) and
	   		  EPS_PROP_PERSON_BIO.BIO_NUMBER = EPS_PROP_PERSON_BIO_ATTACHMENT.BIO_NUMBER(+);