<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Order Details - Evergreen Bookstore Administration</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<jsp:directive.include file="header.jsp"/>
<div align="center">
    <h2>Details of Order ID: ${order.orderId}</h2>
</div>
<c:if test="${message != null}">
    <div align="center">
        <h4 class="message">
            <i>${message}</i>
        </h4>
    </div>
</c:if>

<jsp:directive.include file="../common/common_order_detail.jsp"/>

<div align="center">
    <br>
    <a href="edit_order?id=${order.orderId}">Edit Order</a>
    &nbsp;&nbsp;
    <a href="delete_order?id=${order.orderId}">Delete Order</a>
</div>
<jsp:directive.include file="footer.jsp"/>
<script type="text/javascript">
    $(document).ready(function () {
        $(".deleteLink").each(function () {
            $(this).on("click", function () {
                orderId = $(this).attr("id");
                if (confirm('Are you sure you want to delete the order with ID ' + orderId + '?')) {
                    window.location = 'delete_order?id=' + orderId;
                }
            });
        });
    });
</script>
</body>
</html>