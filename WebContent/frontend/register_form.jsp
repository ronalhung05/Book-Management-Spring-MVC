<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Register as a Customer</title>
    <link rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp"/>
	
	<div align="center">
	    <h2 class="pageheading">
	        Register as a Customer
	    </h2>
	</div>
	
	<div align="center">
		<form action="register_customer" id="customerForm" method="post">
		   
		   <jsp:directive.include file="../common/customer_form.jsp"/> 
		</form>
	</div>
	
	<jsp:directive.include file="footer.jsp"/>
	
</body>
<script type="text/javascript" src="../js/customer-form.js"></script>
</html>