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

    <div class="row">&nbsp;</div>

    <div class="row">
        <div class="col text-center">
            <h4>You have made payment successfully. Thank you for purchasing!</h4>
            <h4>Your Payment Receipt</h4>
        </div>
    </div>

    <div class="row">&nbsp;</div>

    <jsp:directive.include file="receipt.jsp"/>

    <div class="row">&nbsp;</div>

    <div class="row">
        <div class="col text-center">
            <input type="button" value="Print Receipt" onclick="javascript:showPrintReceiptPopup();"
                   class="btn btn-primary"/>
        </div>
    </div>

    <jsp:directive.include file="footer.jsp"/>
</div>
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