<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="${user == null ? 'Create New User' : 'Edit User'}" />
	</jsp:include>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp" />
	
	<div class="row m-3">
		<div class="col text-center">
			<h2><c:out value="${user != null ? 'Edit User' : 'Create New User'}" /></h2>
		</div>
	</div>
	
		<c:if test="${user != null}">
			<form action="update_user" method="post" style="max-width: 400px; margin: 0 auto;">
			<input type="hidden" name="userId" value="${user.userId}">
		</c:if>
		<c:if test="${user == null}">
			<form action="create_user" method="post" style="max-width: 400px; margin: 0 auto;">
		</c:if>
		
			<div class="form-group row">
				<label class="col-sm-4 col-form-label">Email:</label>
				<div class="col-sm-8">
					<input type="email" name="email" size="20" value="${user.email}" class="form-control" required minlength="5" maxlength="30" />
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-4 col-form-label">Full name:</label>
				<div class="col-sm-8">
					<input type="text" name="fullname" size="20" value="${user.fullName}" class="form-control" required minlength="3" maxlength="30" />
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-4 col-form-label">Password:</label>
				<div class="col-sm-8">
					<input type="password" name="password" size="20" value="${user.password}" class="form-control" required minlength="4" maxlength="32" />
				</div>
			</div>				
			
			<div class="row m-4">
				<div class="col text-center">
					<button type="submit" class="btn btn-primary mr-2">Save</button>
					<button type="button" class="btn btn-secondary ml-2" onclick="history.go(-1);">Cancel</button>
				</div>
			</div>
		</form>

	<jsp:directive.include file="footer.jsp" />
</div>	
</body>
</html>