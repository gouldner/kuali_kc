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
package org.kuali.kra.protocol.auth;

import java.util.Collections;

import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.infrastructure.PermissionConstants;
import org.kuali.kra.protocol.ProtocolBase;
import org.kuali.rice.core.api.resourceloader.GlobalResourceLoader;
import org.kuali.rice.kew.api.action.ActionRequest;
import org.kuali.rice.kew.api.action.RoutingReportCriteria;
import org.kuali.rice.kew.api.action.WorkflowDocumentActionsService;
import org.kuali.rice.kew.api.document.DocumentDetail;

/**
 * Determine if a user can assign a protocol to a committee/schedule.
 */
public class ProtocolAssignReviewersCmtSelAuthorizer extends ProtocolAuthorizerBase {

    /**
     * @see org.kuali.kra.protocol.auth.ProtocolAuthorizerBase#isAuthorized(java.lang.String, org.kuali.kra.protocol.auth.ProtocolTaskBase)
     */
    public boolean isAuthorized(String username, ProtocolTaskBase task) {
        ProtocolBase protocol = task.getProtocol();
        return (isOnNode(protocol) || willBeOnNode(username, protocol)) && 
            hasPermission(username, protocol, PermissionConstants.PERFORM_IRB_ACTIONS_ON_PROTO);
    }

    public boolean isOnNode(ProtocolBase protocol) {
        return kraWorkflowService.isDocumentOnNode(protocol.getProtocolDocument(), Constants.PROTOCOL_IRBREVIEW_ROUTE_NODE_NAME);
    }

    // look to insure our next node won't be "DepartmentReview", which means the protocol will require
    // departmental approval before being assigned reviewers
    public boolean willBeOnNode(String username, ProtocolBase protocol) {
        boolean results = true;
        RoutingReportCriteria.Builder reportCriteriaBuilder = RoutingReportCriteria.Builder.createByDocumentId(protocol.getProtocolDocument().getDocumentNumber());
        reportCriteriaBuilder.setTargetPrincipalIds(Collections.singletonList(username));
        WorkflowDocumentActionsService info = GlobalResourceLoader.getService("rice.kew.workflowDocumentActionsService");
        
        try { 
            DocumentDetail results1 = info.executeSimulation(reportCriteriaBuilder.build());
            for(ActionRequest actionRequest : results1.getActionRequests() ){
                if (Constants.PROTOCOL_APPROVAL_NODE_NAME.equals(actionRequest.getNodeName())) {
                    results = false;
                }
            }
        } catch (Exception e) {}
        return results;
    }

}
