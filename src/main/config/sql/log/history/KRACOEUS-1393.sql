-- INSERTING into EN_WRKGRP_T
Insert into EN_WRKGRP_T (WRKGRP_ID,WRKGRP_VER_NBR,WRKGRP_NM,WRKGRP_ACTV_IND,WRKGRP_TYP_CD,WRKGRP_DESC,WRKGRP_CUR_IND,DOC_HDR_ID,DB_LOCK_VER_NBR) values (2,0,'Departmental_Routing',1,D,'Departmental_Routing',1,2,2);

-- INSERTING into EN_WRKGRP_MBR_T

Insert into EN_WRKGRP_MBR_T (WRKGRP_MBR_PRSN_EN_ID,WRKGRP_ID,WRKGRP_MBR_TYP,WRKGRP_VER_NBR,DB_LOCK_VER_NBR) values ('pcberg',2,'U',0,2);
Insert into EN_WRKGRP_MBR_T (WRKGRP_MBR_PRSN_EN_ID,WRKGRP_ID,WRKGRP_MBR_TYP,WRKGRP_VER_NBR,DB_LOCK_VER_NBR) values ('aslusar',2,'U',0,2);

