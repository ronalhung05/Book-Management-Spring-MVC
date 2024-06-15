<div class="container my-4">
    <div class="row">
        <div class="col-lg-8 offset-lg-2">
            <!-- Order Overview -->
            <div class="card mb-4">
                <div class="card-header bg-primary text-white text-center">
                    <h3>Order Overview</h3>
                </div>
                <div class="card-body">
                    <!-- Ordered By -->
                    <div class="row mb-2">
                        <div class="col-4"><b>Ordered By:</b></div>
                        <div class="col-8">${order.customer.fullname}</div>
                    </div>
                    <!-- Order Status -->
                    <div class="row mb-2">
                        <div class="col-4"><b>Order Status:</b></div>
                        <div class="col-8">${order.status}</div>
                    </div>
                    <!-- Order Date -->
                    <div class="row mb-2">
                        <div class="col-4"><b>Order Date:</b></div>
                        <div class="col-8">${order.orderDate}</div>
                    </div>
                    <!-- Payment Method -->
                    <div class="row mb-2">
                        <div class="col-4"><b>Payment Method:</b></div>
                        <div class="col-8">${order.paymentMethod}</div>
                    </div>
                    <!-- Book Copies -->
                    <div class="row mb-2">
                        <div class="col-4"><b>Book Copies:</b></div>
                        <div class="col-8">${order.bookCopies}</div>
                    </div>
                    <!-- Total Amount -->
                    <div class="row">
                        <div class="col-4"><b>Total Amount:</b></div>
                        <div class="col-8"><fmt:formatNumber value="${order.total}" type="currency"/></div>
                    </div>
                </div>
            </div>

            <!-- Recipient Information -->
            <div class="card mb-4 shadow">
                <div class="card-header bg-info text-white text-center rounded-top">
                    <h3>Recipient Information</h3>
                </div>
                <div class="card-body">
                    <div class="container">
                        <div class="row mb-3">
                            <div class="col-md-4"><strong>First Name:</strong></div>
                            <div class="col-md-8">${order.firstname}</div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-4"><strong>Last Name:</strong></div>
                            <div class="col-md-8">${order.lastname}</div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-4"><strong>Phone:</strong></div>
                            <div class="col-md-8">${order.phone}</div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-4"><strong>Address Line 1:</strong></div>
                            <div class="col-md-8">${order.addressLine1}</div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-4"><strong>Address Line 2:</strong></div>
                            <div class="col-md-8">${order.addressLine2}</div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-4"><strong>City:</strong></div>
                            <div class="col-md-8">${order.city}</div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-4"><strong>State:</strong></div>
                            <div class="col-md-8">${order.state}</div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-4"><strong>Country:</strong></div>
                            <div class="col-md-8">${order.countryName}</div>
                        </div>
                        <div class="row">
                            <div class="col-md-4"><strong>Zipcode:</strong></div>
                            <div class="col-md-8">${order.zipcode}</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Ordered Books -->
            <div class="card mb-4">
                <div class="card-header bg-warning text-white text-center">
                    <h3>Ordered Books</h3>
                </div>
                <div class="card-body">
                    <c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="status">
                        <div class="row mb-3 align-items-center">
                            <div class="col-sm-1">${status.index + 1}</div>
                            <div class="col-sm-3"><img class="img-fluid"
                                                       src="data:image/jpg;base64,${orderDetail.book.base64Image}"/>
                            </div>
                            <div class="col-sm-8">
                                <h6>${orderDetail.book.title}</h6>
                                <div>by <i>${orderDetail.book.author}</i></div>
                                <div><fmt:formatNumber value="${orderDetail.book.price}" type="currency"/>
                                    X ${orderDetail.quantity} = <b><fmt:formatNumber value="${orderDetail.subtotal}"
                                                                                     type="currency"/></b></div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- Summary -->
            <div class="card">
                <div class="card-header bg-success text-white text-center">
                    <h3>Summary</h3>
                </div>
                <div class="card-body text-center">
                    <p>Subtotal: <fmt:formatNumber value="${order.subtotal}" type="currency"/></p>
                    <p>Tax: <fmt:formatNumber value="${order.tax}" type="currency"/></p>
                    <p>Shipping Fee: <fmt:formatNumber value="${order.shippingFee}" type="currency"/></p>
                    <p><b>TOTAL: <fmt:formatNumber value="${order.total}" type="currency"/></b></p>
                </div>
            </div>
        </div>
    </div>
</div>