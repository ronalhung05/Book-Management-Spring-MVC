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
        <div class="row">
            <div class="col-lg-6 col-12 mb-6">
                <!-- card -->
                <div class="card h-100 card-lg">
                    <div class="card-body p-6">
                        <!-- heading -->
                        <div class="d-flex justify-content-between">
                            <div>
                                <h3 class="mb-1 fs-5">Earnings</h3>
                            </div>
                        </div>
                        <div id="donut-chart"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-12 mb-6">
                <!-- card -->
                <div class="card h-100 card-lg">
                    <!-- card body -->
                    <div class="card-body p-6">
                        <!-- heading -->
                        <h3 class="mb-0 fs-5">Statics</h3>
                    </div>
                    <div id="bar-chart"></div>
                </div>
            </div>
        </div>
    </div>
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
                    <td><c:choose>
                        <c:when test="${order.paymentMethod == 'paypal'}">
                            <img src="../images/payment/paypal.svg" alt="Paypal"/>
                        </c:when>
                        <c:otherwise>
                            ${order.paymentMethod}
                        </c:otherwise>
                    </c:choose></td>
                    <td><c:choose>
                        <c:when test="${order.status == 'Processing'}">
                            <span class="badge bg-info text-dark">Processing</span>
                        </c:when>
                        <c:when test="${order.status == 'Shipping'}">
                            <span class="badge bg-warning text-dark">Shipping</span>
                        </c:when>
                        <c:when test="${order.status == 'Delivered'}">
                            <span class="badge bg-secondary text-dark">Delivered</span>
                        </c:when>
                        <c:when test="${order.status == 'Completed'}">
                            <span class="badge bg-success text-dark">Completed</span>
                        </c:when>
                        <c:when test="${order.status == 'Canceled'}">
                            <span class="badge bg-danger text-dark">Canceled</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge bg-light text-dark">Unknown Status</span>
                        </c:otherwise>
                    </c:choose></td>
                    <td>${order.orderDate}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
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
                    <td><c:set var="maxStars" value="5"/>
                        <c:forEach var="i" begin="1" end="${maxStars}">
                            <c:choose>
                                <c:when test="${i <= review.rating}">
                                    <span><i class="bi bi-star-fill text-warning"></i></span>
                                </c:when>
                                <c:otherwise>
                                    <span><i class="bi bi-star-fill text-light"></i></span>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach></td>
                    <td><a href="edit_review?id=${review.reviewId}">${review.headline}</a></td>
                    <td>${review.customer.fullname}</td>
                    <td>${review.reviewTime}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>
<jsp:directive.include file="footer.jsp"/>
<script>
    const donutChartOptions = {
        chart: {
            type: 'donut',
        },
        series: [${earnings}, ${tax}, ${shippingFee}],
        labels: ['Earnings', 'Tax', 'ShippingFee'],
        plotOptions: {
            pie: {
                donut: {
                    labels: {
                        show: true,
                        total: {
                            show: true,
                            label: 'Total',
                            // Định dạng hiển thị giá trị tổng
                            formatter: function (w) {
                                return '$' + w.globals.seriesTotals.reduce((a, b) => {
                                    return a + b;
                                }, 0);
                            }
                        }
                    }
                }
            }
        },
        tooltip: {
            y: {
                formatter: function (value) {
                    return '$' + value;
                }
            }
        },
        colors: ['#0aad0a', '#ffc107', '#db3030', '#016bf8', '#198754']
    };

    const donutChart = new ApexCharts(document.querySelector("#donut-chart"), donutChartOptions);
    donutChart.render();

    const barChartOptions = {
        chart: {
            type: 'bar',
            height: 350
        },
        series: [{
            name: 'Count',
            data: [${totalUsers}, ${totalBooks}, ${totalCustomers}, ${totalReviews}, ${totalOrders}]
        }],
        xaxis: {
            categories: ['User', 'Book', 'Customer', 'Review', 'Order']
        },
        fill: {
            opacity: 1
        },
        plotOptions: {
            bar: {
                distributed: true
            }
        },
        colors: ['#0aad0a', '#ffc107', '#db3030', '#016bf8', '#198754']// quy định màu sắc cho từng cột
    };

    const barChart = new ApexCharts(document.querySelector("#bar-chart"), barChartOptions);
    barChart.render();
</script>
</body>
</html>