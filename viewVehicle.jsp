<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>

<%-- script for the stars --%>
<script src="https://kit.fontawesome.com/60d3540ab5.js" crossorigin="anonymous"></script>



						<script type="text/javascript">
					     	
					     	function executeRating(stars, elementId) {
					     		  const starClassActive = "rating__star" + elementId + " fas fa-star";
					     		  const starClassInactive = "rating__star" + elementId + " far fa-star";
					     		   
					     		  const starsLength = stars.length;
					     		  let i;
					     		  stars.map((star) => {
					     		    star.onclick = () => {
					     		      i = stars.indexOf(star);
					     		      
					     		      let activeCount = -1;
									  let notRated = false;
					     		      
					     		      if (star.className===starClassInactive) {
					     		        activeCount = i + 1;
					     		        for (i; i >= 0; --i) stars[i].className = starClassActive;
					     		      } else {
					     		    	//it was active, switch to inactive
					     		    	if(i == 0){
					     		    		notRated = true;
					     		    	}
					     		    	  
					     		    	activeCount = i;
					     		        for (i; i < starsLength; ++i) stars[i].className = starClassInactive;
					     		      }
					     		      /*alert('review count ' + activeCount);*/
					     		      if(notRated){
					     		    	document.getElementById(elementId).textContent = " - Not Rated";
					     		    	document.getElementById(elementId + "hf").value = null;
					     		      }else{
					     		    	 document.getElementById(elementId).textContent = null;
					     		    	 document.getElementById(elementId + "hf").value = activeCount;
							     	  }
					     		       
					     		    };
					     		  });
					     		}
					     	
					     </script>

	
		

	<div class="pageWidth header bold" style="text-align: center;">
		<c:out value="${requestScope.vehicle.vehicleModel.manufacturerAndModel}" />
		<c:out value="${requestScope.vehicle.name}" />
	</div>
	
	<c:if test="${not empty requestScope.vehicle.videos }">
		<div class="vidContainer">
			
			<c:forEach var="video" items="${requestScope.vehicle.videos}" varStatus="index">
		        <div class="vid">
		        	<%-- <iframe width="280" height="158"  --%>
						<iframe width="336" height="190" 
						src="https://www.youtube.com/embed/${pageScope.video.youtubeId}"
						 title="YouTube video player" frameborder="0" 
						 allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
					</iframe>
					<br/>
					<c:if test="${pageScope.video.official}"><img alt="From the Manufacturer" style="width: 14px; height: 14px" src="<spring:url value='/resources/icons/verified-badge.svg'/>"></c:if>
					 <c:out value="${pageScope.video.name}"/>
				</div>
			</c:forEach>
			
		</div>
	</c:if>
	
	
	<div class="pageWidth subheader descContainer bold">Description</div>

	<div class="pageWidth subheader descContainer">
			<c:out value="${requestScope.vehicle.description}" escapeXml="false"/>
	</div>
	
	
	<div class="descContainer">
		<c:if test="${not empty requestScope.vehicle.url}">
			<div class="pageWidth default">
					<a href="${requestScope.vehicle.url}"><c:out value="${requestScope.vehicle.url}"/></a>
			</div>
		</c:if>
	</div>

<spring:url value="/public/submitReview/${requestScope.vehicle.uid}/" var="formUrl"/>
	
