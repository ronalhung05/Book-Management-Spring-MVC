<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Payment Receipt- Online Book Store</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	
	<div align="center">
	<div>
		<h2>You have made payment successfully. Thank you for purchasing</h2>
	</div>
	<div>
		<jsp:directive.include file="receipt.jsp"/>
	</div>		
	<div>
		<br/>
		<input type="button" value="Print Receipt" onclick="javascript:showPrintReceiptPopup();"/>
	</div>
	</div>
	
	<jsp:directive.include file="footer.jsp" />
	
	<script>
		function showPrintReceiptPopup() {
			var width = 600;
			var height = 250;
			var left = (screen.width - width) / 2;
			var top = (screen.width - width) / 2;
			
			window.open('frontend/print_receipt.jsp', '_blank',
					'width=' + width + ', height=' + height +
					', top=' + top + ', left=' + left);
		}
	</script>
	
</body>
</html>