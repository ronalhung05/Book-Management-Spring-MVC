<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Admin Login" />
	</jsp:include>
<body>
<div class="container">
	<div class="row">
		<div class="col text-center">
			<h2>Book Store Administration</h2>
			<h3>Admin Login</h3>
		</div>		
	</div>
	
	<c:if test="${message != null}">
		<div class="row">
			<div class="col text-center text-danger"><h4>${message}</h4></div>
		</div>
	</c:if>
	
	<form id="loginForm" action="login" method="post" style="max-width: 400px; margin: 0 auto;">
		<div class="border border-secondary rounded p-3">
			<div class="form-group row">
				<label class="col-sm-4 col-form-label">Email:</label>
				<div class="col-sm-8">
					<input type="email" name="email" size="20" required minlength="5" maxlength="30" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-4 col-form-label">Password:</label>
				<div class="col-sm-8">
					<input type="password" name="password" size="20" required minlength="4" maxlength="32" class="form-control">
				</div>
			</div>
			<div class="row">
				<div class="col text-center">
					<button type="submit" class="btn btn-primary">Login</button>
				</div>
			</div>
		</div>		
	</form>
</div>		
</body>
</html>