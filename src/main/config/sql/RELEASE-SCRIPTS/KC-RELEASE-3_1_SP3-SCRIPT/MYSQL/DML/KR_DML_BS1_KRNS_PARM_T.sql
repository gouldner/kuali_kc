insert into KRNS_PARM_T (appl_nmspc_cd,NMSPC_CD,PARM_DTL_TYP_CD,PARM_NM,PARM_TYP_CD,TXT,PARM_DESC_TXT,CONS_CD,OBJ_ID)  values ('KC','KC-PD','Document','STIPEND_COST_ELEMENTS','CONFG','400315','STIPEND_COST_ELEMENTS used in Phs fellowship Supplemental s2s form','A',uuid()); 
insert into KRNS_PARM_T (appl_nmspc_cd,NMSPC_CD,PARM_DTL_TYP_CD,PARM_NM,PARM_TYP_CD,TXT,PARM_DESC_TXT,CONS_CD,OBJ_ID)  values ('KC','KC-PD','Document','TUITION_COST_ELEMENTS','CONFG','422311','TUITION_COST_ELEMENTS used in Phs fellowship Supplemental s2s form','A',uuid()); 
update KRNS_PARM_T set PARM_NM = 'IRB_DISPLAY_REVIEWER_NAME_TO_OTHER_PROTOCOL_PERSONNEL' where PARM_NM = 'IRB_DISPLAY_REVIEWER_NAME_TO_OTHERS';
update KRNS_PARM_T set PARM_NM = 'IRB_DISPLAY_REVIEWER_NAME_TO_PROTOCOL_PERSONNEL', PARM_DESC_TXT='Display Reviewer Name to Protocol Personnel' where PARM_NM='IRB_DISPLAY_REVIEWER_NAME_TO_OTHER_PROTOCOL_PERSONNEL';
delete from KRNS_PARM_T where PARM_NM = 'IRB_DISPLAY_REVIEWER_NAME_TO_PI';
commit;