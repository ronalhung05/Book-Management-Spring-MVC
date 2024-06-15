<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Edit Order"/>
</jsp:include>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp"/>

    <div class="row">&nbsp;</div>

    <div class="row">
        <div class="col text-center">
            <h3>Edit Order ID: ${order.orderId}</h3>
        </div>
    </div>

    <div class="row">&nbsp;</div>

    <c:if test="${message != null}">
        <div class="row">
            <div class="col text-center">
                <h4 class="message">${message}</h4>
            </div>
        </div>
    </c:if>

    <form action="update_order" method="post">
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <div class="card">
                    <div class="card-header">
                        <div class="text-center"><h3>Order Overview:</h3></div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col"><b>Ordered By: </b></div>
                            <div class="col">${order.customer.fullname}</div>
                        </div>
                        <div class="row">
                            <div class="col"><b>Order Date: </b></div>
                            <div class="col">${order.orderDate}</div>
                        </div>
                        <div class="row">&nbsp;</div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Payment Method:</label>
                            <div class="col-sm-8">
                                <select name="paymentMethod" class="form-control">
                                    <option value="Cash On Delivery"
                                            <c:if test="${order.paymentMethod eq 'Cash On Delivery'}">selected='selected'</c:if>>
                                        Cash On Delivery
                                    </option>
                                    <option value="paypal"
                                            <c:if test="${order.paymentMethod eq 'paypal'}">selected='selected'</c:if>>
                                        PayPal or Credit card
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Order Status:</label>
                            <div class="col-sm-8">
                                <select name="orderStatus" class="form-control">
                                    <option value="Processing"
                                            <c:if test="${order.status eq 'Processing' }">selected='selected'</c:if> >
                                        Processing
                                    </option>
                                    <option value="Shipping"
                                            <c:if test="${order.status eq 'Shipping' }">selected='selected'</c:if>>
                                        Shipping
                                    </option>
                                    <option value="Delivered"
                                            <c:if test="${order.status eq 'Delivered' }">selected='selected'</c:if>>
                                        Delivered
                                    </option>
                                    <option value="Completed"
                                            <c:if test="${order.status eq 'Completed' }">selected='selected'</c:if>>
                                        Completed
                                    </option>
                                    <option value="Cancelled"
                                            <c:if test="${order.status eq 'Cancelled' }">selected='selected'</c:if>>
                                        Cancelled
                                    </option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-2"></div>
        </div>

        <div class="row">&nbsp;</div>

        <div class="row my-3">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <div class="card">
                    <div class="card-header text-center">
                        <h3>Recipient Information</h3>
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">First Name:</label>
                            <div class="col-sm-8">
                                <input type="text" name="firstname" value="${order.firstname}" class="form-control"
                                       required minlength="3" maxlength="30"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Last Name:</label>
                            <div class="col-sm-8">
                                <input type="text" name="lastname" value="${order.lastname}" class="form-control"
                                       required minlength="3" maxlength="30"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Phone:</label>
                            <div class="col-sm-8">
                                <input type="text" name="phone" value="${order.phone}" class="form-control" required
                                       minlength="9" maxlength="15"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Address Line 1:</label>
                            <div class="col-sm-8">
                                <input type="text" name="address1" value="${order.addressLine1}" class="form-control"
                                       required minlength="10" maxlength="256"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Address Line 2:</label>
                            <div class="col-sm-8">
                                <input type="text" name="address2" value="${order.addressLine2}" class="form-control"
                                       required minlength="10" maxlength="256"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">City:</label>
                            <div class="col-sm-8">
                                <input type="text" name="city" value="${order.city}" class="form-control" required
                                       minlength="3" maxlength="32"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">State:</label>
                            <div class="col-sm-8">
                                <input type="text" name="state" value="${order.state}" class="form-control" required
                                       minlength="3" maxlength="45"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Zipcode:</label>
                            <div class="col-sm-8">
                                <input type="text" name="zipcode" value="${order.zipcode}" class="form-control" required
                                       minlength="3" maxlength="24"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Country:</label>
                            <div class="col-sm-8">
                                <select name="country" class="form-control" required>
                                    <c:forEach items="${mapCountries}" var="country">
                                        <option value="${country.value}"
                                                <c:if test='${order.country eq country.value}'>selected</c:if>>${country.key}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-2"></div>
        </div>

        <div class="row">&nbsp;</div>

        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <div class="card">
                    <div class="card-header">
                        <div class="text-center"><h3>Ordered Books:</h3></div>
                    </div>
                    <div class="card-body">
                        <c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="status">
                            <div class="row border rounded p-1">
                                <div class="col-sm">
                                    <div>${status.index + 1}</div>
                                </div>

                                <div class="col-5">
                                    <img class="img-fluid" src="data:image/jpg;base64,${orderDetail.book.base64Image}"/>
                                </div>

                                <div class="col-6">
                                    <div>
                                        <h5>${orderDetail.book.title}</h5>
                                        <h6>${orderDetail.book.author}</h6>
                                    </div>

                                    <div>
                                        <input type="hidden" name="bookId" value="${orderDetail.book.bookId}"/>
                                        <input type="number" id="quantity${status.index + 1}"
                                               name="quantity${status.index + 1}"
                                               value="${orderDetail.quantity}" class="form-control quantity"
                                               size="5" step="1" min="1" required data-price="${orderDetail.book.price}"
                                               oninput="updateOrderSummary()"/>
                                    </div>

                                    <div>
                                        X
                                        <input type="hidden" name="price" value="${orderDetail.book.price}"/>
                                        <span class="book-price"><fmt:formatNumber value="${orderDetail.book.price}"
                                                                                   type="currency"/></span>
                                    </div>

                                    <div>
                                        = <span class="h5 subtotal per-book-subtotal"><fmt:formatNumber
                                            value="${orderDetail.subtotal}" type="currency"/></span>
                                    </div>

                                    <div>
                                        <a href="remove_book_from_order?id=${orderDetail.book.bookId}">Remove</a>
                                    </div>
                                </div>
                            </div>
                            <div class="row">&nbsp;</div>
                        </c:forEach>

                        <div class="row">
                            <div class="col text-center">
                                Subtotal: <b id="subtotal"><fmt:formatNumber value="${order.subtotal}"
                                                                             type="currency"/></b>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-center">
                                Tax: <b id="tax"><fmt:formatNumber value="${order.tax}" type="currency"/></b>
                                <input type="hidden" name="tax" id="taxInput" value="${order.tax}"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-center">
                                Shipping Fee: <b id="shippingFee"><fmt:formatNumber value="${order.shippingFee}"
                                                                                    type="currency"/></b>
                                <input type="hidden" name="shippingFee" id="shippingFeeInput"
                                       value="${order.shippingFee}"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-center">
                                Total: <b id="total"><fmt:formatNumber value="${order.total}" type="currency"/></b>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-2"></div>
        </div>

        <div class="row">&nbsp;</div>

        <div class="row">
            <div class="col text-center">
                <a href="javascript:showAddBookPopup()" class="btn btn-secondary m-2">Add Books</a>
                <button type="submit" class="btn btn-primary m-2">Save</button>
                <a href="javascript:window.location.href='list_order';" class="btn btn-secondary m-2">Cancel</a>
            </div>
        </div>
    </form>

    <jsp:directive.include file="footer.jsp"/>
