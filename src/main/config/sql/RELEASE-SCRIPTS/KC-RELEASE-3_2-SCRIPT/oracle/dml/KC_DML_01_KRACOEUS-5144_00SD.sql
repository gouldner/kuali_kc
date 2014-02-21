UPDATE EPS_PROP_COLUMNS_TO_ALTER SET COLUMN_LABEL = 'Opportunity ID' 
WHERE COLUMN_NAME = 'PROGRAM_ANNOUNCEMENT_NUMBER' AND COLUMN_LABEL = 'Program Number'
/
UPDATE EPS_PROP_COLUMNS_TO_ALTER SET COLUMN_LABEL = 'Opportunity Title' 
WHERE COLUMN_NAME = 'PROGRAM_ANNOUNCEMENT_TITLE' AND COLUMN_LABEL = 'Program Title'
/
UPDATE EPS_PROP_COLUMNS_TO_ALTER SET COLUMN_LABEL = 'Project Title' 
WHERE COLUMN_NAME = 'TITLE' AND COLUMN_LABEL = 'Title'
/
UPDATE EPS_PROP_COLUMNS_TO_ALTER SET COLUMN_LABEL = 'Sponsor Deadline Type' 
WHERE COLUMN_NAME = 'DEADLINE_TYPE' AND COLUMN_LABEL = 'Deadline Type'
/

COMMIT
/
