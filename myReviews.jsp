<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%-- script for the stars --%>
	<script src="https://kit.fontawesome.com/60d3540ab5.js" crossorigin="anonymous"></script>


<table border="0" cellspacing="0" cellpadding="3" style="width: 1200px">



	<tr class="header">
		<th colspan="3" class="header">
			<c:out value="${requestScope.resultsBean.resultsText}" /> Reviews
		</th>
		<c:forEach var="category" items="${requestScope.categories}">
		<%-- adds a cell per category --%>
			<th class="subheaderCenter"></th>
		</c:forEach>
	</tr>

	
	<tr class="subheader">
		<th class="subheader">Name</th>
		<th class="subheader">Year</th>
		<th class="subheaderCenter">Length</th>
		<!-- th class="subheaderCenter">Review Date</th-->
		<c:forEach var="category" items="${requestScope.categories}">
			<th class="subheaderCenter"><c:out value="${pageScope.category.name}"/></th>
		</c:forEach>
	</tr>

	<c:forEach var="review" items="${requestScope.resultsBean.results}"
		varStatus="theIndex">

		<tr class='default<c:if test="${theIndex.count mod 2 != 1}">2</c:if>'<%-- <c:if test="${pageScope.vehicle.status eq 1}">style='background-color: red</c:if>--%> >

			<td class="small"><a href="<spring:url value='/public/viewVehicle/${pageScope.review.vehicle.uid}/'/>">
					<c:out value="${pageScope.review.vehicle.vehicleModel.manufacturerAndModel}" />
					<c:out value="${pageScope.review.vehicle.name}" />
			</a></td>
			<td class="small"><fmt:formatNumber	value="${pageScope.review.vehicle.modelYear}" pattern="####.##" /></td>
			<td class="smallCenter"><c:out value="${pageScope.review.vehicle.lenghtHtml}" /></td>
			
			<c:forEach var="category" items="${requestScope.categories}">
			<td class="subheaderCenter">
			
				<c:set var="reviewItemVal" value="-1" />
				<c:forEach var="reviewItem" items="${pageScope.review.reviewedItems}">
					<c:if test="${pageScope.reviewItem.reviewCategory.uid eq pageScope.category.uid}">
						<c:set var="reviewItemVal" value="${reviewItem.rating }"/>
					</c:if>
				</c:forEach>
				
				<c:if test="${pageScope.reviewItemVal gt 0}">
					<c:out value="${pageScope.reviewItemVal}"/> <i class="rating__star fas fa-star"></i>
				</c:if>
				<c:if test="${pageScope.reviewItemVal le 0}">
					Not Rated
				</c:if>
			
			</td>
			</c:forEach>

		</tr>
		<tr class='default<c:if test="${theIndex.count mod 2 != 1}">2</c:if>'<%-- <c:if test="${pageScope.vehicle.status eq 1}">style='background-color: red</c:if>--%> >

			<td class="small" colspan="${requestScope.colsize}">
    			<c:out value="${pageScope.review.name}" />
			</td>
		</tr>


	</c:forEach>



</table>
<!--END DISPLAY-->