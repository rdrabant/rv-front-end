<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"	language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>

<link rel="stylesheet" href="<spring:url value='/resources/css/wrpv3.css'/>" type="text/css"/>

<%
try {
%>

<tiles:getAsString name="additionalHeaderTags" />
<%--script type="text/javascript" src="<spring:url value="/resources/js/thinkreg.js"/>"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/jquery-ui-1.12.1.min.js"/>"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/browser_test_unpacked.js"/>"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/preload.js"/>"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/timetask_objects.js"/>"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/overlib.js"/>"></script>
<script type='text/javascript' src='<spring:url value="/resources/js/ajaxUtil.js"/>'></script--%>

<style>

body{
padding: 10px;
}

.descContainer {
	display: flex;
	flex-wrap: wrap;
}

.descItems {
	display: flex;
	width: 483px;
	flex-direction: row;
	/*
		flex-wrap: nowrap;
		
		height: 220px; 
		font-size: small;
		margin: 10px;
		*/
}

.vidContainer {
	display: flex;
	flex-wrap: wrap;
}

.vid {
	width: 336px;
	height: 220px;
	font-size: small;
	margin: 10px;
}

.body {
	width: 966px;
}

.pageWidth {
	width: 966px;
}

.halfWidth {
	width: 50%;
}

.vidSpan {
	width: 280px;
	height: 220px
}

.bold {
	font-weight: bold;
}

.fa-star {
	cursor: pointer;
	color: #dabd18b2;
}

ul.theNavCss {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
}

li.theNavCss {
  float: left;
}

li.theNavCss a.theNavCss {
  display: block;
  padding: 8px;
  background-color: #dddddd;
}

</style>

</head>

<body bgcolor="#FFFFFF" text="#000000"
	style="height: 100%; margin-top: 0px; margin-left: 0px;">
	<%--Init on load is used in sessions to add loading screen if filters are used. --%>


	<div class="subheader theNavCss" style="text-align: center;">
		<nav style="display: inline;">
			<ul class="theNavCss">
				<li class="theNavCss">
					<a class="theNavCss" href='<spring:url value="/public/"/>'> Home </a>
				</li>
				<li class="theNavCss">
					<a class="theNavCss" href='<spring:url value="/myReviews/"/>'> My Reviews </a>
				</li>
				<li class="theNavCss">
					<a class="theNavCss" href='<spring:url value="/public/changelog/"/>'> Changelog </a>
				</li>
				<li class="theNavCss">
					<a class="theNavCss" href='<spring:url value="/public/about/"/>'> About </a>
				</li>
			</ul>
		</nav>
	</div>



		<c:if test="${not empty requestScope.adminMessage }">
			<p>
			<spring:message code="errors.header" />
			<c:out value="${requestScope.adminMessage}" escapeXml="false" />
			<spring:message code="errors.footer" /></p>
		</c:if>
		
		<c:if test="${not empty requestScope.msgs }">
			<spring:message code="msg.header" />
				<c:forEach items="${requestScope.msgs}" var="msg" varStatus="theIndex">
					<c:out value="${pageScope.msg}" escapeXml="false" />
				</c:forEach>
			<spring:message code="msg.footer" />
		</c:if>
		<c:if test="${not empty requestScope.errMsgs }">
			
			<spring:message code="errors.header" />
				<spring:message code="Please.fix.the.errors.below"/><br/>
				<c:forEach items="${requestScope.errMsgs}" var="err" varStatus="theIndex">
					<c:out value="${pageScope.err}" escapeXml="false" /><br/>
				</c:forEach>
			<spring:message code="errors.footer" />
		</c:if>
			
			
	<!--  BEGIN CONTENT -->
	<tiles:insertAttribute name="content" /><br>
	<!--  END CONTENT --> 
	
	
</body>
<%
} catch (Exception ex) {
ex.printStackTrace(response.getWriter());
}
%>

</html>