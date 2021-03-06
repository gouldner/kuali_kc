/*
 * Copyright 2005-2013 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.opensource.org/licenses/ecl1.php
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.award.budget.document;

import org.kuali.kra.budget.document.BudgetDocumentRule;
import org.kuali.kra.budget.document.BudgetParentDocument;

/**
 * This class is for handling all rules related to AwardBudgetDocument.
 */
public class AwardBudgetDocumentRule extends BudgetDocumentRule {
    /**
     * 
     * @see org.kuali.kra.budget.document.BudgetDocumentRule#processRunAuditBudgetVersionRule(org.kuali.kra.budget.document.BudgetParentDocument)
     */
    protected boolean processRunAuditBudgetVersionRule(BudgetParentDocument parentDocument) {
        return true;
    }
    
}
