<%@ include file="/WEB-INF/jsp/kraTldHeader.jsp"%>
<c:set var="masterDisclosure" value="${KualiForm.disclosureHelper.masterDisclosureBean}" />

<c:set var="coiDiscDetailAttributes" value="${DataDictionary.CoiDiscDetail.attributes}" />
<c:set var="projectsGroupedByDescription" value="(Grouped by Projects)" />
<c:if test="${!masterDisclosure.disclosureGroupedByEvent}">
	<c:set var="projectsGroupedByDescription" value="(Grouped by Financial Entities)" />
</c:if>

<kul:tab defaultOpen="false" tabTitle="Disclosed Projects" tabErrorKey="document.committee*">
	<div class="tab-container" align="center">
	    <h3>
	        <span class="subhead-left">Disclosed Projects ${projectsGroupedByDescription}</span>
	        <span class="subhead-right"> <kul:help businessObjectClassName="org.kuali.kra.coi.CoiDisclosureStatus" altText="help"/> </span>
	        <span class="subhead-right">
			    <html:image property="methodToCall.viewProjectDisclosuresByEvent" title="Group by projects"
					src='${ConfigProperties.kra.externalizable.images.url}tinybutton-projectview.gif' styleClass="tinybutton"/>
	        </span>
	        <span class="subhead-right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	        <span class="subhead-right">
			    <html:image property="methodToCall.viewProjectDisclosuresByFinancialEntity" title="Group by financial entity"
					src='${ConfigProperties.kra.externalizable.images.url}tinybutton-financialentityview.gif' styleClass="tinybutton"/>
	        </span>
	    </h3>
	    
	    <table id="protocolSubmitted-wrap-table" cellpadding=0 cellspacing=0 class="datatable" summary="Protocol Submitted">
	      	<%-- Header --%>
	       	<tr>
	            <th width="4%" />
				<c:choose>
				    <c:when test="${masterDisclosure.disclosureGroupedByEvent}">
					    <th><div align="center">Event</div></th> 
				        <th><div align="center">Project Id </div></th> 
				        <th><div align="center">Project Title</div></th> 
				        <th><div align="center">Disposition Status</div></th> 
				        <th><div align="center">Disclosure Status </div></th> 
				    </c:when>
				    <c:otherwise>
					    <th><div align="center">Entity Name</div></th> 
				        <th><div align="center">Entity Number</div></th> 
				    </c:otherwise>
				</c:choose>
			</tr>
			<%-- Header --%>
	
			<%-- Existing data --%>
	    	<c:set var="idx" value="1"/>
	        <c:forEach var="groupedMasterBean" items="${KualiForm.disclosureHelper.masterDisclosureBean.allDisclosuresGroupedByProjects}" varStatus="status">
		        <tr>
		            <th class="infoline" align="center">
			            <c:out value="${idx}" />
	    	            <c:set var="idx" value="${idx+1}"/>
		            </th>
					<c:choose>
					    <c:when test="${masterDisclosure.disclosureGroupedByEvent}">
				            <td align="left" valign="middle">
			                    <div align="left">
			                    <a href="#" id ="projectDiv-Control${idx}" class="disclosedProjectsSubpanel"><img src='kr/images/tinybutton-hide.gif' alt='show/hide panel' width='45' height='15' border='0' align='absmiddle'></a> 
				                ${groupedMasterBean.disclosureEventType} 
				                </div>
			    	        </td>
			    	        <td align="left" valign="middle">
				                <div align="left"> ${groupedMasterBean.projectId} </div>
				            </td>
				            <td align="left" valign="middle">
				                <div align="left"> ${groupedMasterBean.projectTitle} </div>
				            </td>
				            <td align="left" valign="middle">
				                <div align="left"> ${groupedMasterBean.dispositionStatus}</div>
				            </td>
				            <td align="left" valign="middle">
				                <div align="left"> ${groupedMasterBean.disclosureStatus} </div>
			    	        </td>
					    </c:when>
					    <c:otherwise>
				            <td align="left" valign="middle">
			                    <div align="left">
			                    <a href="#" id ="projectDiv-Control${idx}" class="disclosedProjectsSubpanel"><img src='kr/images/tinybutton-hide.gif' alt='show/hide panel' width='45' height='15' border='0' align='absmiddle'></a> 
				                ${groupedMasterBean.entityName} 
				                </div>
			    	        </td>
			    	        <td align="left" valign="middle">
				                <div align="left"> ${groupedMasterBean.entityNumber} </div>
				            </td>
					    </c:otherwise>
					</c:choose>
	    	    </tr>
	    	    
	    	    <tr>
	    	    <td colspan="8">
	                <div  id="projectDiv-Details${idx}">
	                <div  id="projectDiv-Content${idx}">
				        <kra-coi:disclosureProjects masterDisclosureProjects="${groupedMasterBean.allRelatedProjects}" 
				        projectDivNamePrefix="masterProjectDivFE${status.index}" projectListName="allDisclosuresGroupedByProjects[${status.index}].allRelatedProjects" 
				        boLocation="disclosureHelper.masterDisclosureBean.allDisclosuresGroupedByProjects"
				        parentTab="Disclosed Projects"/>
			    	</div>
			    	</div>
	    	    </td>
          		</tr>
	    	    
	        </c:forEach>
		<%-- Existing data --%>
	    </table>
	</div>
</kul:tab>


