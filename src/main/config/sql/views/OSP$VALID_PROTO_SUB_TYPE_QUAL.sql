-- View for Coeus compatibility 
CREATE OR REPLACE VIEW OSP$VALID_PROTO_SUB_TYPE_QUAL AS SELECT 
    SUBMISSION_TYPE_CODE, 
    SUBMISSION_TYPE_QUAL_CODE, 
    UPDATE_TIMESTAMP, 
    UPDATE_USER
FROM VALID_PROTO_SUB_TYPE_QUAL;
