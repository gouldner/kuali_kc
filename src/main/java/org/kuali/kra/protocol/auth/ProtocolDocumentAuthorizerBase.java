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

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.kuali.kra.authorization.ApplicationTask;
import org.kuali.kra.authorization.KcTransactionalDocumentAuthorizerBase;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.infrastructure.KraServiceLocator;
import org.kuali.kra.infrastructure.TaskName;
import org.kuali.kra.protocol.ProtocolBase;
import org.kuali.kra.protocol.ProtocolDocumentBase;
import org.kuali.kra.irb.actions.ProtocolStatus;
import org.kuali.kra.protocol.personnel.ProtocolPersonBase;
import org.kuali.kra.service.TaskAuthorizationService;
import org.kuali.rice.kim.api.identity.Person;
import org.kuali.rice.kns.authorization.AuthorizationConstants;
import org.kuali.rice.krad.document.Document;

/**
 * This class is the Proposal Document Authorizer.  It determines the edit modes and
 * document actions for all proposal development documents.
 */
public abstract class ProtocolDocumentAuthorizerBase extends KcTransactionalDocumentAuthorizerBase {
    
    /**
     * Comment for <code>serialVersionUID</code>
     */
    private static final long serialVersionUID = -7155315639701623791L;
    

    /**
     * @see org.kuali.rice.kns.document.authorization.TransactionalDocumentAuthorizer#getEditModes(org.kuali.rice.krad.document.Document, org.kuali.rice.kim.api.identity.Person, java.util.Set)
     */
    public Set<String> getEditModes(Document document, Person user, Set<String> currentEditModes) {
        Set<String> editModes = new HashSet<String>();
        
        ProtocolDocumentBase protocolDocument = (ProtocolDocumentBase) document;
        String userId = user.getPrincipalId();
        
        if (protocolDocument.getProtocol().getProtocolId() == null) {
            if (canCreateProtocol(user)) {
                editModes.add(AuthorizationConstants.EditMode.FULL_ENTRY);
            } 
            else {
                editModes.add(AuthorizationConstants.EditMode.UNVIEWABLE);
            }
        } 
        else {
            if (canExecuteProtocolTask(userId, protocolDocument, TaskName.MODIFY_PROTOCOL)) {  
                editModes.add(AuthorizationConstants.EditMode.FULL_ENTRY);
            }
            else if (canExecuteProtocolTask(userId, protocolDocument, TaskName.VIEW_PROTOCOL)) {
                editModes.add(AuthorizationConstants.EditMode.VIEW_ONLY);
            }
            else {
                editModes.add(AuthorizationConstants.EditMode.UNVIEWABLE);
            }
            
            if( canExecuteProtocolTask(userId,protocolDocument,TaskName.MAINTAIN_PROTOCOL_ONLINEREVIEWS)) {
                editModes.add(TaskName.MAINTAIN_PROTOCOL_ONLINEREVIEWS);
            }
            if (canViewReviewComments(protocolDocument, user)) {
                editModes.add(Constants.CAN_VIEW_REVIEW_COMMENTS);
            }
        }
        
        return editModes;
    }
    
    /**
     * This method determines if a person can view the review comments.
     * @param document
     * @param user
     * @return boolean
     */
    public boolean canViewReviewComments(Document document, Person user) {
        ProtocolDocumentBase protocolDoc = (ProtocolDocumentBase)document;
        List<ProtocolPersonBase> participants = protocolDoc.getProtocol().getProtocolPersons();
        for (ProtocolPersonBase participant : participants) {
            if (StringUtils.equalsIgnoreCase(participant.getPersonId() + "", user.getPrincipalId())) {
                String statusCode = protocolDoc.getProtocol().getProtocolStatusCode();
                if (statusCode.equalsIgnoreCase(ProtocolStatus.SUBMITTED_TO_IRB)) {
                    return false;
                }
            }
        }
        return true;
    }
    /**
     * @see org.kuali.rice.kns.document.authorization.DocumentAuthorizer#canInitiate(java.lang.String, org.kuali.rice.kim.api.identity.Person)
     */
    public boolean canInitiate(String documentTypeName, Person user) {
        return canCreateProtocol(user);
    }