<%-- 		
<form:form action="${formUrl}" method="POST" modelAttribute="vehicleReviewForm">
--%>			
	<table border="0" cellspacing="0" cellpadding="0" style="width: 966px">
		
		<tr class='default'>
			<td style="font-weight: bold;">
				Make and Manufacturer
			</td>
			<td>
				<c:out value="${requestScope.vehicle.vehicleModel.manufacturerAndModel}" /> <c:out value="${requestScope.vehicle.name}" />
			</td>
			<td style="font-weight: bold;">
				Model Year
			</td>
			<td>
				<fmt:formatNumber value="${requestScope.vehicle.modelYear}" pattern="####.##"/>
			</td>
		</tr>
		
		<%--div class="pageWidth default descContainer">
			<div class="descItems" style="width: 482px">
				<div class="bold halfWidth" style="width: 241px">
					Make and Manufacturer
				</div>
				<div class="halfWidth" style="width: 241px">
					<c:out value="${requestScope.vehicle.vehicleModel.manufacturerAndModel}" /> <c:out value="${requestScope.vehicle.name}" />
				</div>
			</div>
			
			<div class="descItems" style="width: 482px">
				<div class="bold halfWidth" style="width: 241px">
					Model Year
				</div>
				<div class="halfWidth" style="width: 241px">
					<fmt:formatNumber value="${requestScope.vehicle.modelYear}" pattern="####.##"/>
				</div>
			</div>
		</div--%>
		
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
		
		<c:if test="${not empty requestScope.vehicle.chassis }">
			<tr>
				<td style="font-weight: bold;">Chassis</td>
				<td class="small" colspan="3">
					<c:forEach items="${requestScope.vehicle.chassis}" var="chassi">
						<%--a href='<c:out value="${pageScope.vehicle.generator.manufacturerModelUrl}"/>' target="_blank"--%>
						<c:out value="${pageScope.chassi.name}"/><br/>
						<%--/a---%>
					</c:forEach>
				</td>
				
			</tr>		
		</c:if>
		
		
		
		
		<tr>
			<th style="font-weight: bold;" colspan="4">Review This RV
			CATEGORIES <c:out value="${fn:length(requestScope.vehicleReviewForm.reviewItems)}"/> 
			</th >
		</tr>	
		
		<c:if test="${not empty requestScope.vehicleReviewForm.reviewItems }">
			
			<c:forEach items="${requestScope.vehicleReviewForm.reviewItems}" var="reviewCategory" varStatus="theIndex">
			<%-- c:forEach items="${requestScope.reviewCategories}" var="reviewCategory" varStatus="theIndex"--%>
				<c:if test='${theIndex.index % 2 == 0}'><tr></c:if>
				<td style="font-weight: bold;" colspan="2">
						<c:out value="${pageScope.reviewCategory.name}"/><span id = "${pageScope.reviewCategory.uid}"> - Not Rated</span>
					     
					     <%-- fas instead of far --%>
						 <div class="rating">
					         <i class="rating__star${pageScope.reviewCategory.uid} far fa-star"></i>
					         <i class="rating__star${pageScope.reviewCategory.uid} far fa-star"></i>
					         <i class="rating__star${pageScope.reviewCategory.uid} far fa-star"></i>
					         <i class="rating__star${pageScope.reviewCategory.uid} far fa-star"></i>
					         <i class="rating__star${pageScope.reviewCategory.uid} far fa-star"></i>
					     </div>
					     
					     <script type="text/javascript">
					     	
					     	const ratingStars${pageScope.reviewCategory.uid} = [...document.getElementsByClassName("rating__star${pageScope.reviewCategory.uid}")];
					     	executeRating(ratingStars${pageScope.reviewCategory.uid}, "${pageScope.reviewCategory.uid}");
					     
					     </script>
						<br/>
				</td>
				<c:if test='${theIndex.index % 2 != 0}'><!-- div 2 --></tr></c:if>	
				<c:set scope="page" var="ratingRow" value="${pageScope.theIndex.index}" />	
				<!-- RATING VAL <c:out value="${pageScope.ratingRow}"/> -->
			</c:forEach>
			<c:if test='${pageScope.ratingRow % 2 == 0}'><td></td></tr></c:if>	
		
		</c:if>
		
		<tr>
			<td colspan="4">
			
			<%-- 		
			<form:form action="${formUrl}" method="POST" modelAttribute="vehicleReviewForm">
			--%>
			<form:form action="${formUrl}" method="POST" modelAttribute="vehicleReviewForm">
			
			<br/>
			<form:input path="name" placeholder="Add a headline. What's MOST important?" maxlength="75" size="50"/><br/><br/>
			
				<form:textarea path="comments" 
				cols="50"
				rows="5"
				placeholder="What did you like or dislike. What would feature would you most like to see added?"/>	
			
			<br/><br/>
			
			

			<form:checkbox path="shareReview" value="true" /> Share My Review<br/><br/>
								
				<c:forEach items="${requestScope.vehicleReviewForm.reviewItems}" var="reviewItem" varStatus="theIndex">
					<form:hidden path="reviewItems[${theIndex.index}].uid" /> 
					<form:hidden path="reviewItems[${theIndex.index}].name" /> 
					<form:hidden path="reviewItems[${theIndex.index}].rating" id="${reviewItem.uid}hf"/> 
				</c:forEach>
				
				<input type="submit" value="Submit Review"/>
				<br/><br/>
				
			<%-- --%>
			</form:form>
			
			
			
			</td>
		</tr>
				
			
		
		
		
		
		<tr>
			<td style="font-weight: bold;" colspan="4">This RV<br/>
			
				<img alt="QR Code to Scan for RV" style="width: 70px; height: 70px" src='<spring:url value="/images/rv/${requestScope.vehicle.uid}.png"/>'>
			</td>
		</tr>		
		
</table>

<%--
</form:form>
 --%>
	
<!--END DISPLAY-->
