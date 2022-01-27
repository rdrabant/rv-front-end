<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


	  This is my side project to build an RV database. <br/>
	    <a href='<spring:url value="/public/changelog/"/>' target="_blank">See changes and date here. </a><br/>
	    - Robert Drabant
    	
    	
Initial move to a changelog. <br>
<ul>

	<li>9/21/21
		<ul>
		    <li>Chassis reworked on the basis, rvs can be available on multiple chassis</li>
		    <li>in public search, added count of category available.</li>
	    </ul>
    </li>
	
	<li>9/15/21
		<ul>
	    <li>Added in hot water capacity</li>
	    <li>Added tankless or not</li>
	    <li>Added wattage for inverter</li>
	    <li>Added placeholder on the backend for chassis. Ford53, Sprinter, etc. Search and public side should be up next week </li>
	    </ul>
    </li>
	<li>9/13/21
		<ul>
	    <li>Moved from 1 video review to multiple as well as ability to flag offical manufactuter video</li>
	    </ul>
    </li>
    <li>9/11/21
		<ul>
	    <li>Added Generator, and Generator Fuel Type and Wattage</li>
	    </ul>
    </li>
    <li>9/9/21
		<ul>
			<li>Added conversion to liters and meters to detail page.
		</ul>
	</li>
	

</ul>


<!--END DISPLAY-->
