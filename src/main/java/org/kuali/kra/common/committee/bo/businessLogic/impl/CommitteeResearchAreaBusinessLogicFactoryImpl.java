/*
 * Copyright 2005-2010 The Kuali Foundation
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
package org.kuali.kra.common.committee.bo.businessLogic.impl;

import org.kuali.kra.common.committee.bo.CommitteeResearchArea;
import org.kuali.kra.common.committee.bo.businessLogic.CommonCommitteeCollaboratorBusinessLogicFactory;
import org.kuali.kra.common.committee.bo.businessLogic.CommonCommitteeCollaboratorBusinessLogicFactoryGroup;
import org.kuali.kra.common.committee.bo.businessLogic.CommonCommitteeResearchAreaBusinessLogic;

public class CommitteeResearchAreaBusinessLogicFactoryImpl implements CommonCommitteeCollaboratorBusinessLogicFactory<CommitteeResearchArea, CommonCommitteeResearchAreaBusinessLogic> {
    
    private CommonCommitteeCollaboratorBusinessLogicFactoryGroup committeeCollaboratorFactoryGroup;
    
    
    public void setCommitteeCollaboratorBusinessLogicFactoryGroup(CommonCommitteeCollaboratorBusinessLogicFactoryGroup committeeCollaboratorFactoryGroup) {
        this.committeeCollaboratorFactoryGroup = committeeCollaboratorFactoryGroup;
    }

    public CommonCommitteeCollaboratorBusinessLogicFactoryGroup getCommitteeCollaboratorFactoryGroup() {
        return committeeCollaboratorFactoryGroup;
    }

    
    public CommonCommitteeResearchAreaBusinessLogic getBusinessLogicFor(CommitteeResearchArea businessObject) {
        return new CommitteeResearchAreaBusinessLogicImpl(businessObject, getCommitteeCollaboratorFactoryGroup());
    }

}
