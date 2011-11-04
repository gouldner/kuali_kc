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
package org.kuali.kra.coi.disclosure;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.kuali.kra.award.home.Award;
import org.kuali.kra.coi.CoiDisclProject;
import org.kuali.kra.coi.CoiDisclosure;
import org.kuali.kra.coi.CoiDisclosureDocument;
import org.kuali.kra.coi.CoiDisclosureForm;
import org.kuali.kra.coi.personfinancialentity.FinEntityDataMatrixBean;
import org.kuali.kra.coi.personfinancialentity.FinancialEntityService;
import org.kuali.kra.infrastructure.KraServiceLocator;
import org.kuali.kra.irb.Protocol;
import org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal;
import org.kuali.rice.kns.service.ParameterService;

public class DisclosureHelper implements Serializable {

    /**
     * Comment for <code>serialVersionUID</code>
     */
    private static final long serialVersionUID = -7441300028105575094L;
    protected static final String NAMESPACE_CODE = "KC-COIDISCLOSURE";
    protected static final String PARAMETER_CODE = "Document";
    private static final String CONFLICT_HEADER_LABEL_PARAMETER = "COI_DISCLOSURE_FE_CONFLICT_HEADER_LABEL";
    protected static final String DEFAULT_CONFLICT_HEADER_LABEL = "Conflict";
    private CoiDisclosureForm form;
    private DisclosurePersonUnit newDisclosurePersonUnit;
    private List<DisclosurePersonUnit> deletedUnits;
    private List<FinEntityDataMatrixBean> editRelationDetails;
    private List<FinEntityDataMatrixBean> newRelationDetails;
    private boolean canViewDisclosureFeHistory;
    private boolean canEditDisclosureFinancialEntity;
    private String conflictHeaderLabel;
    private CoiDisclProject newCoiDisclProject;
    private String protocolType;
    // new protocols for disclosure
    private List<Protocol> newProtocols;
    private Long newProtocolId;
    private String newProposalNumber;
    private Long newAwardId;
    private List<DevelopmentProposal> newProposals;
    private List<Award> newAwards;
    private String newProjectId;
    private String moduleCode;

    public DisclosureHelper(CoiDisclosureForm form) {
        this.form = form;
        setNewDisclosurePersonUnit(new DisclosurePersonUnit());
        deletedUnits = new ArrayList<DisclosurePersonUnit>(); 
        newRelationDetails = getFinancialEntityService().getFinancialEntityDataMatrix();
        editRelationDetails = new ArrayList<FinEntityDataMatrixBean>(); 
        canViewDisclosureFeHistory = hasCanViewDisclosureFeHistoryPermission();
        canEditDisclosureFinancialEntity = hasCanEditDisclosureFinancialEntityPermission();
        CoiDisclosure coiDisclosure = form.getCoiDisclosureDocument().getCoiDisclosure();
      //  coiDisclosure.initCoiDisclosureNumber();
        newCoiDisclProject = new CoiDisclProject(coiDisclosure.getCoiDisclosureNumber(), coiDisclosure.getSequenceNumber());
        newProtocols = new ArrayList<Protocol>(); 
        initConflictHeaderLabel();
   }

    public CoiDisclosureForm getForm() {
        return form;
    }

    public void setForm(CoiDisclosureForm form) {
        this.form = form;
    }

    public DisclosurePersonUnit getNewDisclosurePersonUnit() {
        return newDisclosurePersonUnit;
    }

    public void setNewDisclosurePersonUnit(DisclosurePersonUnit newDisclosurePersonUnit) {
        this.newDisclosurePersonUnit = newDisclosurePersonUnit;
        DisclosurePerson disclosurePerson = null;
        if (CollectionUtils.isEmpty(((CoiDisclosureDocument)this.form.getDocument()).getCoiDisclosure().getDisclosurePersons())) {
            disclosurePerson = ((CoiDisclosureDocument)this.form.getDocument()).getCoiDisclosure().getDisclosureReporter();
        } else {
            disclosurePerson = ((CoiDisclosureDocument)this.form.getDocument()).getCoiDisclosure().getDisclosurePersons().get(0);
        }
        this.newDisclosurePersonUnit.setDisclosurePersonId(disclosurePerson.getDisclosurePersonId());
        this.newDisclosurePersonUnit.setDisclosurePerson(disclosurePerson);
        this.newDisclosurePersonUnit.setPersonId(disclosurePerson.getPersonId());
    }

    public List<DisclosurePersonUnit> getDeletedUnits() {
        return deletedUnits;
    }

