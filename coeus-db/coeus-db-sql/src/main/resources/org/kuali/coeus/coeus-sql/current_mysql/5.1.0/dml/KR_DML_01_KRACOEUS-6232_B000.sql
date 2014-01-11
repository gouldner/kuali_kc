DELIMITER /

INSERT INTO KRIM_ROLE_MBR_ID_BS_S VALUES(NULL)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID,ROLE_ID,MBR_TYP_CD,MBR_ID,LAST_UPDT_DT,OBJ_ID,VER_NBR)
    VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_MBR_ID_BS_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-UNT' AND ROLE_NM = 'IACUCApprover'),'R',
    (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-IACUC' AND ROLE_NM = 'IACUC ProtocolApprover'),NOW(),UUID(),1)
/

DELIMITER ;
