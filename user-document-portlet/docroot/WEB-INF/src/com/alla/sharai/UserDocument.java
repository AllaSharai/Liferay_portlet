package com.alla.sharai;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletPreferences;
import javax.portlet.ReadOnlyException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ValidatorException;

import com.alla.sharai.model.Document;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class UserDocument
 */
public class UserDocument extends MVCPortlet {
	
	public void addDocument(ActionRequest request, ActionResponse response) {
		try {

	       PortletPreferences prefs = request.getPreferences();

	       String[] userDocuments = prefs.getValues("userDocuments-entries",
	          new String[1]);

	       ArrayList<String> entries = new ArrayList<>();

	       if (userDocuments != null) {

	         entries = new ArrayList<>(Arrays.asList(prefs.getValues(
	              "userDocuments-entries", new String[1])));

	       }

	       String documentTitle = ParamUtil.getString(request, "title");
	       String text = ParamUtil.getString(request, "text");
	       String entry = documentTitle + "^" + text;

	       entries.add(entry);

	       String[] array = entries.toArray(new String[entries.size()]);

	       prefs.setValues("userDocuments-entries", array);

	       try {

	         prefs.store();

	       } catch (IOException ex) {

	         Logger.getLogger(UserDocument.class.getName()).log(
	              Level.SEVERE, null, ex);

	       } catch (ValidatorException ex) {

	         Logger.getLogger(UserDocument.class.getName()).log(
	              Level.SEVERE, null, ex);

	       }

	    } catch (ReadOnlyException ex) {

	       Logger.getLogger(UserDocument.class.getName()).log(
	          Level.SEVERE, null, ex);

	    }

	}
	
	@Override
	public void render (RenderRequest renderRequest, RenderResponse renderResponse) 
	        throws PortletException, IOException {

	    PortletPreferences prefs = renderRequest.getPreferences();
	    String[] documentsArray = prefs.getValues("userDocuments-entries",
	            new String[1]);

	    if (documentsArray != null) {

	        List<Document> documents = parseDocuments(documentsArray);

	        renderRequest.setAttribute("documents", documents);
	    }

	    super.render(renderRequest, renderResponse);

	}
	
	private List<Document> parseDocuments(String[] documentsArray) {

	    ArrayList<Document> entries = new ArrayList<>();

	    for (String doc : documentsArray) {
	        String[] parts = doc.split("\\^", 2);
	        Document document = new Document(parts[0], parts[1]);
	        entries.add(document);
	    }

	    return entries;
	}

}
