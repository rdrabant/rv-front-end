<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>

<link rel="stylesheet" href="/reg/resources/css/wrpv3.css" type="text/css"/>
<title>Vehicle Search</title>
</head>

<body>
<table border="0" cellspacing="0" cellpadding="0" style="width: 1200px">
	  <tr>
    	<td colspan="2">
    	
	    This is my side project to build an RV database. <br/>
	    <a href='<spring:url value="/public/changelog/"/>' target="_blank">See changes and date here. </a><br/>
	    - Robert Drabant
    	
    	</td>
   	</tr>
   	<tr>
    <tr>
    	<td colspan="2">
    	
    	The following search criteria are implemented.<br/>
    		<ul>
    			<li>vehicle type</li>
    			<li>vehicle manufacturer</li>
    			<li>min/max length</li>
    			<li>min/max year</li>
    			<li>min/max generator wattage</li>
    		</ul> 
    		
    		<br/><br/>
    	
    	
    	</td>
   	</tr>
   	<tr>
    	<td>
    	
    		<spring:url value="/public/searchRvsResults/" var="formUrl"/>
			
			<form:form action="${formUrl}" method="GET" modelAttribute="vehicleSearchForm" name="tr_form">
				<table border="0" cellpadding="2" cellspacing="0" style="width: 300px">
				<tbody>
					
					
					<!-- tr>
						<td class="right"><spring:message code="global.Name"/></td>
						<td class="default"><form:input path="name" size="20" maxlength="50" /></td>
					</tr-->
					
					
					<tr>
						<td class="right">Model</td>
						<td class="default">
							<form:select path="vehicleTypeId">
								<form:option value=""> -- Select One -- </form:option>
								<optgroup label="Drivables">
									<form:options items="${requestScope.drivables}" itemValue="key" itemLabel="value"/>
								</optgroup>
								<optgroup label="Towables">
									<form:options items="${requestScope.towables}" itemValue="key" itemLabel="value"/>
								</optgroup>
							</form:select>
						</td>
					</tr>
					
					<tr>
						<td class="right">Manufacturer</td>
						<td class="default">
							<form:select path="manufacturerId">
								<form:option value=""> -- Select One -- </form:option>
								<form:options items="${requestScope.manufacturers}" itemValue="key" itemLabel="value"/>
							</form:select>
						</td>
					</tr>
					
					<tr>
						<td class="right">Chassis</td>
						<td class="default">
							<form:select path="chassisId">
								<form:option value=""> -- Select One -- </form:option>
								<form:options items="${requestScope.chassis}" itemValue="key" itemLabel="value"/>
							</form:select>
						</td>
					</tr>
					
					<tr>
						<td class="right">Min Year</td>
						<td class="default">
							<form:select path="minYear">
								<form:option value=""> -- Any -- </form:option>
								<form:options items="${requestScope.years}" itemLabel="value" itemValue="key"/>
							</form:select>
						</td>
					</tr>
	
					<tr>
						<td class="right">Max Year</td>
						<td class="default">
							<form:select path="maxYear">
								<form:option value=""> -- Any -- </form:option>
								<form:options items="${requestScope.years}" itemLabel="value" itemValue="key"/>
							</form:select>
						</td>
					</tr>
					
					
					<tr>
						<td class="right">Min Generator Wattage</td>
						<td class="default">
							<form:select path="minWattage">
								<form:option value=""> -- Any -- </form:option>
								<form:options items="${requestScope.wattage}" itemLabel="value" itemValue="key"/>
							</form:select>
						</td>
					</tr>
	
					<tr>
						<td class="right">Max Generator Wattage</td>
						<td class="default">
							<form:select path="maxWattage">
								<form:option value=""> -- Any -- </form:option>
								<form:options items="${requestScope.wattage}" itemLabel="value" itemValue="key"/>
							</form:select>
						</td>
					</tr>
					

					<tr>
						<td class="right">Min Length</td>
						<td class="default">
							<form:select path="minFeet">
								<form:option value=""> -- Any -- </form:option>
								<form:options items="${requestScope.feet}" itemLabel="value" itemValue="key"/>
							</form:select>
						</td>
					</tr>
	
					<tr>
						<td class="right">Max Length</td>
						<td class="default">
							<form:select path="maxFeet">
								<form:option value=""> -- Any -- </form:option>
								<form:options items="${requestScope.feet}" itemLabel="value" itemValue="key"/>
							</form:select>
						</td>
					</tr>

					<tr>
						<td class="right">Prime Pooping Position</td>
						<td class="default">
							<form:select path="primePoopingPosition">
								<form:option value=""> -- Select One -- </form:option>
								<form:option value="0">No</form:option>
								<form:option value="1">Yes (*with conditions) </form:option>
								<form:option value="2">Yes</form:option>
							</form:select>
						</td>
					</tr>

					<%--tr>
						<td class="right">Seatbelts</td>
						<td class="default"><form:input path="seatbelts" size="8" maxlength="8" /></td>
					</tr>
					
					<tr>
						<td class="right">Sleeps</td>
						<td class="default"><form:input path="sleeps" size="8" maxlength="8" /></td>
					</tr--%>
	
					<tr>
						<td class="right">&nbsp;</td>
						<td class="default">&nbsp;</td>
					</tr>


					<tr>
						<td colspan="2" align="center">
							<button type="submit" name="save" class="button" >Search</button>
						</td>
					</tr>
					
				</tbody>
			</table>
				
			
    		</form:form>
    	</td>
    	<td>
	    <!--BEGIN DISPLAY--> 
			
			
			<table border="0" cellspacing="0" cellpadding="3" style="width: 900px">
	              	
	                <tr class="header">
	                   	<th colspan="7" class="header">
							<c:out value="${requestScope.resultsBean.resultsText}" /> 
							Vehicles
						</th>
	               	</tr>
	               	<tr class="subheader">
	               		<th class="subheader">Name</th>
	                   	<th class="subheader">Year</th>
	                   	<th class="subheaderCenter">Seatbelts</th>
	                   	<th class="subheaderCenter">Sleeps</th>
						<th class="subheaderCenter">Prime Pooping Position</th>
						<th class="subheaderCenter">Length</th>
						<!-- th class="subheaderCenter">Review Date</th-->
	                 </tr>
	                
					  <c:forEach var="vehicle" items="${requestScope.resultsBean.results}" varStatus="theIndex">
					  	
	                	<tr class='default<c:if test="${theIndex.count mod 2 != 0}">2</c:if>' <%-- <c:if test="${pageScope.vehicle.status eq 1}">style='background-color: red</c:if>--%> >
	                	
		                  <td class="small">
	                        <a href="<spring:url value='/public/viewVehicle/${pageScope.vehicle.uid}/'/>">
	                        	<c:out value="${pageScope.vehicle.vehicleModel.manufacturerAndModel}" /> <c:out value="${pageScope.vehicle.name}" /></a>
	                      </td>
	                      <td class="small"><fmt:formatNumber value="${pageScope.vehicle.modelYear}" pattern="####.##"/></td>
	                      <td class="smallCenter"><c:out value="${pageScope.vehicle.seatbelts}" /></td>
	                      <td class="smallCenter"><c:out value="${pageScope.vehicle.sleeps}" /></td>
	                      <td class="smallCenter"><c:out value="${pageScope.vehicle.primePoopingPositionHtml}" /></td>
	                      <td class="smallCenter"><c:out value="${pageScope.vehicle.lenghtHtml}" /></td>
	                      <!-- td class="smallCenter"><fmt:formatDate value="${pageScope.vehicle.reviewDate}" pattern="MMM dd, yyyy" /></td-->
	                      
	                    </tr>
	                    
	                 </c:forEach>
	                  
	              
		        	
     	 		</table>
		<!--END DISPLAY-->
		</td>
	</tr>
</table>

</body>
</html>

