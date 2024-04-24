<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>

<meta charset="ISO-8859-1">
<title>Create New User - Evergreen Bookstore Administration</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<jsp:directive.include file="header.jsp" />


	<diV align="center">
		<h1 class="pageheading">
			<c:if test="${user != null}">
			Edit User
			</c:if>
			<c:if test="${user == null}">
			Create New User
			</c:if>
		</h1>
	</div>

	<div align="center">

		<c:if test="${user != null}">
			<form id="userForm" action="update_user" method="post"">
				<input type="hidden" name="userId" value=${user.userId}>
		</c:if>
		<c:if test="${user == null}">
			<form id="userForm" action="create_user" method="post">
		</c:if>
		<table class="form">
			<tbody>
				<tr>
					<td align="right">Email:</td>
					<td align="left"><input type="text" name="email" id="email"
						size="20" value=${user.email}></td>
				</tr>
				<tr>
					<td align="right">Full Name:</td>
					<td align="left"><input type="text" name="fullname" id="name"
						size="20" value=${fullName}></td>
				</tr>
				<tr>
					<td align="right">Password:</td>
					<td align="left"><input type="password" name="password"
						id="password" size="20" value=${user.password}></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><button type="submit">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" id="buttonCancel">Cancel</button></td>
				</tr>
			</tbody>
		</table>
		</form>
	</diV>

	<jsp:directive.include file="footer.jsp" />

<script type="text/javascript">
	$(document).ready(function() {
		$("#userForm").validate({
			rules : {
				mail : "required",
				fullname : "required",
				password : "required",
			},

			messages : {
				mail : "Please enter email address",
				fullname : "Please enter full name",
				password : "Please enter password"
			}
		});

		$("#buttonCancel").click(function() {
			history.go(-1);
		});

	});

	function validateFormInput() {
		const emailField = document.getElementById("email");
		const fullNameField = document.getElementById("name");
		const passwordField = document.getElementById("password");

		if (emailField.value.length == 0) {
			alert("Email is required!!");
			emailField.focus();
			return false;
		}

		if (fullNameField.value.length == 0) {
			alert("Full Name is required!!");
			fullNameField.focus();
			return false;
		}

		if (passwordField.value.length == 0) {
			alert("Password is required!!");
			passwordField.focus();
			return false;
		}
	}
</script>
</body>

</html>