</div>
<script>
    function updateOrderSummary() {
        let quantityInputs = document.querySelectorAll('.quantity');
        let subtotal = 0;
        let shippingFee = 0;

        quantityInputs.forEach(function (input) {
            let price = parseFloat(input.getAttribute('data-price'));
            let quantity = parseInt(input.value);
            let perBookSubtotal = price * quantity;
            subtotal += perBookSubtotal;

            shippingFee += quantity; // Shipping fee is $1 per quantity

            // Update per book subtotal
            input.closest('.col-6').querySelector('.per-book-subtotal').innerText = perBookSubtotal.toLocaleString('en-US', {
                style: 'currency',
                currency: 'USD'
            });
        });

        let tax = subtotal * 0.10;
        let total = subtotal + tax + shippingFee;

        // Update summary values
        document.getElementById('subtotal').innerText = subtotal.toLocaleString('en-US', {
            style: 'currency',
            currency: 'USD'
        });
        document.getElementById('tax').innerText = tax.toLocaleString('en-US', {style: 'currency', currency: 'USD'});
        document.getElementById('shippingFee').innerText = shippingFee.toLocaleString('en-US', {
            style: 'currency',
            currency: 'USD'
        });
        document.getElementById('total').innerText = total.toLocaleString('en-US', {
            style: 'currency',
            currency: 'USD'
        });

        // Update hidden input values
        document.getElementById('taxInput').value = tax.toFixed(2);
        document.getElementById('shippingFeeInput').value = shippingFee.toFixed(2);
    }

    // Initial update
    updateOrderSummary();

    function showAddBookPopup() {
        var width = 600;
        var height = 250;
        var left = (screen.width - width) / 2;
        var top = (screen.height - height) / 2;

        window.open('add_book_form', '_blank',
            'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left);
    }
</script>
</body>
</html>