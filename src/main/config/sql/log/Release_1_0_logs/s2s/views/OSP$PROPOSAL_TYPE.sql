
CREATE OR REPLACE VIEW osp$proposal_type ( PROPOSAL_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
AS select PROPOSAL_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER
	from proposal_type;
