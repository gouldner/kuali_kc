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
package org.kuali.kra.irb.actions.withdraw;

import java.sql.Timestamp;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.kuali.kra.irb.Protocol;
import org.kuali.kra.irb.ProtocolDocument;
import org.kuali.kra.irb.ProtocolVersionService;
import org.kuali.kra.irb.actions.ProtocolAction;
import org.kuali.kra.irb.actions.ProtocolActionType;
import org.kuali.kra.irb.actions.ProtocolStatus;
import org.kuali.kra.irb.actions.assignagenda.ProtocolAssignToAgendaService;
import org.kuali.kra.irb.actions.correspondence.ProtocolActionCorrespondenceGenerationService;
import org.kuali.kra.irb.actions.notification.ProtocolActionsNotificationService;
import org.kuali.kra.irb.actions.notification.WithdrawEvent;
import org.kuali.kra.irb.actions.request.ProtocolRequestServiceImpl;
import org.kuali.kra.irb.actions.submit.ProtocolActionService;
import org.kuali.kra.irb.actions.submit.ProtocolSubmission;
import org.kuali.kra.irb.actions.submit.ProtocolSubmissionStatus;
import org.kuali.kra.irb.actions.submit.ProtocolSubmissionType;
import org.kuali.kra.irb.onlinereview.ProtocolOnlineReview;
import org.kuali.kra.printing.PrintingException;
import org.kuali.kra.service.KraAuthorizationService;
import org.kuali.rice.ken.service.NotificationService;
import org.kuali.rice.kew.exception.WorkflowException;
import org.kuali.rice.kew.service.WorkflowDocument;
import org.kuali.rice.kim.service.IdentityManagementService;
import org.kuali.rice.kns.service.BusinessObjectService;
import org.kuali.rice.kns.service.DocumentService;
import org.kuali.rice.kns.util.KNSConstants;

/**
 * The ProtocolWithdrawService implementation.
 */
public class ProtocolWithdrawServiceImpl implements ProtocolWithdrawService {

    private static final Logger LOG = Logger.getLogger(ProtocolWithdrawServiceImpl.class);
    private DocumentService documentService;
    private BusinessObjectService businessObjectService;
    private ProtocolActionService protocolActionService;
    private ProtocolVersionService protocolVersionService;
    private ProtocolAssignToAgendaService protocolAssignToAgendaService;
    private ProtocolActionCorrespondenceGenerationService protocolActionCorrespondenceGenerationService;
    private KraAuthorizationService kraAuthorizationService;
    private NotificationService notificationService;
    private ProtocolActionsNotificationService protocolActionsNotificationService;
    private IdentityManagementService identityManagementService;
    private List<String> notificationTemplates;
    
    /**
     * Set the document service.
     * @param documentService
     */
    public void setDocumentService(DocumentService documentService) {
        this.documentService = documentService;
    }
    
    /**
     * Set the business object service.
     * @param businessObjectService the business object service
     */
    public void setBusinessObjectService(BusinessObjectService businessObjectService) {
        this.businessObjectService = businessObjectService;
    }
    
    public void setProtocolAssignToAgendaService(ProtocolAssignToAgendaService protocolAssignToAgendaService) {
        this.protocolAssignToAgendaService = protocolAssignToAgendaService;
    }
    
    public void setProtocolActionCorrespondenceGenerationService(ProtocolActionCorrespondenceGenerationService protocolActionCorrespondenceGenerationService) {
        this.protocolActionCorrespondenceGenerationService = protocolActionCorrespondenceGenerationService;
    }
    
    /**
     * Set the Protocol Action Service.
     * @param protocolActionService
     */
    public void setProtocolActionService(ProtocolActionService protocolActionService) {
        this.protocolActionService = protocolActionService;
    }
    
    /**
     * Inject Protocol Version Service.
     * @param protocolVersionService
     */
    public void setProtocolVersionService(ProtocolVersionService protocolVersionService) {
        this.protocolVersionService = protocolVersionService;
    }

