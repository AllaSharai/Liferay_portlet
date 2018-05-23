<%
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib prefix="aui" uri="http://liferay.com/tld/aui" %>


<portlet:defineObjects />

<div id="myCarousel">
  <div id="image1"></div>
  <div id="image2"></div>  
  <div id="image3"></div>  
</div>

<aui:script>
 AUI().use(
   'aui-carousel',
   function(Y) {
    new Y.Carousel(
      {
          contentBox: '#myCarousel',
          height: 450,
          width: 700,
          intervalTime: 2,
          animationTime: 1,
          activeIndex: 0,
          boundingBox: '#myCarousel'
      }
    ).render();
  }
);
</aui:script>
