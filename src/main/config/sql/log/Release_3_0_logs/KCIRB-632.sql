DECLARE
      notsys_prnplc_id VARCHAR2(40);
BEGIN
       BEGIN
            -- THIS IS PART OF RICE BOOTSTRAP AND HENCE SHOULD BE PRESENT IN OUR DB ALREADY
            SELECT PRNCPL_ID INTO notsys_prnplc_id FROM KRIM_PRNCPL_T WHERE UPPER(PRNCPL_NM) = 'NOTSYS';
       EXCEPTION
         WHEN NO_DATA_FOUND THEN 
              INSERT INTO KRIM_ENTITY_T (ACTV_IND,ENTITY_ID,LAST_UPDT_DT,OBJ_ID,VER_NBR) VALUES ('Y','1131',TO_DATE( '20081113140640', 'YYYYMMDDHH24MISS' ),'5B97C50B03B36110E0404F8189D85213',1);
              INSERT INTO KRIM_PRNCPL_T (ACTV_IND,ENTITY_ID,LAST_UPDT_DT,OBJ_ID,PRNCPL_ID,PRNCPL_NM,VER_NBR) VALUES ('Y','1131',TO_DATE( '20081113140642', 'YYYYMMDDHH24MISS' ),'5B97C50B03BB6110E0404F8189D85213','notsys','notsys',1);
       END;
     
     INSERT INTO KREN_CHNL_T (CHNL_ID, NM, DESC_TXT, SUBSCRB_IND, VER_NBR) VALUES (1000, 'KC Notification Channel', 'Channel dedicated for KC System generated Notifications', 'N', 1);
     INSERT INTO KREN_CHNL_PRODCR_T (CHNL_ID, PRODCR_ID) VALUES (1000, (SELECT PRODCR_ID FROM KREN_PRODCR_T WHERE NM = 'Notification System'));
     COMMIT;
END; 