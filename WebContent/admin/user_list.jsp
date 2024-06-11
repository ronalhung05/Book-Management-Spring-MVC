<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Manage Users" />
	</jsp:include>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp" />
	
	<div class="row">&nbsp;</div>
	
	<div class="row">
		<div class="col text-center">
			<h3>Users Management</h3>
			<h4><a href="user_form.jsp">Create New User</a></h4>
		</div>
	</div>
	
	<div class="row">&nbsp;</div>
	
	<c:if test="${message != null}">
		<div class="row">
			<div class="col text-center text-success">	
				<h4>${message}</h4>
			</div>
		</div>
	</c:if>
	
	<div class="row">
		<table class="table table-bordered table-striped table-hover table-responsive-sm">
			<thead class="thead-dark">
				<tr>
					<th>Index</th>
					<th>ID</th>
					<th>Email</th>
					<th>Full Name</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${listUsers}" varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td>${user.userId}</td>
					<td>${user.email}</td>
					<td>${user.fullName}</td>
					<td>
						<a href="edit_user?id=${user.userId}">Edit</a> &nbsp;
						<a href="javascript:void(0);" class="deleteLink" id="${user.userId}">Delete</a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<jsp:directive.include file="footer.jsp" />
</div>	
	<script>
		$(document).ready(function() {
			$(".deleteLink").each(function() {
				$(this).on("click", function() {
					userId = $(this).attr("id");
					if (confirm('Are you sure you want to delete the user with ID ' +  userId + '?')) {
						window.location = 'delete_user?id=' + userId;
					}					
				});
			});
		});
	</script>
</body>
</html>