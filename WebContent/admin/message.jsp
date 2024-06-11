<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Message" />
	</jsp:include>
</head>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp" />
	
	<div class="row">&nbsp;</div>
	
	<div class="row">
		<div class="col text-center text-success">	
			<h4>${message}</h4>
		</div>
	</div>
	
	<div class="row">&nbsp;</div>
		
	<jsp:directive.include file="footer.jsp" />
</div>
</body>
</html>