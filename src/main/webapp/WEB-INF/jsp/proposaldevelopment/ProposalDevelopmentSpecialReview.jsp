<%--
 Copyright 2006-2009 The Kuali Foundation

 Licensed under the Educational Community License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.osedu.org/licenses/ECL-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
--%>
<%@ include file="/WEB-INF/jsp/kraTldHeader.jsp"%>

<c:set var="readOnly" value="${not KualiForm.editingMode['modifyProposal']}" scope="request" /> 

<kul:documentPage
	showDocumentInfo="true"
	htmlFormAction="proposalDevelopmentSpecialReview"
	documentTypeName="ProposalDevelopmentDocument"
	renderMultipart="false"
	showTabButtons="false"
	auditCount="0"
  	headerDispatch="${KualiForm.headerDispatch}"
  	headerTabActive="specialReview">
  	
  	<div align="right"><kul:help documentTypeName="ProposalDevelopmentDocument" pageName="Special Review" /></div>

<kra-pd:proposalDevelopmentSpecialReview /> 
<kul:documentControls transactionalDocument="true" suppressRoutingControls="true" suppressCancelButton="true" />
<script language="javascript" src="scripts/kuali_application.js"></script>

</kul:documentPage>
