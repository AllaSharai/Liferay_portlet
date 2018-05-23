<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui" %>
<portlet:defineObjects />

<portlet:renderURL var="viewURL"><portlet:param name="mvcPath" value="/view.jsp"></portlet:param></portlet:renderURL>
<portlet:actionURL name="addDocument" var="addDocumentURL"></portlet:actionURL>

<aui:form action="<%= addDocumentURL %>" name="<portlet:namespace />fm">

	<aui:fieldset>
		<aui:input name="title"></aui:input>
		<aui:input name="text"></aui:input>
	</aui:fieldset>
	
	<aui:button-row>
		<aui:button type="submit"></aui:button>
		<aui:button type="cancel" onClick="<%= viewURL.toString() %>"></aui:button>
	</aui:button-row>

</aui:form>