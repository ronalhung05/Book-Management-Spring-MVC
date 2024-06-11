<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="My Order History"/>
</jsp:include>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp"/>
    <div class="row">&nbsp;</div>

    <div class="row">
        <div class="col text-center"><h2>My Order History</h2></div>
    </div>

    <c:if test="${fn:length(listOrders) == 0}">
        <div class="row">
            <div class="col text-center"><h3>You have not placed any orders.</h3></div>
        </div>
    </c:if>

    <c:if test="${fn:length(listOrders) > 0}">
        <div align="center">
            <table class="table table-bordered table-striped table-hover table-responsive-sm">
                <thead class="thead-dark">
                <tr>
                    <th>Index</th>
                    <th>Order ID</th>
                    <th>Quantity</th>
                    <th>Total Amount</th>
                    <th>Order Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${listOrders}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${order.orderId}</td>
                        <td>${order.bookCopies}</td>
                        <td><fmt:formatNumber value="${order.total}" type="currency"/></td>
                        <td>${order.orderDate}</td>
                        <td>${order.status}</td>
                        <td>
                            <a href="show_order_detail?id=${order.orderId}">View Details</a> &nbsp;
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>

    <jsp:directive.include file="footer.jsp"/>
</div>
</body>
</html>