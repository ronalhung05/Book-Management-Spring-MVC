<div class="main-wrapper">
    <nav class="navbar-vertical-nav d-none d-xl-block">
        <div class="navbar-vertical">
            <div class="px-4 py-5">
                <a href="${pageContext.request.contextPath}/admin/" class="navbar-brand">
                    <img src="../images/logo/freshcart-logo.svg" alt=""/>
                </a>
            </div>
            <div class="navbar-vertical-content flex-grow-1" data-simplebar="">
                <ul class="navbar-nav flex-column" id="sideNavbar">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/">
                            <div class="d-flex align-items-center">
										<span class="nav-link-icon">
											<i class="bi bi-house"></i
                                            ></span>
                                <span class="nav-link-text">Dashboard</span>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item mt-6 mb-3">
                        <span class="nav-label">Book Managements</span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="list_book">
                            <div class="d-flex align-items-center">
										<span class="nav-link-icon">
											<i class="bi bi-book"></i
                                            ></span>
                                <span class="nav-link-text">Books</span>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="list_category">
                            <div class="d-flex align-items-center">
										<span class="nav-link-icon">
											<i class="bi bi-list-task"></i
                                            ></span>
                                <span class="nav-link-text">Categories</span>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="list_order">
                            <div class="d-flex align-items-center">
										<span class="nav-link-icon">
											<i class="bi bi-cart"></i
                                            ></span>
                                <span class="nav-link-text">Orders</span>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="list_customer">
                            <div class="d-flex align-items-center">
										<span class="nav-link-icon">
											<i class="bi bi-people"></i
                                            ></span>
                                <span class="nav-link-text">Customers</span>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="list_review">
                            <div class="d-flex align-items-center">
										<span class="nav-link-icon">
											<i class="bi bi-star"></i
                                            ></span>
                                <span class="nav-link-text">Reviews</span>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="list_users">
                            <div class="d-flex align-items-center">
										<span class="nav-link-icon">
											<i class="bi bi-person-circle"></i
                                            ></span>
                                <span class="nav-link-text">Users</span>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <main class="main-content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-xl-12 col-12 mb-5">
                    <div class="card h-100 card-lg">
                        <div class="card-body p-6">
                            <div class="d-md-flex justify-content-between">
                                <div class="d-flex align-items-center mb-2 mb-md-0">
                                    <h2 class="mb-0">Order ID: #${order.orderId}</h2>
                                    <span class="badge bg-light-warning text-dark-warning ms-2">${order.status}</span>
                                </div>
                            </div>
                            <div class="mt-8">
                                <div class="row">
                                    <!-- address -->
                                    <div class="col-lg-4 col-md-4 col-12">
                                        <div class="mb-6">
                                            <h6>Customer Details</h6>
                                            <p class="mb-1 lh-lg">${order.firstname} ${order.lastname}<br>
                                                ${order.customer.email}<br>
                                                ${order.phone}</p>
                                        </div>
                                    </div>
                                    <!-- address -->
                                    <div class="col-lg-4 col-md-4 col-12">
                                        <div class="mb-6">
                                            <h6>Shipping Address</h6>
                                            <p class="mb-1 lh-lg">${order.firstname} ${order.lastname}<br>
                                                ${order.addressLine1} <br>
                                                ${order.state}, ${order.city}, ${order.country} <br>
                                                ${order.phone}</p>
                                        </div>
                                    </div>
                                    <!-- address -->
                                    <div class="col-lg-4 col-md-4 col-12">
                                        <div class="mb-6">
                                            <h6>Order Details</h6>
                                            <p class="mb-1 lh-lg">Order ID: <span
                                                    class="text-dark">${order.orderId}</span><br>
                                                Order Date: <span class="text-dark">
                                                <fmt:formatDate value="${order.orderDate}"
                                                                pattern="dd/MM/YYYY hh:mm:ss"/></span><br>
                                                Order Total: <span class="text-dark">
                                                <fmt:formatNumber type="currency" value="${order.total}"/>
                                                </span><br>
                                                Payment:
                                                <c:choose>
                                                    <c:when test="${order.paymentMethod == 'Paypal or Credit Card'}">
                                                        <span class="badge bg-light-info text-dark-info">Paypal</span>
                                                    </c:when>
                                                    <c:when test="${order.paymentMethod == 'Cash On Delivery'}">
                                                        <span class="badge bg-light-primary text-dark-primary">Cash on Delivery</span>
                                                    </c:when>
                                                </c:choose>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table id="orderTable"
                                               class="table mb-0 text-nowrap table-centered">
                                            <thead class="bg-light">
                                            <tr>
                                                <th>#</th>
                                                <th>Image</th>
                                                <th>Title</th>
                                                <th>Author</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th>Subtotal</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${order.orderDetails}" var="orderDetail"
                                                       varStatus="status">
                                                <tr>
                                                    <td>${status.index + 1}</td>
                                                    <td><img class="img-fluid"
                                                             src="data:image/jpg;base64,${orderDetail.book.base64Image}"
                                                             width="70"
                                                             height="110"/></td>
                                                    <td>${orderDetail.book.title}</td>
                                                    <td>${orderDetail.book.author}</td>
                                                    <td>
                                                        <input type="hidden" name="price"
                                                               value="${orderDetail.book.price}"/>
                                                            <fmt:formatNumber value="${orderDetail.book.price}"
                                                                              type="currency"/>
                                                    <td>
                                                    <td>${orderDetail.quantity}</td>
                                                    <td class="item-subtotal"><fmt:formatNumber
                                                            value="${orderDetail.subtotal}"
                                                            type="currency"/></td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td class="border-bottom-0 pb-0"></td>
                                                <td class="border-bottom-0 pb-0"></td>
                                                <td colspan="1" class="fw-medium text-dark">
                                                    <!-- text -->
                                                    Sub Total :
                                                </td>
                                                <td class="fw-medium text-dark">
                                                    <!-- text -->
                                                    <fmt:formatNumber value="${order.subtotal}" type="currency"/>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 float-md-right">
                                            <div class="total-order">
                                                <ul>
                                                    <li>
                                                        <h4>Tax</h4>
                                                        <input type="hidden" name="tax" id="tax"
                                                               value="${order.tax}"/>
                                                        <h5><fmt:formatNumber value="${order.tax}"
                                                                              type="currency"/></h5>
                                                    </li>
                                                    <li>
                                                        <h4>Shipping</h4>
                                                        <input type="hidden" name="shippingFee"
                                                               id="shippingFee"
                                                               value="${order.shippingFee}"/>
                                                        <h5><fmt:formatNumber value="${order.shippingFee}"
                                                                              type="currency"/></h5>
                                                    </li>
                                                    <li class="total">
                                                        <h4>Grand Total</h4>
                                                        <h5><fmt:formatNumber value="${order.total}"
                                                                              type="currency"/></h5>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <a href="edit_order?id=${order.orderId}" class="btn btn-primary me-2">Edit</a>
                                <a href="javascript:void(0);" class="btn btn-secondary ml-2"
                                   id="${order.orderId}">Delete</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<%--<div align="center">--%>
