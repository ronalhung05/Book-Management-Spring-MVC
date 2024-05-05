<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Checkout - Online Book Store</title>
    <link rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>

</head>
<body>
<jsp:directive.include file="header.jsp"/>
<div align="center">
    <c:if test="${message != null}">
        <div align="center">
            <h4 class="message">${message}</h4>
        </div>
    </c:if>
    <c:set var="cart" value="${sessionScope['cart']}"/>

    <c:if test="${cart.totalItem == 0}">
        <h2>There is no item in your cart</h2>
    </c:if>
    <c:if test="${cart.totalItem > 0}">
        <div>
            <h2>
                Review your order details <a href="view_cart">Edit</a>
            </h2>
            <table border="1">
                <tr>
                    <th>No</th>
                    <th colspan="2" align="center">Book</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Subtotal</th>
                </tr>
                <c:forEach items="${cart.items}" var="items" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td><img class="book_small"
                                 src="data:image/jpg;base64,${items.key.base64Image}"/></td>
                        <td><span id="book-title">${items.key.title}</span></td>
                        <td>${items.key.author}</td>

                        <td><input type="hidden" name="bookId"
                                   value="${items.key.bookId}"/>
                            <input type="number"
                                   name="quantity${status.index + 1}"
                                   value="${items.value}"
                                   class="form-control" style="max-width: 50px"
                                   size="5" required
                                   step="1" min="1" readonly="readonly"/></td>
                        <td><fmt:setLocale value="en_US"/> <fmt:formatNumber
                                value="${items.key.price}" type="currency"/></td>
                        <td><fmt:formatNumber
                                value="${items.value * items.key.price}" type="currency"/></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><b>${cart.totalQuantity} book(s)</b></td>
                    <td>Total</td>
                    <td colspan="2"><fmt:formatNumber value="${cart.totalAmount}"
                                                      type="currency"/></td>
                </tr>
            </table>
            <h2>Your Shipping Information</h2>
            <form id="orderForm" action="place_order" method="post">
                <table>
                    <tr>
                        <td>Recipient Name:</td>
                        <td><input type="text" name="recipientName" value="${loggedCustomer.fullname}"></td>
                    </tr>
                    <tr>
                        <td>Recipient Phone:</td>
                        <td><input type="text" name="recipientPhone" value="${loggedCustomer.phone}"></td>
                    </tr>
                    <tr>
                        <td>Street Address :</td>
                        <td><input type="text" name="address" value="${loggedCustomer.address}"></td>
                    </tr>
                    <tr>
                        <td>City :</td>
                        <td><input type="text" name="city" value="${loggedCustomer.city}"></td>
                    </tr>
                    <tr>
                        <td>Zip Code :</td>
                        <td><input type="text" name="zipcode" value="${loggedCustomer.zipcode}"></td>
                    </tr>
                    <tr>
                        <td>Country :</td>
                        <td><input type="text" name="country" value="${loggedCustomer.country}"></td>
                    </tr>

                </table>
                <div>
                    <h2>Payment</h2>
                    Choose your payment method:
                    &nbsp;&nbsp;
                    <select name="paymentMethod">
                        <option value="Cash on Delivery"> Cash on Delivery</option>
                    </select>
                </div>

                <div>
                    <table class="normal">
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <button type="submit">Place Order</button>
                            </td>
                            <td><a href="${pageContext.request.contextPath}/">Continue Shopping</a></td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </c:if>
</div>
<jsp:directive.include file="footer.jsp"/>
<script type="text/javascript">
    $(document).ready(function () {
        $("#orderForm").validate({
            rules: {
                recipientName: "required",
                recipientPhone: "required",
                address: "required",
                city: "required",
                zipcode: "required",
                country: "required",
            },
            messages: {
                recipientName: "Please enter recipient name",
                recipientPhone: "Please enter recipient phone",
                address: "Please enter street address",
                city: "Please enter city",
                zipcode: "Please enter zip code",
                country: "Please enter country",
            }
        });

    });
</script>

</body>
</html>