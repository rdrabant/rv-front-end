<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<table border="0" cellspacing="0" cellpadding="0" style="width: 966px">
	<!--BEGIN DISPLAY-->
	
	<tr>
		<th colspan="4" class="header">
		
		<a href='<spring:url value="/public/"/>'>
		Click Here to go back to the search page
		</a>
		<br/>
		<br/>		
	</tr>

	<tr class="header">
		<th colspan="4" class="header"><c:out value="${requestScope.vehicle.vehicleModel.manufacturerAndModel}" />
		<c:out value="${requestScope.vehicle.name}" /></th>
	</tr>
	
	<c:if test="${not empty requestScope.vehicle.videos }">
		<tr>
			<td colspan="4" class="header" style="align-content: center;">
				<table border="0" cellspacing="0" cellpadding="0" >
					<tr>
						<c:forEach var="video" items="${requestScope.vehicle.videos}" varStatus="index">
					        <td>
							    <%--<iframe width="560" height="315" --%>
									<iframe width="280" height="158" 
									src="https://www.youtube.com/embed/${pageScope.video.youtubeId}"
									 title="YouTube video player" frameborder="0" 
									 allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
								</iframe>
								<br/>
								<c:if test="${pageScope.video.official}"><img alt="From the Manufacturer" style="width: 20px; height: 20px" src="<spring:url value='/resources/icons/verified-badge.svg'/>"></c:if>
								 <c:out value="${pageScope.video.name}"/>
							</td>
						</c:forEach>
					</tr>
				</table>
			</td>
		</tr>
	</c:if>
	
	<tr class="subheader">
		<th class="subheader" colspan="4">Description</th>
	</tr>

	<tr>
		<td class="default" colspan="4">
			<c:out value="${requestScope.vehicle.description}" escapeXml="false"/>
		</td>
	</tr>
	
		<c:if test="${not empty requestScope.vehicle.url}">
			<tr>
				<td class="default" colspan="4">
					<a href="${requestScope.vehicle.url}"><c:out value="${requestScope.vehicle.url}"/></a>
				</td>
			</tr>
		</c:if>

		<tr class='default'>
			<td style="font-weight: bold;">Make and Manufacturer</td>
			<td><c:out value="${requestScope.vehicle.vehicleModel.manufacturerAndModel}" /> <c:out value="${requestScope.vehicle.name}" /></td>
			<td style="font-weight: bold;">Model Year</td>
			<td><fmt:formatNumber value="${requestScope.vehicle.modelYear}" pattern="####.##"/></td>
	    </tr>
		
		<tr class='default'>
			<td style="font-weight: bold;">MSRP</td>
			<td><fmt:formatNumber value="${requestScope.vehicle.msrp}" pattern="#,###.00" /></td>
			<td style="font-weight: bold;">Length</td>
			<td><c:out value="${requestScope.vehicle.lenghtHtml}" /></td>
		</tr>
		
		<tr class='default'>
			<td style="font-weight: bold;">Fuel Type</td>
			<td><c:out value="${requestScope.vehicle.fuelTypeHtml}" /></td>
			<td style="font-weight: bold;">Fuel Capacity</td>
			<td><c:out value="${requestScope.vehicle.fuelCapacityHtml}"/></td>
		</tr>
		
		<tr class='default'>
			<td style="font-weight: bold;">LPG Capacity</td>
			<td><c:out value="${requestScope.vehicle.lpgCapacityHtml}"/></td>
			<td style="font-weight: bold;">Gray Water</td>
			<td><c:out value="${requestScope.vehicle.grayWaterHtml}"/></td>
		</tr>
		
		<tr class='default'>
			<td style="font-weight: bold;">Black Water</td>
			<td><c:out value="${requestScope.vehicle.blackwaterHtml}"/></td>
			<td style="font-weight: bold;">Fresh Water</td>
			<td><c:out value="${requestScope.vehicle.freshWaterHtml}"/></td>
		</tr>
		
		<tr class='default'>
			<td style="font-weight: bold;">Tankless Hot Water Heater</td>
			<td><c:out value="${requestScope.vehicle.tanklessWaterHtml}"/></td>
			<td style="font-weight: bold;">Hot Water Capacity</td>
			<td><c:out value="${requestScope.vehicle.hotWaterCapacityHtml}"/></td>
		</tr>
			
		<tr class='default'>
			<td style="font-weight: bold;">Seatbelts</td>
			<td class="small"><c:out value="${requestScope.vehicle.seatbelts}" /></td>
			<td style="font-weight: bold;">Sleeps</td>
			<td><c:out value="${requestScope.vehicle.sleeps}" /></td>
		</tr>
		
		<c:if test="${not empty requestScope.vehicle.generator }">
			<tr>
				<td style="font-weight: bold;">Generator</td>
				<td class="small">
					<c:if test="${not empty requestScope.vehicle.generator.manufacturerModelUrl}">
						<a href='<c:out value="${requestScope.vehicle.generator.manufacturerModelUrl}"/>' target="_blank">
						<c:out value="${requestScope.vehicle.generator.name}"/>
						</a>
					</c:if>	
				</td>
				<td style="font-weight: bold;"></td>
				<td class="small">
				</td>
			</tr>		
		</c:if>
		
		chassis
		
		<tr>
			<td style="font-weight: bold;" colspan="4">This RV<br/>
			
				<img alt="QR Code to Scan for RV" src='<spring:url value="/images/rv/${requestScope.vehicle.uid}.png"/>'>
			</td>
		</tr>		
		
	

</table>
<!--END DISPLAY-->
