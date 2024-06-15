<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Payment Receipt"/>
</jsp:include>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp"/>

    <div class="row mt-4">
        <div class="col text-center">
            <h4>You have made payment successfully. Thank you for purchasing!</h4>
            <h4>Your Payment Receipt</h4>
        </div>
    </div>

    <jsp:directive.include file="receipt.jsp"/>

    <div class="row mt-4">
        <div class="col text-center">
            <button type="button" class="btn btn-primary" onclick="printReceipt()">Print Receipt</button>
        </div>
    </div>

    <jsp:directive.include file="footer.jsp"/>
</div>

<script>
    function printReceipt() {
        var width = 600;
        var height = 250;
        var left = (screen.width - width) / 2;
        var top = (screen.height - height) / 2;

        window.open('frontend/print_receipt.jsp', '_blank',
            'width=' + width + ', height=' + height +
            ', top=' + top + ', left=' + left);
    }
</script>
</body>
</html>
