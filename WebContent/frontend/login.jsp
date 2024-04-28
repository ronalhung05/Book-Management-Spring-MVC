<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<jsp:directive.include file="header.jsp" />
<div align="center">
<h2>Please login:</h2>
<form>
Email:<input type="text" size="10" /><br />
Password:<input type="text" size="10"/><br />
<input type="submit" value="Login" />

</form>
</div>
<jsp:directive.include file="footer.jsp" />
</body>
</html>