    /**
     * @see org.kuali.kra.irb.actions.withdraw.ProtocolWithdrawService#withdraw(org.kuali.kra.irb.Protocol, org.kuali.kra.irb.actions.withdraw.ProtocolWithdrawBean)
     */
    public ProtocolDocument withdraw(Protocol protocol, ProtocolWithdrawBean withdrawBean) throws Exception {
        ProtocolAction protocolAction = new ProtocolAction(protocol, null, ProtocolActionType.WITHDRAWN);
        protocolAction.setComments(withdrawBean.getReason());
        protocol.getProtocolActions().add(protocolAction);

        protocolActionService.updateProtocolStatus(protocolAction, protocol);
        
        ProtocolSubmission submission = getSubmission(protocol);
        if (submission != null) {
            submission.setSubmissionDate(new Timestamp(System.currentTimeMillis()));
            submission.setSubmissionStatusCode(ProtocolSubmissionStatus.WITHDRAWN);
        }
        businessObjectService.save(protocol.getProtocolDocument());
        
        /*
         * Cancelling the workflow document is how we withdraw it.
         */
        cancelWorkflow(protocol);
               
        //need to cancel any outstanding review documents
        for (ProtocolOnlineReview review : protocol.getProtocolOnlineReviews()) {
            cancelWorkflow(review);
        }
        
        //sendWithdrawNotification(protocol);
        LOG.info("withdraw notification exception start" );
        try {
            protocolActionsNotificationService.sendActionsNotification(protocol, new WithdrawEvent(protocol));
        } catch (Exception e) {
            LOG.info("withdraw notification exception " + e.getStackTrace());
        }

        /*
         * Create a new protocol document for the user to edit so they can re-submit at 
         * a later time.
         */
        ProtocolDocument newProtocolDocument = protocolVersionService.versionProtocolDocument(protocol.getProtocolDocument());
        newProtocolDocument.getProtocol().setProtocolStatusCode(ProtocolStatus.WITHDRAWN);
        // to force it to retrieve from list.
        newProtocolDocument.getProtocol().setProtocolSubmission(null);
        //update some info
        newProtocolDocument.getProtocol().setApprovalDate(null);
        newProtocolDocument.getProtocol().setExpirationDate(null);

        // COEUS does not set these values to null for 'withdraw action
//        newProtocolDocument.getProtocol().getProtocolSubmission().setScheduleId(null);
//        newProtocolDocument.getProtocol().getProtocolSubmission().setCommitteeSchedule(null);
//        newProtocolDocument.getProtocol().getProtocolSubmission().setScheduleIdFk(null);
//        newProtocolDocument.getProtocol().getProtocolSubmission().setCommittee(null);
//        newProtocolDocument.getProtocol().getProtocolSubmission().setCommitteeId(null);
//        newProtocolDocument.getProtocol().getProtocolSubmission().setCommitteeIdFk(null);
        
        newProtocolDocument.getProtocol().refreshReferenceObject("protocolStatus");
        documentService.saveDocument(newProtocolDocument);

        //if there is an assign to agenda protocol action, remove it.
        ProtocolAction assignToAgendaProtoclAction = this.protocolAssignToAgendaService.getAssignedToAgendaProtocolAction(newProtocolDocument.getProtocol());
        if (assignToAgendaProtoclAction != null) {
            boolean didItWork = newProtocolDocument.getProtocol().getProtocolActions().remove(assignToAgendaProtoclAction);
            businessObjectService.delete(assignToAgendaProtoclAction);
        }        
        newProtocolDocument.getProtocol().refreshReferenceObject("protocolStatus");
        documentService.saveDocument(newProtocolDocument);
        generateCorrespondenceDocumentAndAttach(newProtocolDocument.getProtocol(), withdrawBean);
        return newProtocolDocument;
    }
    
    /**
     * 
     * This method will generate a correspondence document, and attach it to the protocol.
     * @param protocol a Protocol object.
     */
    private void generateCorrespondenceDocumentAndAttach(Protocol protocol, ProtocolWithdrawBean withdrawBean) throws PrintingException {
        WithdrawCorrespondence correspondence = withdrawBean.getCorrespondence();
        correspondence.setProtocolDocument(protocol.getProtocolDocument());
        protocolActionCorrespondenceGenerationService.generateCorrespondenceDocumentAndAttach(correspondence);
    } 