<%--    <h2>Order Overview:</h2>--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <td><b>Ordered By: </b></td>--%>
<%--            <td>${order.customer.fullname}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><b>Payment Method: </b></td>--%>
<%--            <td>${order.paymentMethod}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><b>Book Copies: </b></td>--%>
<%--            <td>${order.bookCopies}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><b>Total Amount: </b></td>--%>
<%--            <td><fmt:formatNumber value="${order.total}" type="currency"/></td>--%>
<%--        </tr>--%>
<%--    </table>--%>

<%--    <h2>Recipient Information</h2>--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <td><b>Firstname: </b></td>--%>
<%--            <td>${order.firstname}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><b>Lastname: </b></td>--%>
<%--            <td>${order.lastname}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><b>Phone: </b></td>--%>
<%--            <td>${order.phone}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><b>Address Line 1: </b></td>--%>
<%--            <td>${order.addressLine1}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><b>Address Line 2: </b></td>--%>
<%--            <td>${order.addressLine2}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><b>City: </b></td>--%>
<%--            <td>${order.city}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><b>State: </b></td>--%>
<%--            <td>${order.state}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><b>Country: </b></td>--%>
<%--            <td>${order.countryName}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><b>Zipcode: </b></td>--%>
<%--            <td>${order.zipcode}</td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</div>--%>
<%--<div align="center">--%>
<%--    <h2>Ordered Book: </h2>--%>
<%--    <table border="1">--%>
<%--        <tr>--%>
<%--            <th>Index</th>--%>
<%--            <th>Book Title</th>--%>
<%--            <th>Author</th>--%>
<%--            <th>Price</th>--%>
<%--            <th>Quantity</th>--%>
<%--            <th>Subtotal</th>--%>
<%--        </tr>--%>
<%--        <c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="status">--%>
<%--            <tr>--%>
<%--                <td>${status.index + 1}</td>--%>
<%--                <td>--%>
<%--                    <img style="vertical-align: middle" src="data:image/jpg;base64,${orderDetail.book.base64Image}"--%>
<%--                         width="48" height="64"/>--%>
<%--                        ${orderDetail.book.title}--%>
<%--                </td>--%>
<%--                <td>${orderDetail.book.author}</td>--%>
<%--                <td><fmt:formatNumber value="${orderDetail.book.price}" type="currency"/></td>--%>
<%--                <td>${orderDetail.quantity}</td>--%>
<%--                <td><fmt:formatNumber value="${orderDetail.subtotal}" type="currency"/></td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--        <tr>--%>
<%--            <td colspan="6" align="right">--%>
<%--                <p> Subtotal: <fmt:formatNumber value="${order.subtotal}" type="currency"/></p>--%>
<%--                <p> Tax: <fmt:formatNumber value="${order.tax}" type="currency"/></p>--%>
<%--                <p> Shipping Fee: <fmt:formatNumber value="${order.shippingFee}" type="currency"/></p>--%>
<%--                <p> TOTAL: <fmt:formatNumber value="${order.total}" type="currency"/></p>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</div>--%>