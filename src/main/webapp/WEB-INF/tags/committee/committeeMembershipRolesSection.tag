<%@ include file="/WEB-INF/jsp/committee/committeeMember.jsp"%>

<c:set var="membershipRoleAttributes" value="${DataDictionary.CommitteeMembershipRole.attributes}" />
<%-- TODO: set readOnly to something like "${!KualiForm.protocolHelper.modifyProtocol}" --%>
<c:set var="readOnly" value="false" />

<table cellpadding=0 cellspacing=0 summary="">
    <tr>
        <td>
            <kul:innerTab tabTitle="Roles" 
                          parentTab="${parentTabValue}" 
                          defaultOpen="false" 
                          tabErrorKey="membershipRolesHelper.newCommitteeMembershipRoles[${memberIndex}].*,document.committeeList[0].committeeMemberships[${memberIndex}].membershipRoles*">
                <div class="innerTab-container" align="left">
                    <table id="membership-role-table" cellpadding=0 cellspacing=0 class="datatable" summary="View/edit committee membership roles">
                    
                        <%-- Header --%>
                        <tr>
                            <kul:htmlAttributeHeaderCell literalLabel="&nbsp;" scope="col" align="center" />
                            <kul:htmlAttributeHeaderCell attributeEntry="${membershipRoleAttributes.membershipRoleCode}" scope="col" align="center" />
                            <kul:htmlAttributeHeaderCell attributeEntry="${membershipRoleAttributes.startDate}" scope="col" align="center" />
                            <kul:htmlAttributeHeaderCell attributeEntry="${membershipRoleAttributes.endDate}" scope="col" align="center" />
                            <c:if test="${!readOnly}">
                                <kul:htmlAttributeHeaderCell literalLabel="Actions" scope="col" align="center" />
                            </c:if>
                        </tr>
                        <%-- Header --%>
                        
                        <%-- New data --%>
                        <c:if test="${!readOnly}">
                            <tr>
                                <th class="infoline">
                                    <c:out value="Add:" />
                                </th>
                                
                                <td align="left" valign="middle" class="infoline">
                                    <div align="left">
                                        <kul:htmlControlAttribute property="membershipRolesHelper.newCommitteeMembershipRoles[${memberIndex}].membershipRoleCode" 
                                                                  attributeEntry="${membershipRoleAttributes.membershipRoleCode}" />
                                    </div>
                                </td>
                                
                                <td align="left" valign="middle" class="infoline">
                                    <div align="center">
                                        <kul:htmlControlAttribute property="membershipRolesHelper.newCommitteeMembershipRoles[${memberIndex}].startDate" 
                                                                  attributeEntry="${membershipRoleAttributes.startDate}" 
                                                                  datePicker="true" />
                                    </div>
                                </td>
                                
                                <td align="left" valign="middle" class="infoline">
                                    <div align="center">
                                        <kul:htmlControlAttribute property="membershipRolesHelper.newCommitteeMembershipRoles[${memberIndex}].endDate" 
                                                                  attributeEntry="${membershipRoleAttributes.endDate}" 
                                                                  datePicker="true" />
                                    </div>
                                </td>

                               <td align="left" valign="middle" class="infoline">
                                   <div align=center>
                                       <html:image property="methodToCall.addCommitteeMembershipRole.${committeeMembership}"
                                                   src='${ConfigProperties.kra.externalizable.images.url}tinybutton-add1.gif' 
                                                   styleClass="tinybutton"/>
                                    </div>
                                </td>
                            </tr>
                        </c:if>
                        <%-- New data --%>

                        <%-- Existing data --%>
                        <c:forEach var="membershipRole" items="${KualiForm.document.committeeList[0].committeeMemberships[memberIndex].membershipRoles}" varStatus="status">
                            <tr>
                                <th class="infoline">
                                    <c:out value="${status.index+1}" />
                                </th>
                                <td align="left" valign="middle">
                                    <div align="left">
                                        <kul:htmlControlAttribute property="${committeeMembership}.membershipRoles[${status.index}].membershipRoleCode" 
                                                                  attributeEntry="${membershipRoleAttributes.membershipRoleCode}" 
                                                                  readOnlyAlternateDisplay="${membershipRole.membershipRole.description}" 
                                                                  readOnly="true" />
                                    </div>
                                </td>
                                <td align="left" valign="middle">
                                    <div align="center">
                                        <kul:htmlControlAttribute property="${committeeMembership}.membershipRoles[${status.index}].startDate" 
                                                                  attributeEntry="${membershipRoleAttributes.startDate}" 
                                                                  readOnly="${readOnly}"
                                                                  datePicker="true" />
                                    </div>
                                </td>
                                <td align="left" valign="middle">
                                    <div align="center">
                                        <kul:htmlControlAttribute property="${committeeMembership}.membershipRoles[${status.index}].endDate" 
                                                                  attributeEntry="${membershipRoleAttributes.endDate}" 
                                                                  readOnly="${readOnly}"
                                                                  datePicker="true" />
                                    </div>
                                </td>
 
                                <c:if test="${!readOnly}">
                                    <td align="left" valign="middle">
                                        <div align="center">                    
                                            <html:image property="methodToCall.deleteCommitteeMembershipRole.${committeeMembership}.line${status.index}"
                                                        src='${ConfigProperties.kra.externalizable.images.url}tinybutton-delete1.gif' 
                                                        styleClass="tinybutton"/>
                                        </div>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        <%-- Existing data --%>
                        
                    </table>
                </div>
            </kul:innerTab>
        </td>
    </tr>
</table>
