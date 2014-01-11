INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, ROLE_ID, PERM_ID, ACTV_IND, OBJ_ID, VER_NBR) VALUES (KRIM_ROLE_PERM_ID_S.NEXTVAL, 
(SELECT ROLE_ID FROM KRIM_ROLE_T RT WHERE RT.ROLE_NM = 'IRB Administrator' AND RT.NMSPC_CD = 'KC-UNT'), 
(SELECT PERM_ID FROM KRIM_PERM_T PT where PT.NM = 'Submit Protocol' AND PT.NMSPC_CD = 'KC-PROTOCOL'), 'Y', '903C58A133F3639FE040DC0A1F8A694A', 1);

INSERT INTO KRIM_TYP_T (KIM_TYP_ID, NM, SRVC_NM, ACTV_IND, NMSPC_CD, OBJ_ID, VER_NBR) VALUES 
(KRIM_TYP_ID_S.NEXTVAL, 'IRBApprover-Nested', 'protocolApproverRoleTypeService', 'Y', 'KC_SYS', '903C58A133F4639FE040DC0A1F8A694A', 1);

INSERT INTO KRIM_ROLE_T (ROLE_ID, ROLE_NM, NMSPC_CD, DESC_TXT, KIM_TYP_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
VALUES (KRIM_ROLE_ID_S.NEXTVAL, 'ProtocolApprover', 'KC-PROTOCOL', 'This role exists primarily to grant implicit Cancel permission to Protocol Aggregators and Admins', KRIM_TYP_ID_S.CURRVAL, 'Y', TO_DATE('09/14/2010', 'MM/DD/YYYY'), '903C58A133F5639FE040DC0A1F8A694A', 1);

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, OBJ_ID, VER_NBR, LAST_UPDT_DT) VALUES 
(KRIM_ROLE_MBR_ID_S.NEXTVAL, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'IRBApprover'), KRIM_ROLE_ID_S.CURRVAL, 'R', '903C58A133F6639FE040DC0A1F8A694A', 1, TO_DATE('09/14/2010', 'MM/DD/YYYY'));