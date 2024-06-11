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
                <div class="card">
                    <div class="card-header">
                        <div class="text-center"><h3>Review Your Order Details <a href="view_cart">Edit</a></h3></div>
                    </div>
                    <div class="card-body">
                        <div>
                            <c:forEach items="${cart.items}" var="item" varStatus="status">
                                <div class="row">
                                    <div class="col-sm">${status.index + 1}</div>
                                    <div class="col-5"><img width="128" height="164"
                                                            src="data:image/jpg;base64,${item.key.base64Image}"/></div>
                                    <div class="col-6">
                                        <div><h6>${item.key.title}</h6></div>
                                        <div>by <i>${item.key.author}</i></div>
                                        <div><fmt:formatNumber value="${item.key.price}" type="currency"/></div>
                                        <div>
                                            X <input type="text" name="quantity${status.index + 1}"
                                                     value="${item.value}" size="5" readonly="readonly"/>
                                        </div>
                                        <div>= <b><fmt:formatNumber value="${item.value * item.key.price}"
                                                                    type="currency"/></b></div>
                                    </div>
                                </div>
                                <div class="row">&nbsp;</div>
                            </c:forEach>

                            <div class="row">
                                <div class="col text-center">
                                    <p>Number of copies: ${cart.totalQuantity}</p>
                                    <p>Subtotal: <fmt:formatNumber value="${cart.totalAmount}" type="currency"/></p>
                                    <p>Tax: <fmt:formatNumber value="${tax}" type="currency"/></p>
                                    <p>Shipping Fee: <fmt:formatNumber value="${shippingFee}" type="currency"/></p>
                                    <p>TOTAL: <fmt:formatNumber value="${total}" type="currency"/></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">&nbsp;</div>

                <div class="card">
                    <div class="card-header">
                        <div class="text-center"><h3>Recipient Information</h3></div>
                    </div>
                </div>
                <div class="card-body">
                    <form action="place_order" method="post">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">First Name:</label>
                            <div class="col-sm-8"><input type="text" name="firstname"
                                                         value="${loggedCustomer.firstname}" required minlength="3"
                                                         maxlength="30" class="form-control"/></div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Last Name:</label>
                            <div class="col-sm-8"><input type="text" name="lastname" value="${loggedCustomer.lastname}"
                                                         required minlength="3" maxlength="30" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Phone:</label>
                            <div class="col-sm-8"><input type="text" name="phone" value="${loggedCustomer.phone}"
                                                         required minlength="9" maxlength="15" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Address Line 1:</label>
                            <div class="col-sm-8"><input type="text" name="address1"
                                                         value="${loggedCustomer.addressLine1}" required minlength="10"
                                                         maxlength="256" class="form-control"/></div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Address Line 2:</label>
                            <div class="col-sm-8"><input type="text" name="address2"
                                                         value="${loggedCustomer.addressLine2}" required minlength="10"
                                                         maxlength="256" class="form-control"/></div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">City:</label>
                            <div class="col-sm-8"><input type="text" name="city" value="${loggedCustomer.city}" required
                                                         minlength="3" maxlength="32" class="form-control"/></div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">State:</label>
                            <div class="col-sm-8"><input type="text" name="state" value="${loggedCustomer.state}"
                                                         required minlength="3" maxlength="45" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Zip Code:</label>
                            <div class="col-sm-8"><input type="text" name="zipcode" value="${loggedCustomer.zipcode}"
                                                         required minlength="3" maxlength="24" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Country:</label>
                            <div class="col-sm-8">
                                <select name="country" required class="form-control">
                                    <c:forEach items="${mapCountries}" var="country">
                                        <option value="${country.value}"
                                                <c:if test='${loggedCustomer.country eq country.value}'>selected='selected'</c:if> >${country.key}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col text-center"><h2>Payment:</h2></div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Choose your payment method:</label>
                            <div class="col-sm-8">
                                <select name="paymentMethod" required class="form-control">
                                    <option value="Cash On Delivery">Cash On Delivery</option>
                                    <option value="paypal">PayPal or Credit card</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-center">
                                <button type="submit" class="btn btn-primary">Place Order</button>
                                &nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/">Continue Shopping</a>
                            </div>
                        </div>
                    </form>
                </div>


            </div>

            <div class="col-sm-2"></div>

        </div>
    </c:if>

    <jsp:directive.include file="footer.jsp"/>
</div>
</body>
</html>