<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSLT core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Index Bean -->
<%@ page import="edu.unsw.comp9321.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<!--  Bootstrap meta tags  -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!--  Other heads -->
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<title>DBL - Welcome</title>
	
	<!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <!--  Page styling -->
    <link href="css/general.css" rel="stylesheet">
    <link href="css/navbar.css" rel="stylesheet">
    <link href="css/searchbar.css" rel="stylesheet">
    
</head>
<body>
	
	<!-- CONTENT -->
	<div class="container">
		<!-- Navbar -- >
		<%@ include file="include/navbar.jsp"%>
	
		<h1>Welcome to the Digital Bibliographical Library!</h1>
		<hr />
				
		<!-- Basic search -->
		<h4>Basic search</h4>
		<center>
			<%@ include file="include/searchbar.jsp" %>
		</center>
		<br/>
		<br/>
		
		<!-- Advanced search -->
		
		<!-- Random publications -->
		<p><strong>Some interesting articles</strong></p>
		<table id="randPublicationsTable" class="table table-hover">
			<col width="100px" />
			<col width="600px" />
			<col width="15px" />
			<tr>
				<th>Type</th>
				<th>Details</th>
				<th></th>
			</tr>
			<c:forEach var="publication" items="${indexPageBean.publications}">
				<tr>
					<td ><p>${publication.type}</p></td>
					<td style="word-wrap: break-word">
						<form action='control' method='POST'>
							<input type='hidden' name="action" value="viewPublicationPage"/>
							<input type='hidden' name="pubID" value="${publication.id}"/>
							<input type='hidden' name="pubType" value="${publication.type}"/>
							<button type='submit' class="btn btn-link" style="text-align: left">
								
								<p><i>${publication.title}</i></p>
								
								<%-- Recognise the authors/editors appropriately --%>
								<c:choose>
									<c:when test="${empty publication.authors}">
										<c:choose>
										
											<%-- Case when there are no recorded authors / editors --%>
											<c:when test="${empty publication.editors}">
												<p>By: <i>anonymous</i></p>
											</c:when>
											
											<%-- Case when there are editors, no authors --%>
											<c:otherwise>
												<p>Edited by: ${publication.formattedEditors}</p>
											</c:otherwise>
										</c:choose>
									</c:when>
									
									<%-- Authors exist for publication --%>
									<c:otherwise>
										<p>By: ${publication.formattedAuthors}</p>
									</c:otherwise>
								</c:choose>								
								
							</button> 
						</form>
					</td>
					<td class="col-md-2"></td>
				</tr>
			</c:forEach>
		</table>
		
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