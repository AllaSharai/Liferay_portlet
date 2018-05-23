<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<portlet:defineObjects />

<jsp:useBean id="documents" class="java.util.ArrayList" scope="request"/>

<aui:button-row cssClass="user-document-add-btn">
	<portlet:renderURL var="addDocumentURL">
		<portlet:param name="mvcPath" value="/add_document.jsp"></portlet:param>
	</portlet:renderURL>
	<aui:button onClick="<%= addDocumentURL.toString() %>" value="Add document"></aui:button>
	
	<liferay-ui:search-container>
	<liferay-ui:search-container-results
	    results="<%= documents %>"
	/>

	<liferay-ui:search-container-row
		className="com.alla.sharai.model.Document"
		modelVar="aDocument"
	>
	
		<liferay-ui:search-container-column-text property="title" />
		
		<liferay-ui:search-container-column-text property="text" />

		
		
	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>
	
</aui:button-row>