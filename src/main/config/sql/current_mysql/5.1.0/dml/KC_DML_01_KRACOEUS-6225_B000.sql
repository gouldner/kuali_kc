DELIMITER /

ALTER TABLE IACUC_REVIEWER_ATTACHMENTS 
	MODIFY UPDATE_USER VARCHAR(60)
/

ALTER TABLE REVIEWER_ATTACHMENTS 
	MODIFY UPDATE_USER VARCHAR(60)
/

DELIMITER ;
