<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- JSLT core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Publication -->
<%@ page import="edu.unsw.comp9321.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!--  Bootstrap meta tags  -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<title>DBLP - View Publication</title>
	
	<!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <!--  Page styling -->
    <link href="css/general.css" rel="stylesheet">
    <link href="css/navbar.css" rel="stylesheet">
</head>
<body>

	<!-- navbar -->
	<%@ include file="include/navbar.html"%>
	
	<!-- Publication Content -->
	<div class="container">
	
		<center>
			<h1> This is the publication page. </h1>
		</center>
		<c:choose>
			<c:when test="${empty publicationPageBean.publication.id}">
			  <p>Error: Publication not found!</p>
			</c:when>
			
			<c:otherwise>
			  <p>ID: ${publicationPageBean.publication.id} </p>
			  <p>Title: ${publicationPageBean.publication.title} </p>
			</c:otherwise>
		</c:choose>
		
		<!--  Add item to cart 
		================================================ -->
		<form action='control' method='POST'>
			<input type='hidden' name="action" value="addPublicationToCart"/>
			<input type='hidden' name="pubID" value="${publicationPageBean.publication.id}"/>
			<input type='hidden' name="pubType" value="${publicationPageBean.publication.type}"/>
			<button type="submit" class="btn btn-info btn-sm">
				Add to cart (${publicationPageBean.publication.price})
			</button>
		</form>	
	
	</div>
  
    <!-- ========= Bootstrap Core Javascript =========== -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>