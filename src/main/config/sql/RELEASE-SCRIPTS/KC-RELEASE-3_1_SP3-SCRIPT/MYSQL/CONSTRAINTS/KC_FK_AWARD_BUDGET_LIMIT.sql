ALTER TABLE AWARD_BUDGET_LIMIT ADD CONSTRAINT FK1_AWARD_BUDGET_LIMIT
  FOREIGN KEY (AWARD_ID) REFERENCES AWARD (AWARD_ID);

ALTER TABLE AWARD_BUDGET_LIMIT ADD CONSTRAINT FK2_AWARD_BUDGET_LIMIT 
  FOREIGN KEY (BUDGET_ID) REFERENCES AWARD_BUDGET_EXT (BUDGET_ID);