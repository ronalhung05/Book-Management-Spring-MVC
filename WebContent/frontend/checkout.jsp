<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Checkout"/>
</jsp:include>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp"/>

    <div class="row">&nbsp;</div>

    <c:if test="${message != null}">
        <div class="row">
            <div class="col text-center"><h4>${message}</h4></div>
        </div>
    </c:if>

    <c:set var="cart" value="${sessionScope['cart']}"/>

    <c:if test="${cart.totalItem == 0}">
        <div class="row">
            <div class="col text-center"><h4>There's no items in your cart</h4></div>
        </div>
    </c:if>

    <c:if test="${cart.totalItem > 0}">
        <div class="row">
            <div class="col-sm-2"></div>

            <div class="col-sm-8">
                <div class="card mt-4 mt-lg-0 shadow-sm">
                    <h5 class="px-6 py-4 bg-transparent mb-0">Order Details <a href="view_cart">Edit</a></h5>
                    <ul class="list-group list-group-flush">
                        <c:forEach items="${cart.items}" var="item" varStatus="status">
                            <li class="list-group-item px-4 py-3">
                                <div class="row align-items-center">
                                    <div class="col-2 col-md-2">
                                        <img src="data:image/jpg;base64,${item.key.base64Image}" alt="${item.key.title}"
                                             class="img-fluid">
                                    </div>
                                    <div class="col-5 col-md-5">
                                        <h6 class="mb-0">${item.key.title}</h6>
                                        <span><small class="text-muted">${item.key.author}</small></span>
                                    </div>
                                    <div class="col-2 col-md-2 text-center text-muted">
                                        <span>${item.value}</span>
                                    </div>
                                    <div class="col-3 text-lg-end text-start text-md-end col-md-3">
                                        <span class="fw-bold"><fmt:formatNumber value="${item.key.price}"
                                                                                type="currency"/></span>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>

                        <li class="list-group-item px-4 py-3">
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <div>
                                    Item Subtotal
                                </div>
                                <div class="fw-bold">
                                    <fmt:formatNumber value="${cart.totalAmount}" type="currency"/>
                                </div>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <div>
                                    Shipping Fee <i class="feather-icon icon-info text-muted" data-bs-toggle="tooltip"
                                                    aria-label="Default tooltip"
                                                    data-bs-original-title="Default tooltip"></i>
                                </div>
                                <div class="fw-bold">
                                    <fmt:formatNumber value="${shippingFee}" type="currency"/>
                                </div>
                            </div>
                            <div class="d-flex align-items-center justify-content-between">
                                <div>
                                    Tax <i class="feather-icon icon-info text-muted" data-bs-toggle="tooltip"
                                           aria-label="Default tooltip"
                                           data-bs-original-title="Default tooltip"></i>
                                </div>
                                <div class="fw-bold">
                                    <fmt:formatNumber value="${tax}" type="currency"/>
                                </div>
                            </div>
                        </li>

                        <li class="list-group-item px-4 py-3">
                            <div class="d-flex align-items-center justify-content-between fw-bold">
                                <div>
                                    Total
                                </div>
                                <div>
                                    <fmt:formatNumber value="${total}" type="currency"/>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>


                <div class="row">&nbsp;</div>

                <div class="card mt-4 mt-lg-0 shadow-sm">
                    <div class="card-header">
                        <h3 class="text-center">Recipient Information</h3>
                    </div>
                    <div class="card-body">
                        <form action="place_order" method="post">
                            <div class="mb-3 row">
                                <label for="firstname" class="col-sm-4 col-form-label">First Name:</label>
                                <div class="col-sm-8">
                                    <input type="text" name="firstname" id="firstname"
                                           value="${loggedCustomer.firstname}"
                                           required minlength="3" maxlength="30" class="form-control">
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="lastname" class="col-sm-4 col-form-label">Last Name:</label>
                                <div class="col-sm-8">
                                    <input type="text" name="lastname" id="lastname" value="${loggedCustomer.lastname}"
                                           required minlength="3" maxlength="30" class="form-control">
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="phone" class="col-sm-4 col-form-label">Phone:</label>
                                <div class="col-sm-8">
                                    <input type="text" name="phone" id="phone" value="${loggedCustomer.phone}"
                                           required minlength="9" maxlength="15" class="form-control">
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="address1" class="col-sm-4 col-form-label">Address Line 1:</label>
                                <div class="col-sm-8">
                                    <input type="text" name="address1" id="address1"
                                           value="${loggedCustomer.addressLine1}"
                                           required minlength="10" maxlength="256" class="form-control">
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="address2" class="col-sm-4 col-form-label">Address Line 2:</label>
                                <div class="col-sm-8">
                                    <input type="text" name="address2" id="address2"
                                           value="${loggedCustomer.addressLine2}"
                                           required minlength="10" maxlength="256" class="form-control">
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="city" class="col-sm-4 col-form-label">City:</label>
                                <div class="col-sm-8">
                                    <input type="text" name="city" id="city" value="${loggedCustomer.city}"
                                           required minlength="3" maxlength="32" class="form-control">
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="state" class="col-sm-4 col-form-label">State:</label>
                                <div class="col-sm-8">
                                    <input type="text" name="state" id="state" value="${loggedCustomer.state}"
                                           required minlength="3" maxlength="45" class="form-control">
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="zipcode" class="col-sm-4 col-form-label">Zip Code:</label>
                                <div class="col-sm-8">
                                    <input type="text" name="zipcode" id="zipcode" value="${loggedCustomer.zipcode}"
                                           required minlength="3" maxlength="24" class="form-control">
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="country" class="col-sm-4 col-form-label">Country:</label>
                                <div class="col-sm-8">
                                    <select name="country" id="country" required class="form-control">
                                        <c:forEach items="${mapCountries}" var="country">
                                            <option value="${country.value}"
                                                    <c:if test='${loggedCustomer.country eq country.value}'>selected='selected'</c:if>
                                            >${country.key}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col text-center"><h2>Payment:</h2></div>
                            </div>

                            <div class="mb-3 row">
                                <label for="paymentMethod" class="col-sm-4 col-form-label">Choose your payment
                                    method:</label>
                                <div class="col-sm-8">
                                    <select name="paymentMethod" id="paymentMethod" required class="form-control">
                                        <option value="Cash On Delivery">Cash On Delivery</option>
                                        <option value="paypal">PayPal or Credit card</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col text-center">
                                    <button type="submit" class="btn btn-primary">Place Order</button>
                                    &nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">Continue
                                        Shopping</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>


            </div>

            <div class="col-sm-2"></div>

        </div>
    </c:if>

    <jsp:directive.include file="footer.jsp"/>
</div>
</body>
</html>