    /**
     * By canceling the protocol in workflow, we are preventing it from being
     * reviewed by the IRB office.  A user will then be able to continue editing
     * the protocol in order to submit it again at a later time.
     * @param protocol
     * @throws WorkflowException
     */
    private void cancelWorkflow(Protocol protocol) throws WorkflowException {
        documentService.cancelDocument(protocol.getProtocolDocument(), null);
    }
  
    private void cancelWorkflow(ProtocolOnlineReview review) {
        final String principalId = identityManagementService.getPrincipalByPrincipalName(KNSConstants.SYSTEM_USER).getPrincipalId();
        try {
            WorkflowDocument workflowDocument = new WorkflowDocument(principalId, review.getProtocolOnlineReviewDocument().getDocumentHeader().getWorkflowDocument().getRouteHeaderId());
            workflowDocument.superUserCancel("Review cancelled - protocol has been withdrawn.");
        }
        catch (WorkflowException e) {
           LOG.error(String.format("WorkflowException generated when cancel called on protocolOnlineReview document number:%s", review.getProtocolOnlineReviewDocument().getDocumentNumber(), e));
           throw new RuntimeException(String.format("WorkflowException generated when cancel called on protocolOnlineReview document number:%s", review.getProtocolOnlineReviewDocument().getDocumentNumber(), e));
        }
    }
    

    /**
     * Get the submission that is being withdrawn.  Since a protocol can have
     * multiple submissions, go backwards until we find a submission that can
     * be withdrawn
     * @param protocol
     * @return
     */
    private ProtocolSubmission getSubmission(Protocol protocol) {
        for (ProtocolSubmission submission : protocol.getProtocolSubmissions()) {
            if (isWithdrawable(submission)) {
                return submission;
            }
        }
        return null;
    }

    /**
     * A submission is only withdrawable if it corresponds to a request to review
     * the submission.  The submissions that meet this criteria are the initial 
     * request for review, amendments, and renewals that are still in the pending
     * or submitted to committee states.   Submissions such as Notify IRB
     * cannot be withdrawn.
     * @param submission
     * @return
     */
    private boolean isWithdrawable(ProtocolSubmission submission) {
        return isAllowedStatus(submission) && isNormalSubmission(submission);
    }
    
    /**
     * Does the submission status allow us to withdraw the protocol?
     * @param submission
     * @return true if withdrawable; otherwise false
     */
    private boolean isAllowedStatus(ProtocolSubmission submission) {
        return StringUtils.equals(submission.getSubmissionStatusCode(), ProtocolSubmissionStatus.PENDING) ||
               StringUtils.equals(submission.getSubmissionStatusCode(), ProtocolSubmissionStatus.SUBMITTED_TO_COMMITTEE);
    }
    
    /**
     * Does the submission type allow us to withdraw the protocol?
     * @param submission
     * @return true if withdrawable; otherwise false
     */
    private boolean isNormalSubmission(ProtocolSubmission submission) {
        return StringUtils.equals(submission.getSubmissionTypeCode(), ProtocolSubmissionType.AMENDMENT) ||
               StringUtils.equals(submission.getSubmissionTypeCode(), ProtocolSubmissionType.INITIAL_SUBMISSION) ||
               StringUtils.equals(submission.getSubmissionTypeCode(), ProtocolSubmissionType.CONTINUATION) ||
               StringUtils.equals(submission.getSubmissionTypeCode(), ProtocolSubmissionType.CONTINUATION_WITH_AMENDMENT);
    }

    public void setNotificationService(NotificationService notificationService) {
        this.notificationService = notificationService;
    }

    public void setNotificationTemplates(List<String> notificationTemplates) {
        this.notificationTemplates = notificationTemplates;
    }

    public void setKraAuthorizationService(KraAuthorizationService kraAuthorizationService) {
        this.kraAuthorizationService = kraAuthorizationService;
    }

    public void setProtocolActionsNotificationService(ProtocolActionsNotificationService protocolActionsNotificationService) {
        this.protocolActionsNotificationService = protocolActionsNotificationService;
    }

    public void setIdentityManagementService(IdentityManagementService identityManagementService) {
        this.identityManagementService = identityManagementService;
    }
}
