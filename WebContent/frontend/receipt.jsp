<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Payment Receipt"/>
</jsp:include>
<body>
<div class="container mt-5">
    <jsp:directive.include file="header.jsp"/>

    <div class="row mb-4">
        <div class="col text-center">
            <h4>You have made payment successfully. Thank you for purchasing!</h4>
            <h4>Your Payment Receipt</h4>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-10 offset-sm-1">

            <div class="card mb-4">
                <div class="card-header">
                    <h3 class="text-center">Seller Information:</h3>
                </div>
                <div class="card-body">
                    <div class="form-group row">
                        <label for="sellerEmail" class="col-sm-4 col-form-label"><b>E-mail:</b></label>
                        <div class="col-sm-8">seller@example.com</div>
                    </div>
                    <div class="form-group row">
                        <label for="sellerPhone" class="col-sm-4 col-form-label"><b>Phone:</b></label>
                        <div class="col-sm-8">+1 123 456 789</div>
                    </div>
                </div>
            </div>

            <div class="card mb-4">
                <div class="card-header">
                    <h3 class="text-center">Payer Information:</h3>
                </div>
                <div class="card-body">
                    <div class="form-group row">
                        <label for="payerFirstName" class="col-sm-4 col-form-label"><b>First Name:</b></label>
                        <div class="col-sm-8">${payer.firstName}</div>
                    </div>
                    <div class="form-group row">
                        <label for="payerLastName" class="col-sm-4 col-form-label"><b>Last Name:</b></label>
                        <div class="col-sm-8">${payer.lastName}</div>
                    </div>
                    <div class="form-group row">
                        <label for="payerEmail" class="col-sm-4 col-form-label"><b>E-mail:</b></label>
                        <div class="col-sm-8">${payer.email}</div>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col">
                    <div class="card shadow-sm">
                        <div class="card-header text-white">
                            <h3 class="text-center mb-0">Order Details</h3>
                        </div>
                        <div class="card-body">
                            <p class="mb-3"><b>Order ID:</b> ${orderId}</p>
                            <p class="mb-3"><b>Order by:</b> ${loggedCustomer.fullname}</p>
                            <p class="mb-3"><b>Description:</b> ${transaction.description}</p>
                            <h5 class="mb-3">Item List:</h5> <!-- Đổi thành h5 và thêm margin -->

                            <ul class="list-group list-group-flush"> <!-- Sử dụng list-group để trình bày danh sách -->
                                <c:forEach items="${transaction.itemList.items}" var="item" varStatus="status">
                                    <li class="list-group-item">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div>${status.index + 1}. ${item.name}</div>
                                            <div>X ${item.quantity}</div>
                                            <div><fmt:formatNumber value="${item.price}" type="currency"/></div>
                                            <div>= <b><fmt:formatNumber value="${item.price * item.quantity}"
                                                                        type="currency"/></b></div>
                                        </div>
                                    </li>
                                    <li class="list-group-item px-4 py-3">
                                        <div class="d-flex align-items-center justify-content-between mb-2">
                                            <div>
                                                Subtotal
                                            </div>
                                            <div class="fw-bold">
                                                <fmt:formatNumber
                                                        value="${transaction.amount.details.subtotal}"
                                                        type="currency"/>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between mb-2">
                                            <div>
                                                Shipping Fee <i class="feather-icon icon-info text-muted"
                                                                data-bs-toggle="tooltip"
                                                                aria-label="Default tooltip"
                                                                data-bs-original-title="Default tooltip"></i>
                                            </div>
                                            <div class="fw-bold">
                                                <fmt:formatNumber
                                                        value="${transaction.amount.details.shipping}"
                                                        type="currency"/>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div>
                                                Tax <i class="feather-icon icon-info text-muted"
                                                       data-bs-toggle="tooltip"
                                                       aria-label="Default tooltip"
                                                       data-bs-original-title="Default tooltip"></i>
                                            </div>
                                            <div class="fw-bold">
                                                <fmt:formatNumber
                                                        value="${transaction.amount.details.tax}"
                                                        type="currency"/>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="list-group-item px-4 py-3">
                                        <div class="d-flex align-items-center justify-content-between fw-bold">
                                            <div>
                                                Total
                                            </div>
                                            <div>
                                                <fmt:formatNumber
                                                        value="${transaction.amount.total}"
                                                        type="currency"/>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col text-center">
                    <input type="button" value="Print Receipt" onclick="javascript:showPrintReceiptPopup();"
                           class="btn btn-primary"/>
                </div>
            </div>

        </div>
    </div>

    <jsp:directive.include file="footer.jsp"/>
</div>
<script>
    function showPrintReceiptPopup() {
        var width = 600;
        var height = 250;
        var left = (screen.width - width) / 2;
        var top = (screen.height - height) / 2;

        window.open('frontend/print_receipt.jsp', '_blank',
            'width=' + width + ', height=' + height +
            ', top=' + top + ', left=' + left);
    }
</script>
</body>
</html>
