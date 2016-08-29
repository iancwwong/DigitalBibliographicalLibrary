<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	
	<!-- Publication Content -->
	<div class="container">
		
		<!-- navbar -->
		<%@ include file="include/navbar.jsp"%>
	
		<!-- Content -->
		<h1>View Publication</h1>
		<hr />
		<br />
		
		<c:choose>
			<c:when test="${empty publicationPageBean.publication.id}">
				<center><p>Error: Publication not found!</p></center>
			</c:when>
			
			<c:otherwise>
				<center>
					<table>
						<col width="370">
						<col width="400">
						<tr>
							<td>
								<center>
									<%-- Select appropriate image icon based on type --%>
									<img src="img/icon_${publicationPageBean.publication.type}.png" class="img" width="300" height="300"> 									
								</center>
							</td>
							<td>
								<div class="panel panel-default">
									<strong>Details</strong>
									<hr />
									
								    <table class="table">
								    	<col width="80" />
								    	<col width="320" />
								    	<tr>
								    		<td><strong>Title:</strong></td>
								    		<td style="word-wrap: break-word">${publicationPageBean.publication.title}</td>
								    	</tr>
								    	<tr>
								    		<td><strong>Authors:</strong></td>
								    		<td style="word-wrap: break-word">${publicationPageBean.publication.formattedAuthors}</td>
								    	</tr>
								    </table>
								    
								    <%--  Add item to cart --%>
								    <br />
									<form action='control' method='POST'>
										<input type='hidden' name="action" value="addPublicationToCart"/>
										<input type='hidden' name="pubID" value="${publicationPageBean.publication.id}"/>
										<input type='hidden' name="pubType" value="${publicationPageBean.publication.type}"/>
										<button type="submit" class="btn btn-primary btn-sm">
											Add to cart (${publicationPageBean.publication.price})
										</button>
									</form>	
								</div>
							</td>
						</tr>
					</table>
				</center>
			</c:otherwise>
		</c:choose>
		
		<!-- Footer -->
		<%@ include file="include/footer.jsp"%>
	
	</div>
  
    <!-- ========= Bootstrap Core Javascript =========== -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>