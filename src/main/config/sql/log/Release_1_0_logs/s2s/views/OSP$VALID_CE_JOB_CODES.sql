create or replace view OSP$VALID_CE_JOB_CODES as 
	select COST_ELEMENT,JOB_CODE,UPDATE_TIMESTAMP,UPDATE_USER
	from VALID_CE_JOB_CODES;