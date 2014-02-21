--Important:

--This script will do the following:
  --1) Cleans up all junk entries in our DB tables that could be migrated.

-- This is necessary because some of our tables do not have fk constraints.  So some of our tables are referencing
-- old person id that no longer exist.  Maybe we should use fk constraints :-)

--Any errors detected during data transformation will generate a message within the dbms.

--Enjoy :-)

DELETE FROM AWARD_PERSONS T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);
    
DELETE FROM  AWARD_UNIT_CONTACTS T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM BUDGET_PERSONNEL_DETAILS T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM BUDGET_PERSONS T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM BUDGET_PER_DET_RATE_AND_BASE T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM COMM_MEMBERSHIPS T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM COMM_SCHEDULE_ATTENDANCE T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM EPS_PROP_PERSON T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM EPS_PROP_PERSON_BIO T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM EPS_PROP_USER_ROLES T WHERE T.USER_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM KRA_USER T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM PERSON_DEGREE T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM PERSON_TRAINING T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM PROPOSAL_PERSONS T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM PROPOSAL_PER_CREDIT_SPLIT T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM PROPOSAL_UNITS T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM PROPOSAL_UNIT_CREDIT_SPLIT T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM PROP_ROLE_TEMPLATE T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM PROTOCOL_PERSONS T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM PROTOCOL_REVIEWERS T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM PROTOCOL_UNITS T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM UNIT_ACL T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);
    
DELETE FROM UNIT_ADMINISTRATOR T WHERE T.PERSON_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

DELETE FROM NARRATIVE_USER_RIGHTS T WHERE T.USER_ID NOT IN (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T);

commit;
