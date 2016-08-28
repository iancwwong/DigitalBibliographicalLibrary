<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!-- JSLT -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<!--  Bootstrap meta tags  -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!--  Other heads -->
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<title>DBL - Search Results</title>
	
	<!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <!--  Page styling -->
    <link href="css/general.css" rel="stylesheet">
    <link href="css/navbar.css" rel="stylesheet">

</head>
<body>
	<div class="container">
		<!--  Navbar -->
		<%@ include file="include/navbar.jsp"%>
	
		<!-- Page Content -->
		<h1>Search Results</h1>
		<hr/>
		
		<!--  Check whether there are results -->
		<c:choose>
			<c:when test="${empty searchPageBean.results}">
				<center>No results found!</center>
			</c:when>
			
			<c:otherwise>
				<center>There are ${fn:length(searchPageBean.results)}</center>
			</c:otherwise>
		</c:choose>
		
		<!-- Footer -->
		<%@ include file="include/footer.jsp"%>
	
	</div>

</body>
</html>