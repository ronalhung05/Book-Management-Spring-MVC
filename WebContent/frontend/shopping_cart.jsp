<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Your Shopping Cart"/>
</jsp:include>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp"/>

    <div>&nbsp;</div>

    <div class="row">
        <div class="col text-center"><h2>Your Cart Details</h2></div>
    </div>

    <c:if test="${message != null}">
        <div class="col text-center"><h4>${message}</h4></div>
    </c:if>

    <c:set var="cart" value="${sessionScope['cart']}"/>

    <c:if test="${cart.totalItem == 0}">
        <div class="row">
            <div class="col text-center"><h4>There's no items in your cart</h4></div>
        </div>
    </c:if>

    <c:if test="${cart.totalItem > 0}">
        <form action="update_cart" method="post" style="max-width: 600px; margin: 0 auto">
            <c:forEach items="${cart.items}" var="item" varStatus="status">
                <div class="row border rounded p-1">
                    <div class="col-sm">
                        <div>${status.index + 1}</div>
                    </div>

                    <div class="col-5">
                        <img class="img-fluid" src="data:image/jpg;base64,${item.key.base64Image}"/>
                    </div>

                    <div class="col-6">
                        <div><h5>${item.key.title}</h5></div>

                        <div>
                            <div class="input-group input-spinner">
                                <input type="hidden" name="bookId" value="${item.key.bookId}"/>
                                <input type="button" value="-" class="button-minus btn btn-sm" data-field="quantity${status.index + 1}">
                                <input type="number" step="1" max="50" value="${item.value}" name="quantity${status.index + 1}"
                                       class="quantity-field form-control-sm form-input" min="1" required>
                                <input type="button" value="+" class="button-plus btn btn-sm" data-field="quantity${status.index + 1}">
                            </div>
                        </div>

                        <div>
                            X <fmt:formatNumber value="${item.key.price}" type="currency"/>
                        </div>

                        <div>
                            = <span class="h5"><fmt:formatNumber value="${item.value * item.key.price}"
                                                                 type="currency"/></span>
                        </div>

                        <div>
                            <a href="remove_from_cart?book_id=${item.key.bookId}"><span
                                    class="me-1 align-text-bottom">
                          <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                               stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                               class="feather feather-trash-2 text-success">
                            <polyline points="3 6 5 6 21 6"></polyline>
                            <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                            </path>
                            <line x1="10" y1="11" x2="10" y2="17"></line>
                            <line x1="14" y1="11" x2="14" y2="17"></line>
                          </svg></span><span class="text-muted">Remove</span></a>
                        </div>
                    </div>
                </div>
                <div class="row">&nbsp;</div>
            </c:forEach>

            <div class="row">
                <div class="col-12 text-center">
                    <b>${cart.totalQuantity} book(s)</b>
                    &nbsp;&nbsp;
                    <span class="h4">Total: <fmt:formatNumber value="${cart.totalAmount}" type="currency"/></span>
                </div>
            </div>

            <div class="row">&nbsp;</div>

            <div class="row">
                <div class="col-12 text-center">
                    <button type="submit" class="btn btn-primary">Update</button>
                    &nbsp;&nbsp;
                    <input type="button" class="btn btn-dark" id="clearCart" value="Clear Cart"/>
                    &nbsp;
                    <a class="btn btn-light" href="${pageContext.request.contextPath}/">Continue Shopping</a>
                    &nbsp;&nbsp;
                    <a href="checkout" class="btn btn-success">Checkout</a>
                </div>
            </div>

        </form>
    </c:if>

    <jsp:directive.include file="footer.jsp"/>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $("#clearCart").click(function () {
            window.location = 'clear_cart';
        });
    });
    ocument.addEventListener('DOMContentLoaded', function() {
        // Lấy tất cả các nhóm input-spinner
        var spinners = document.querySelectorAll('.input-spinner');

        spinners.forEach(function(spinner) {
            // Lấy các nút và trường input bên trong mỗi nhóm
            var buttonMinus = spinner.querySelector('.button-minus');
            var buttonPlus = spinner.querySelector('.button-plus');
            var input = spinner.querySelector('input[type="number"]');

            // Chuyển đổi giá trị thành số nguyên an toàn
            var safeParseInt = function(value, defaultValue) {
                var parsed = parseInt(value, 10);
                return isNaN(parsed) ? defaultValue : parsed;
            };

            // Xử lý sự kiện khi nhấn nút "-"
            buttonMinus.addEventListener('click', function(event) {
                event.preventDefault(); // Chặn sự kiện mặc định
                var value = safeParseInt(input.value, 1);
                var minValue = safeParseInt(input.min, 1);
                if (value > minValue) {
                    input.value = value - 1;
                    input.dispatchEvent(new Event('change'));
                }
            });

            // Xử lý sự kiện khi nhấn nút "+"
            buttonPlus.addEventListener('click', function(event) {
                event.preventDefault(); // Chặn sự kiện mặc định
                var value = safeParseInt(input.value, 1);
                var maxValue = safeParseInt(input.max, Infinity);
                if (value < maxValue) {
                    input.value = value + 1;
                    input.dispatchEvent(new Event('change'));
                }
            });
        });
    });

</script>
</body>
</html>