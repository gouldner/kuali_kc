/*
 * Copyright 2005-2010 The Kuali Foundation.
 * 
 * Licensed under the Educational Community License, Version 1.0 (the "License");
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
package org.kuali.kra.s2s.generator.impl;

import gov.grants.apply.forms.performanceSite12V12.PerformanceSite12Document;
import gov.grants.apply.forms.performanceSite12V12.SiteLocationDataType;
import gov.grants.apply.forms.performanceSite12V12.PerformanceSite12Document.PerformanceSite12;
import gov.grants.apply.system.globalLibraryV20.YesNoDataType;

import java.util.ArrayList;
import java.util.List;

import org.apache.xmlbeans.XmlObject;
import org.kuali.kra.bo.Organization;
import org.kuali.kra.bo.OrganizationYnq;
import org.kuali.kra.bo.Rolodex;
import org.kuali.kra.proposaldevelopment.bo.CongressionalDistrict;
import org.kuali.kra.proposaldevelopment.bo.ProposalSite;
import org.kuali.kra.proposaldevelopment.document.ProposalDevelopmentDocument;
import org.kuali.kra.s2s.generator.S2SBaseFormGenerator;
import org.kuali.kra.s2s.util.S2SConstants;

/**
 * 
 * This class is used to generate XML Document object for grants.gov
 * PerformanceSiteV1.2. This form is generated using XMLBean API's generated by
 * compiling PerformanceSiteV1.2 schema.
 * 
 * @author Kuali Research Administration Team (kualidev@oncourse.iu.edu)
 */
public class PerformanceSiteV1_2Generator extends S2SBaseFormGenerator {

	private static final String QUESTION_ID_FOR_INDIVIDUAL_YNQ = "30";
	private static final int LOCATION_TYPE_CODE = 2;

	private XmlObject getPerformanceSite() {
		PerformanceSite12Document performanceSite12Document = PerformanceSite12Document.Factory
				.newInstance();
		PerformanceSite12 performanceSite12 = PerformanceSite12.Factory
				.newInstance();
		performanceSite12.setFormVersion(S2SConstants.FORMVERSION_1_2);
		performanceSite12.setPrimarySite(getPrimarySite());
		performanceSite12.setOtherSiteArray(getSiteLocationDataTypeArray());
		performanceSite12Document.setPerformanceSite12(performanceSite12);
		return performanceSite12Document;
	}

	private SiteLocationDataType getPrimarySite() {
		SiteLocationDataType siteLocationDataType = SiteLocationDataType.Factory
				.newInstance();
		if (pdDoc.getDevelopmentProposal().getPerformingOrganization() != null) {
			Organization organization = pdDoc.getDevelopmentProposal()
					.getPerformingOrganization().getOrganization();
			if (organization != null) {
				if (organization.getOrganizationName() != null) {
					siteLocationDataType.setOrganizationName(organization
							.getOrganizationName());
				}
				for (ProposalSite proposalSite : pdDoc.getDevelopmentProposal()
						.getProposalSites()) {
					String congressionalDistrict = getCongressionalDistrict(proposalSite);
					if (congressionalDistrict != null) {
						siteLocationDataType
								.setCongressionalDistrictProgramProject(congressionalDistrict);
						break;
					}
				}

				if (organization.getDunsNumber() != null) {
					siteLocationDataType.setDUNSNumber(organization
							.getDunsNumber());
				}
				setSiteLocationDataType(siteLocationDataType, organization);
			}

			siteLocationDataType.setAddress(globLibV20Generator
					.getAddressDataType(pdDoc.getDevelopmentProposal()
							.getPerformingOrganization().getOrganization()
							.getRolodex()));
		}
		return siteLocationDataType;
	}

	private void setSiteLocationDataType(
			SiteLocationDataType siteLocationDataType, Organization organization) {
		if (organization.getOrganizationYnqs() != null
				&& !organization.getOrganizationYnqs().isEmpty()) {
			for (OrganizationYnq organizationYnq : organization
					.getOrganizationYnqs()) {
				if (organizationYnq.getQuestionId().equals(
						QUESTION_ID_FOR_INDIVIDUAL_YNQ)) {
					YesNoDataType.Enum answer = organizationYnq.getAnswer()
							.equals("Y") ? YesNoDataType.Y_YES
							: YesNoDataType.N_NO;
					siteLocationDataType.setIndividual(answer);
				}
			}
		}
	}

