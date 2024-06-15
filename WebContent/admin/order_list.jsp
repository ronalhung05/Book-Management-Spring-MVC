<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Manage Orders"/>
</jsp:include>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp"/>

    <div class="row">&nbsp;</div>

    <div class="row">
        <div class="col text-center">
            <h3>Book Orders Management</h3>
        </div>
    </div>

    <div class="row">&nbsp;</div>

    <c:if test="${message != null}">
        <c:choose>
            <c:when test="${alertType == 'success'}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong><i class="fas fa-check-circle"></i> Success!</strong> ${message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    <strong><i class="fas fa-exclamation-triangle"></i> Warning!</strong> ${message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:otherwise>
        </c:choose>
    </c:if>

    <div class="row">
        <div class="table-responsive">
            <table id="orderTable"
                   class="table table-centered table-hover mb-0 text-nowrap ">
                <thead class="thead-dark">
                <tr>
                    <th>Index</th>
                    <th>Order ID</th>
                    <th>Ordered by</th>
                    <th>Book Copies</th>
                    <th>Total</th>
                    <th>Payment method</th>
                    <th>Status</th>
                    <th>Order Date</th>
                    <th>Actions</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="order" items="${listOrder}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${order.orderId}</td>
                        <td>${order.customer.fullname}</td>
                        <td>${order.bookCopies}</td>
                        <td><fmt:formatNumber value="${order.total}" type="currency"/></td>

                        <td>
                            <c:choose>
                                <c:when test="${order.paymentMethod == 'paypal'}">
                                    <img src="../images/payment/paypal.svg" alt="Paypal"/>
                                </c:when>
                                <c:otherwise>
                                    ${order.paymentMethod}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${order.status == 'Processing'}">
                                    <span class="badge bg-light-info text-dark-info">Processing</span>
                                </c:when>
                                <c:when test="${order.status == 'Shipping'}">
                                    <span class="badge bg-light-warning text-dark-warning">Shipping</span>
                                </c:when>
                                <c:when test="${order.status == 'Delivered'}">
                                    <span class="badge bg-light-secondary text-dark">Delivered</span>
                                </c:when>
                                <c:when test="${order.status == 'Completed'}">
                                    <span class="badge bg-light-primary text-dark-primary">Completed</span>
                                </c:when>
                                <c:when test="${order.status == 'Cancelled'}">
                                    <span class="badge bg-light-danger text-dark-danger">Canceled</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-light text-dark">Unknown Status</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${order.orderDate}</td>
                        <td>
                            <a href="view_order?id=${order.orderId}" class="text-secondary"><i
                                    class="bi bi-eye-fill"></i></a> &nbsp;
                            <a href="edit_order?id=${order.orderId}" class="text-muted"><i
                                    class="bi bi-pencil-square"></i></a> &nbsp;
                            <a href="javascript:void(0);" class="deleteLink text-danger" id="${order.orderId}"><i
                                    class="bi bi-trash"></i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<jsp:directive.include file="footer.jsp"/>
<script>
    new DataTable('#orderTable');
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