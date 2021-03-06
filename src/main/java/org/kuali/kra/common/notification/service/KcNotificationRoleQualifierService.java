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
package org.kuali.kra.common.notification.service;

import org.kuali.kra.common.notification.bo.NotificationModuleRoleQualifier;

/**
 * Defines the service to fill in module role qualifier information.
 */
public interface KcNotificationRoleQualifierService {
    
    /**
     * Returns the appropriate value given the information in the passed in module role qualifier.
     * 
     * @param qualifier the module role qualifier
     * @return the associated value, or null if not found.
     */
    String getRoleQualifierValue(NotificationModuleRoleQualifier qualifier);

}