	private SiteLocationDataType[] getSiteLocationDataTypeArray() {
		List<SiteLocationDataType> siteLocationDataTypeList = new ArrayList<SiteLocationDataType>();
		List<ProposalSite> proposalSites = pdDoc.getDevelopmentProposal().getProposalSites();
		if (proposalSites != null) {
			Organization organization = null;
			
			for (ProposalSite proposalSite : proposalSites) {
				organization = proposalSite.getOrganization();
				if (organization != null) {
					SiteLocationDataType siteLocationOther = SiteLocationDataType.Factory
							.newInstance();
					Rolodex rolodex = proposalSite.getRolodex();
					if (organization.getOrganizationName() != null) {
						siteLocationOther.setOrganizationName(organization
								.getOrganizationName());
					}
					siteLocationOther.setAddress(globLibV20Generator
							.getAddressDataType(rolodex));

					if (organization.getDunsNumber() != null) {
						siteLocationOther.setDUNSNumber(organization
								.getDunsNumber());
					}

					String congressionalDistrict = getCongressionalDistrict(proposalSite);
					if (congressionalDistrict != null) {
						siteLocationOther
								.setCongressionalDistrictProgramProject(congressionalDistrict);
					}

					setSiteLocationDataType(siteLocationOther, organization);
					siteLocationDataTypeList.add(siteLocationOther);
				}
			}
		}
		return siteLocationDataTypeList.toArray(new SiteLocationDataType[0]);
	}

	private String getCongressionalDistrict(ProposalSite proposalSite) {
		String congDistrictProject = null;
		if (proposalSite.getLocationTypeCode()==LOCATION_TYPE_CODE) {
			for (CongressionalDistrict congDistrict : proposalSite
					.getCongressionalDistricts()) {
				if (congDistrict.getSiteNumber().equals(
						proposalSite.getSiteNumber())) {
					congDistrictProject = congDistrict
							.getCongressionalDistrict();
					if (congDistrictProject != null
							&& congDistrictProject.length() > CONGRESSIONAL_DISTRICT_MAX_LENGTH) {
						congDistrictProject = congDistrictProject.substring(0,
								CONGRESSIONAL_DISTRICT_MAX_LENGTH);
					}
				}
			}
		}
		return congDistrictProject;
	}

	/**
	 * This method creates {@link XmlObject} of type
	 * {@link PerformanceSite12Document} by populating data from the given
	 * {@link ProposalDevelopmentDocument}
	 * 
	 * @param proposalDevelopmentDocument
	 *            for which the {@link XmlObject} needs to be created
	 * @return {@link XmlObject} which is generated using the given
	 *         {@link ProposalDevelopmentDocument}
	 * @see org.kuali.kra.s2s.generator.S2SFormGenerator#getFormObject(ProposalDevelopmentDocument)
	 */
	public XmlObject getFormObject(
			ProposalDevelopmentDocument proposalDevelopmentDocument) {
		this.pdDoc = proposalDevelopmentDocument;
		return getPerformanceSite();
	}

	/**
	 * This method typecasts the given {@link XmlObject} to the required
	 * generator type and returns back the document of that generator type.
	 * 
	 * @param xmlObject
	 *            which needs to be converted to the document type of the
	 *            required generator
	 * @return {@link XmlObject} document of the required generator type
	 * @see org.kuali.kra.s2s.generator.S2SFormGenerator#getFormObject(XmlObject)
	 */
	public XmlObject getFormObject(XmlObject xmlObject) {
		PerformanceSite12Document performanceSite12Document = PerformanceSite12Document.Factory
				.newInstance();
		PerformanceSite12 performanceSite12 = (PerformanceSite12) xmlObject;
		performanceSite12Document.setPerformanceSite12(performanceSite12);
		return performanceSite12Document;
	}
}
