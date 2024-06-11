<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="${customer == null ? 'Create New Customer' : 'Edit Customer'}" />
	</jsp:include>
</head>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp" />

	<div class="row m-3">
		<div class="col text-center">
			<h2><c:out value="${customer != null ? 'Edit Customer' : 'Create New Customer'}" /></h2>
		</div>
	</div>
	
	<c:if test="${customer != null}">
		<form action="update_customer" method="post" style="max-width: 700px; margin: 0 auto;">
		<input type="hidden" name="customerId" value="${customer.customerId}">
	</c:if>
	<c:if test="${customer == null}">
		<form action="create_customer" method="post" style="max-width: 700px; margin: 0 auto;">
	</c:if>
	
	<jsp:directive.include file="../common/customer_form.jsp" />
	
	</form>

	<jsp:directive.include file="footer.jsp" />
</div>	
</body>
<script type="text/javascript" src="../js/customer-form.js"></script>
</html>