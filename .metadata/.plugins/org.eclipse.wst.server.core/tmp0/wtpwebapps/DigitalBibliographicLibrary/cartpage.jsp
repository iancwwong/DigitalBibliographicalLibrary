<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!-- JSLT core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<!--  Bootstrap meta tags  -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!--  Other heads -->
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<title>DBL - My Cart</title>
	
	<!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <!--  Page styling -->
    <link href="css/general.css" rel="stylesheet">
    <link href="css/navbar.css" rel="stylesheet">
    
</head>
<body>
	
	<!-- cart content -->
	<div class="container">
	
		<!-- Navbar -- >
		<%@ include file="include/navbar.html"%>
		
		<h1>Viewing cart</h1>
		<hr />	
		
		<!--  Check if cart is empty -->
		<c:choose>
			
			<%-- Items exist in cart: Construct table --%>
			<c:when test="${cartPageBean.cart.numItems > 0}">
				<form action='control' method='POST'>
					<table class="table table-hover">
						<tr>
							<th>
								Select
							</th>
							<th>Details</th>
							<th>Price</th>
						</tr>
						<c:forEach var="publication" items="${cartPageBean.cart.publications}">
							<tr>
								<td>
									<input type="checkbox" name="pubID" value="${publication.id}" />
								</td>
								<td>
									<p><i>${publication.title}</i></p>
									<p>By: ${publication.formattedAuthors}
											${publication.formattedEditors} </p>
								</td>
								<td>${publication.price}</td>
							</tr>
						</c:forEach>
					
						<%-- Total price --%>
						<tr>
							<td></td>
							<td align="right"><strong><i>Total price:</i></strong></td>
							<td>${cartPageBean.cart.totalPriceFormatted}</td>
						</tr>
					</table>
					
					<input type="hidden" name="action" value="removePublicationsFromCart" />
					<button type='submit' class="btn btn-default">
						Remove
					</button> 
				</form>	
							
			</c:when>
			
			<c:when test="${cartPageBean.cart.numItems == 0}">
				<strong>Shopping Cart is Empty!</strong>
			</c:when>
			
		</c:choose>
	
		<!-- Back to search -->
		<form action='control' method='POST'>
			<input type='hidden' name="action" value="viewIndexPage"/>
			<button type="submit" class="btn btn-success">
				<span class="glyphicon glyphicon-triangle-left"></span>
				Back to search
			</button>
		</form>	
		
		<!-- Footer -->
		<%@ include file="include/footer.html"%>
		
	</div>	
    
    <!-- ========= Bootstrap Core Javascript =========== -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>