DELIMITER /
INSERT INTO KRIM_ROLE_MBR_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, VER_NBR, OBJ_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, LAST_UPDT_DT)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_MBR_ID_S), 1, UUID(), (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Modify Training' AND NMSPC_CD = 'KC-SYS'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 'P', NOW())
/

DELIMITER ;