    public void setDeletedUnits(List<DisclosurePersonUnit> deletedUnits) {
        this.deletedUnits = deletedUnits;
    }

    public List<FinEntityDataMatrixBean> getEditRelationDetails() {
        return editRelationDetails;
    }

    public void setEditRelationDetails(List<FinEntityDataMatrixBean> editRelationDetails) {
        this.editRelationDetails = editRelationDetails;
    }

    public List<FinEntityDataMatrixBean> getNewRelationDetails() {
        return newRelationDetails;
    }

    public void setNewRelationDetails(List<FinEntityDataMatrixBean> newRelationDetails) {
        this.newRelationDetails = newRelationDetails;
    }

    private FinancialEntityService getFinancialEntityService() {
        return KraServiceLocator.getService(FinancialEntityService.class);
    }

    public boolean isCanViewDisclosureFeHistory() {
        return canViewDisclosureFeHistory;
    }

    public void setCanViewDisclosureFeHistory(boolean canViewDisclosureFeHistory) {
        this.canViewDisclosureFeHistory = canViewDisclosureFeHistory;
    }

    private boolean hasCanViewDisclosureFeHistoryPermission() {
        // TODO : to br implemented after coi task authorizer are set
        // for now, just return true
        return true;
    }

    public boolean isCanEditDisclosureFinancialEntity() {
        return canEditDisclosureFinancialEntity;
    }

    public void setCanEditDisclosureFinancialEntity(boolean canEditDisclosureFinancialEntity) {
        this.canEditDisclosureFinancialEntity = canEditDisclosureFinancialEntity;
    }
    private boolean hasCanEditDisclosureFinancialEntityPermission() {
        // TODO : to br implemented after coi task authorizer are set
        // for now, just return true
        return true;
    }

    public String getConflictHeaderLabel() {
        if (StringUtils.isBlank(conflictHeaderLabel)) {
            initConflictHeaderLabel();
        }
        return conflictHeaderLabel;
    }

    public void setConflictHeaderLabel(String conflictHeaderLabel) {
        this.conflictHeaderLabel = conflictHeaderLabel;
    }
    
    private void initConflictHeaderLabel() {
        String param = DEFAULT_CONFLICT_HEADER_LABEL;
        try {
            param = getParameterService().getParameterValue(NAMESPACE_CODE, PARAMETER_CODE, CONFLICT_HEADER_LABEL_PARAMETER);
        } catch (Exception e) {
            // param not set - use default    
        }
        setConflictHeaderLabel(param);
        
    }
    
    private ParameterService getParameterService() {
         return KraServiceLocator.getService(ParameterService.class);
    }

    public CoiDisclProject getNewCoiDisclProject() {
        return newCoiDisclProject;
    }

    public void setNewCoiDisclProject(CoiDisclProject newCoiDisclProject) {
        this.newCoiDisclProject = newCoiDisclProject;
    }

    public String getProtocolType() {
        return protocolType;
    }

    public void setProtocolType(String protocolType) {
        this.protocolType = protocolType;
    }

    public List<Protocol> getNewProtocols() {
        return newProtocols;
    }

    public void setNewProtocols(List<Protocol> newProtocols) {
        this.newProtocols = newProtocols;
    }

    public Long getNewProtocolId() {
        return newProtocolId;
    }

    public void setNewProtocolId(Long newProtocolId) {
        this.newProtocolId = newProtocolId;
    }

    public String getNewProposalNumber() {
        return newProposalNumber;
    }

    public void setNewProposalNumber(String newProposalNumber) {
        this.newProposalNumber = newProposalNumber;
    }

    public Long getNewAwardId() {
        return newAwardId;
    }

    public void setNewAwardId(Long newAwardId) {
        this.newAwardId = newAwardId;
    }

    public List<DevelopmentProposal> getNewProposals() {
        return newProposals;
    }

    public void setNewProposals(List<DevelopmentProposal> newProposals) {
        this.newProposals = newProposals;
    }

    public List<Award> getNewAwards() {
        return newAwards;
    }

    public void setNewAwards(List<Award> newAwards) {
        this.newAwards = newAwards;
    }

    public String getNewProjectId() {
        return newProjectId;
    }

    public void setNewProjectId(String newProjectId) {
        this.newProjectId = newProjectId;
    }

    public String getModuleCode() {
        return moduleCode;
    }

    public void setModuleCode(String moduleCode) {
        this.moduleCode = moduleCode;
    }

}
