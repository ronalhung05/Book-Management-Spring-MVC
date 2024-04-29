<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Manage Customers - Evergreen Bookstore Administration</title>
	<link rel="stylesheet" href="../css/style.css" >
	<script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
</head>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp" />

	<div align="center" class="col text-center">
			<h3>Customers Management</h3>
			<h4><a href="customer_form.jsp">Create New Customer</a></h4>
	</div>
	
	<div class="row">&nbsp;</div>
	
	<c:if test="${message != null}">
		<div align="center">
			<div class="col text-center text-success">	
				<h4>${message}</h4>
			</div>
		</div>
	</c:if>
	
	<div align="center">
		<table border="1" cellpadding="5">
			<thead class="thead-dark">
				<tr>
					<th>Index</th>
					<th>ID</th>
					<th>E-mail</th>
					<th>Full Name</th>
					<th>City</th>
					<th>Country</th>
					<th>Registered Date</th>
					<th>Actions</th>
				</tr>
			</thead>

			<tbody>			
				<c:forEach var="customer" items="${listCustomer}" varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td>${customer.customerId}</td>
					<td>${customer.email}</td>
					<td>${customer.fullname}</td>
					<td>${customer.city}</td>
					<td>${customer.country}</td>
					<td>${customer.registerDate}</td>
					<td>
						<a href="edit_customer?id=${customer.customerId}">Edit</a> &nbsp;
						<a href="javascript:confirmDelete(${customer.customerId})">Delete</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	
	<jsp:directive.include file="footer.jsp" />
	<script type="text/javascript">
		function confirmDelete(customerId) {
			if (confirm('Are you sure you want to delete customer with ID '
					+ customerId + '?')) {
				window.location = 'delete_customer?id=' + customerId;
			}
		}
	</script>
</body>
</html>