<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Your Shopping Cart Details</title>
    <link rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>

</head>
<body>
<jsp:directive.include file="header.jsp"/>
<div align="center">
    <h2>Your Shopping Cart Details</h2>

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
            <form action="update_cart" method="post" name="cartForm">
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
                            <td>
                                <img class="book_small" src="data:image/jpg;base64,${items.key.base64Image}"/></td>
                            <td>
                                <span id="book-title">${items.key.title}</span>
                            </td>
                            <td>
                                <input type="hidden" name="bookId" value="${items.key.bookId}"/>
                                <input type="number" name="quantity${status.index + 1}" value="${items.value}"
                                       class="form-control" style="max-width: 50px" size="5" required step="1" min="1"/>
                            </td>
                            <td>
                                <fmt:setLocale value="en_US"/>
                                <fmt:formatNumber value="${items.key.price}" type="currency"/></td>
                            <td><fmt:formatNumber value="${items.value * items.key.price}" type="currency"/></td>
                            <td><a href="remove_from_cart?book_id=${items.key.bookId}">Remove</a></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><b>${cart.totalQuantity} book(s)</b></td>
                        <td>Total</td>
                        <td colspan="2"><fmt:formatNumber value="${cart.totalAmount}" type="currency"/></td>
                    </tr>
                </table>
                <div>
                    <table class="normal">
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <button type="submit">Update</button>
                            </td>
                            <td>
                                <input type="button" id="clearCart" value="Clear Cart"/>
                            </td>
                            <td><a href="${pageContext.request.contextPath}/">Continue Shopping</a></td>
                            <td><a href="checkout">Checkout</a></td>
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
        $("#clearCart").click(function () {
            window.location = 'clear_cart';
        });
    });
</script>

</body>
</html>