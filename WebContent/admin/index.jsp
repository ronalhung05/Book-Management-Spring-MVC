<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Admin Dashboard"/>
</jsp:include>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp"/>

    <div class="row">&nbsp;</div>

    <div class="row">
        <div class="col text-center">
            <h3>Administrative Dashboard</h3>
        </div>
    </div>

    <div class="row">
        <div class="col text-center">
            <hr/>
            <h3>Quick Actions:</h3>
            <b>
                <a href="new_book">New Book</a> &nbsp;
                <a href="user_form.jsp">New User</a> &nbsp;
                <a href="category_form.jsp">New Category</a> &nbsp;
                <a href="new_customer">New Customer</a>
            </b>
        </div>
    </div>

    <div class="row">&nbsp;</div>

    <div class="row">
        <div class="col text-center">
            <hr/>
            <h3>Recent Sales:</h3>
        </div>
    </div>

    <div class="row">
        <table class="table table-bordered table-striped table-hover table-responsive-sm">
            <thead class="thead-dark">
            <tr>
                <th>Order ID</th>
                <th>Ordered By</th>
                <th>Book Copies</th>
                <th>Total</th>
                <th>Payment Method</th>
                <th>Status</th>
                <th>Order Date</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${listMostRecentSales}" var="order" varStatus="status">
                <tr>
                    <td><a href="view_order?id=${order.orderId}">${order.orderId}</a></td>
                    <td>${order.customer.fullname}</td>
                    <td>${order.bookCopies}</td>
                    <td><fmt:formatNumber value="${order.total}" type="currency"/></td>
                    <td>${order.paymentMethod}</td>
                    <td>${order.status}</td>
                    <td>${order.orderDate}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="row">&nbsp;</div>

    <div class="row">
        <div class="col text-center">
            <hr/>
            <h3>Recent Reviews:</h3>
        </div>
    </div>

    <div class="row">
        <table class="table table-bordered table-striped table-hover table-responsive-sm">
            <thead class="thead-dark">
            <tr>
                <th>Book</th>
                <th>Rating</th>
                <th>Headline</th>
                <th>Customer</th>
                <th>Review On</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${listMostRecentReviews}" var="review">
                <tr>
                    <td>${review.book.title}</td>
                    <td>${review.rating}</td>
                    <td><a href="edit_review?id=${review.reviewId}">${review.headline}</a></td>
                    <td>${review.customer.fullname}</td>
                    <td>${review.reviewTime}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="row">&nbsp;</div>

    <div class="row">
        <div class="col text-center">
            <hr/>
            <h3>Statistics:</h3>
        </div>
    </div>

    <div class="row">
        <div class="col text-center">
            Total Users: ${totalUsers} &nbsp;&nbsp;&nbsp;&nbsp;
            Total Books: ${totalBooks} &nbsp;&nbsp;&nbsp;&nbsp;
            Total Customers: ${totalCustomers} &nbsp;&nbsp;&nbsp;&nbsp;
            Total Reviews: ${totalReviews} &nbsp;&nbsp;&nbsp;&nbsp;
            Total Orders: ${totalOrders}

            <hr/>
        </div>
    </div>
    <jsp:directive.include file="footer.jsp"/>
</div>
</body>
</html>