<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSLT libraries -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    <link href="css/publicationpage.css" rel="stylesheet">
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
								
									<div class="panel-heading">
										<h4><strong>Details</strong></h4>
									</div>
									<div class="panel-body">
									    <table class="table table-borderless">
									    	<col width="80" />
									    	<col width="320" />
									    	<tr>
									    		<td><strong>Type:</strong></td>
									    		<td style="word-wrap: break-word">${publicationPageBean.publication.type}</td>
									    	</tr>
									    	<tr>
									    		<td><strong>Title:</strong></td>
									    		<td style="word-wrap: break-word">${publicationPageBean.publication.title}</td>
									    	</tr>

							    			<c:if test="${not empty publicationPageBean.publication.series}">
								    			<tr>
										    		<td><strong>Series:</strong></td>
										    		<td style="word-wrap: break-word">${publicationPageBean.publication.series}</td>
										    	</tr>
									    	</c:if>

									    	<c:if test="${not empty publicationPageBean.publication.year}">
										    	<tr>
										    		<td><strong>Year:</strong></td>
										    		<td style="word-wrap: break-word">${publicationPageBean.publication.year}</td>
										    	</tr>
									    	</c:if>
									    	
									    	<c:if test="${not empty publicationPageBean.publication.isbn}">
										    	<tr>
										    		<td><strong>ISBN:</strong></td>
										    		<td style="word-wrap: break-word">${publicationPageBean.publication.isbn}</td>
										    	</tr>
									    	</c:if>

									    	<tr>
									    		<td><strong>Authors:</strong></td>
									    		<c:choose>
										    		<c:when test="${not empty publicationPageBean.publication.formattedAuthors}">
										    			<td style="word-wrap: break-word">
										    				<c:forEach var="author" items="${publicationPageBean.publication.authors}">
										    					<p>${author}</p>
										    				</c:forEach>
										    			</td>
										    		</c:when>
										    		<c:otherwise>
										    			<td><i>Anonymous</i></td>
										    		</c:otherwise>
									    		</c:choose>
									    	</tr>
									    	
									    	<c:if test="${not empty publicationPageBean.publication.formattedEditors}">
										    	<tr>
										    		<td><strong>Editors:</strong></td>
									    			<td style="word-wrap: break-word">
									    				<c:forEach var="editor" items="${publicationPageBean.publication.editors}">
									    					<p>${editor}</p>
									    				</c:forEach>
									    			</td>
										    	</tr>
									    	</c:if>
									    	
									    	<c:if test="${not empty publicationPageBean.publication.venue}">
										    	<tr>
										    		<td><strong>Venue:</strong></td>
										    		<td style="word-wrap: break-word">${publicationPageBean.publication.venue}</td>
										    	</tr>
									    	</c:if>

							    			<c:if test="${not empty publicationPageBean.publication.volume}">
										    	<tr>
										    		<td><strong>Volume:</strong></td>
										    		<td style="word-wrap: break-word">${publicationPageBean.publication.volume}</td>
										    	</tr>
									    	</c:if>
									    
							    			<c:if test="${not empty publicationPageBean.publication.number}">
										    	<tr>
										    		<td><strong>Number:</strong></td>
										    		<td style="word-wrap: break-word">${publicationPageBean.publication.number}</td>
										    	</tr>
									    	</c:if>
									    	
									    	<c:if test="${not empty publicationPageBean.publication.pages}">
										    	<tr>
										    		<td><strong>Pages:</strong></td>
										    		<td style="word-wrap: break-word">${publicationPageBean.publication.pages}</td>
										    	</tr>
									    	</c:if>
									    	
									    	<c:if test="${not empty publicationPageBean.publication.cites}">
										    	<tr>
										    		<td><strong>Cites:</strong></td>
										    		<td style="word-wrap: break-word">
										    			<c:forEach var="cite" items="${publicationPageBean.publication.cites}">
										    				<p>${cite}</p>
										    			</c:forEach>
										    		</td>
										    	</tr>
									    	</c:if>
									    										    	
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