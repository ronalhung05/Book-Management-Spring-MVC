<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel = "stylesheet" href = "../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
	<div align = "center">
		<h1>Book Store Administration</h1>
		<h2>Admin Login</h2>
		
		<form id = "loginForm" action = "login" method = "post">
			<table>
				<tr>
					<td>Email:</td>
					<td><input type = "text" name = "email" id = "email" size = "20"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type = "password" name = "password" id = "password" size = "20"></td>
				</tr>
				<tr>
					<td colspan = "2" align = "center">
						<button type = "submit">Login</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

<script type="text/javascript">
	$(document).ready(function() {
		$("#loginForm").validate({
			rules : {
				email : "required",
				password : "required",
			},

			messages : {
				email : "Please enter email address",
				password : "Please enter password"
			}
		});

	});
</script>
</body>
</html>