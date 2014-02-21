ALTER TABLE NOTIFICATION_TYPE_RECIPIENT RENAME COLUMN ROLE_ID TO ROLE_NAME;
ALTER TABLE NOTIFICATION_TYPE_RECIPIENT MODIFY ROLE_NAME VARCHAR2(125);

-- Run only for servers that already have entries matching this.  Full integration (without hardcoding) between this and KCIRB-1299 should be done in the release scripts
UPDATE NOTIFICATION_TYPE_RECIPIENT SET ROLE_NAME = 'KC-PROTOCOL:Protocol Aggregator' WHERE ROLE_NAME = '1117';
UPDATE NOTIFICATION_TYPE_RECIPIENT SET ROLE_NAME = 'KC-UNT:IRB Administrator' WHERE ROLE_NAME = '1119';