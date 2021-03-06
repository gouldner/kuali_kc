/*
 * Copyright 2005-2013 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.osedu.org/licenses/ECL-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.irb.personnel;

import static org.kuali.kra.infrastructure.KraServiceLocator.getService;

import org.kuali.kra.protocol.personnel.ProtocolPersonnelAuditRuleBase;


/**
 * Rules that invoke audit mode for KeyPersonnel
 */
public class ProtocolPersonnelAuditRule extends ProtocolPersonnelAuditRuleBase {
    
    /**
     * This method is to get personnel sevice
     * @return ProtocolPersonnelService
     */
    protected ProtocolPersonnelService getProtocolPersonnelService() {
        return getService(ProtocolPersonnelService.class);
    }
}
