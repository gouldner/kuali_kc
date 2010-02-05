<%@ include file="/WEB-INF/jsp/kraTldHeader.jsp"%>
<c:set var="personAttributes" value="${DataDictionary.KcPerson.attributes}" />
<%@ attribute name="title" required="true" %>
<%@ attribute name="methodName" required="true" %>
<%@ attribute name="printPdfMethodName" required="true" %>
<%@ attribute name="requestUri" required="true" %>
<c:if test="${!KualiForm.reportHelperBean.instituteProposalAvailable}">
    <tr>
        <td colspan="4">
            <div align="center">
                Current and pending reports are not available - No Institutional Proposal Exists for Proposal Number ${KualiForm.reportHelperBean.proposalNumber}
            </div>
        </td>
    </tr>
</c:if>
<c:if test="${KualiForm.reportHelperBean.instituteProposalAvailable}">
    <tr>
        <td width="10%">&nbsp;</td>
        <th width="40%">${title}</th>
        <td width="40%">
            <div align="center">
                Person:
                <c:if test="${KualiForm.reportHelperBean.targetPerson != null}">
                    <kul:htmlControlAttribute property="reportHelperBean.targetPerson.fullName"
                                    attributeEntry="${personAttributes.fullName}" readOnly="true"/>
                </c:if>
                <c:if test="${KualiForm.reportHelperBean.targetPerson == null}">
                    <kul:htmlControlAttribute property="reportHelperBean.personId"
                                    attributeEntry="${personAttributes.personId}" readOnly="true"/>
                </c:if>
                <label>
                    <kul:lookup boClassName="org.kuali.kra.bo.KcPerson"
                                fieldConversions="personId:reportHelperBean.personId" anchor="${tabKey}"
                                lookupParameters="reportHelperBean.personId:personId"/>
                </label>
            </div>
        </td>
        <td width="10%">
            <div align="center">
                <c:if test="${KualiForm.reportHelperBean.instituteProposalAvailable}">
                    <c:if test="${KualiForm.reportHelperBean.personId == null}">
                        <html:image src="${ConfigProperties.kra.externalizable.images.url}tinybutton-initiatereport_disabled.gif" styleClass="globalbuttons"
                                    property="methodToCall.${methodName}" alt="${methodName}" disabled="true" />
                    </c:if>
                    <c:if test="${KualiForm.reportHelperBean.personId != null}">
                        <html:image src="${ConfigProperties.kra.externalizable.images.url}tinybutton-initiatereport.gif" styleClass="globalbuttons"
                                    property="methodToCall.${methodName}" alt="${methodName}" />
                        <html:image src="${ConfigProperties.kra.externalizable.images.url}tinybutton-print.gif" styleClass="globalbuttons"
                                    property="methodToCall.${printPdfMethodName}" alt="${printPdfMethodName}" />
                    </c:if>
                </c:if>
                <c:if test="${!KualiForm.reportHelperBean.instituteProposalAvailable}">
                    Report not available - No Institutional Proposal Exists for Proposal Number ${KualiForm.reportHelperBean.proposalNumber}
                </c:if>
            </div>
        </td>
    </tr>
</c:if>