    /**
     * @see org.kuali.rice.kns.document.authorization.DocumentAuthorizer#canOpen(org.kuali.rice.krad.document.Document, org.kuali.rice.kim.api.identity.Person)
     */
    public boolean canOpen(Document document, Person user) {
        ProtocolDocumentBase protocolDocument = (ProtocolDocumentBase) document;
        if (protocolDocument.getProtocol().getProtocolId() == null) {
            return canCreateProtocol(user);
        }
        return canExecuteProtocolTask(user.getPrincipalId(), (ProtocolDocumentBase) document, TaskName.VIEW_PROTOCOL);
    }
    
    /**
     * Does the user have permission to create a protocol?
     * @param user the user
     * @return true if the user can create a protocol; otherwise false
     */
    private boolean canCreateProtocol(Person user) {
        ApplicationTask task = new ApplicationTask(TaskName.CREATE_PROTOCOL);       
        TaskAuthorizationService taskAuthenticationService = KraServiceLocator.getService(TaskAuthorizationService.class);
        return taskAuthenticationService.isAuthorized(user.getPrincipalId(), task);
    }
    
    /**
     * Does the user have permission to execute the given task for a protocol?
     * @param username the user's username
     * @param doc the protocol document
     * @param taskName the name of the task
     * @return true if has permission; otherwise false
     */
    private boolean canExecuteProtocolTask(String userId, ProtocolDocumentBase doc, String taskName) {
        ProtocolTaskBase task = createNewProtocolTaskInstanceHook(taskName, doc.getProtocol());       
        TaskAuthorizationService taskAuthenticationService = KraServiceLocator.getService(TaskAuthorizationService.class);
        return taskAuthenticationService.isAuthorized(userId, task);
    }
    
    protected abstract ProtocolTaskBase createNewProtocolTaskInstanceHook(String taskName, ProtocolBase protocol);
    
    /**
     * @see org.kuali.kra.authorization.KcTransactionalDocumentAuthorizerBase#canEdit(org.kuali.rice.krad.document.Document, org.kuali.rice.kim.api.identity.Person)
     */
    @Override
    public boolean canEdit(Document document, Person user) {
        return canExecuteProtocolTask(user.getPrincipalId(), (ProtocolDocumentBase) document, TaskName.MODIFY_PROTOCOL);
    }
    
    /**
     * @see org.kuali.kra.authorization.KcTransactionalDocumentAuthorizerBase#canSave(org.kuali.rice.krad.document.Document, org.kuali.rice.kim.api.identity.Person)
     */
    @Override
    public boolean canSave(Document document, Person user) {
        return canEdit(document, user);
    }
    
    /**
     * @see org.kuali.kra.authorization.KcTransactionalDocumentAuthorizerBase#canCopy(org.kuali.rice.krad.document.Document, org.kuali.rice.kim.api.identity.Person)
     */
    @Override
    public boolean canCopy(Document document, Person user) {
        return false;
    }
    
    /**
     * @see org.kuali.kra.authorization.KcTransactionalDocumentAuthorizerBase#canCancel(org.kuali.rice.krad.document.Document, org.kuali.rice.kim.api.identity.Person)
     */
    @Override
    public boolean canCancel(Document document, Person user) {
        return false;
    }
    
    /**
     * @see org.kuali.kra.authorization.KcTransactionalDocumentAuthorizerBase#canRoute(org.kuali.rice.krad.document.Document, org.kuali.rice.kim.api.identity.Person)
     */
    @Override
    public boolean canRoute(Document document, Person user) {
        return false;
    }
    
    /**
     * Can the user blanket approve the given document?
     * @param document the document
     * @param user the user
     * @return always false for ProtocolDocumentBase
     */
    @Override
    public boolean canBlanketApprove(Document document, Person user) {
        return false;
    }

    @Override
    public boolean canSendNoteFyi(Document document, Person user) {
        return false;
    }

    @Override
    public boolean canFyi(Document document, Person user) {
        return false;
    }
    
}
