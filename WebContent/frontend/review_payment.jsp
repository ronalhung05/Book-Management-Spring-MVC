<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Review Payment"/>
</jsp:include>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp"/>

    <div class="row mt-4">
        <div class="col text-center"><h5><i>Please carefully review the following information before making payment</i>
        </h5></div>
    </div>

    <div class="row mt-4">
        <div class="col-sm-2"></div>

        <div class="col-sm-8">
            <div class="card">
                <div class="card-header">
                    <div class="text-center"><h3>Payer Information:</h3></div>
                </div>
                <div class="card-body">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label"><b>First Name:</b></label>
                        <div class="col-sm-8">${payer.firstName}</div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label"><b>Last Name:</b></label>
                        <div class="col-sm-8">${payer.lastName}</div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label"><b>E-mail:</b></label>
                        <div class="col-sm-8">${payer.email}</div>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col">
                    <div class="card">
                        <div class="card-header">
                            <div class="text-center"><h3>Recipient Information:</h3></div>
                        </div>
                        <div class="card-body">
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label"><b>Recipient Name:</b></label>
                                <div class="col-sm-8">${recipient.recipientName}</div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label"><b>Address Line 1:</b></label>
                                <div class="col-sm-8">${recipient.line1}</div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label"><b>Address Line 2:</b></label>
                                <div class="col-sm-8">${recipient.line2}</div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label"><b>City:</b></label>
                                <div class="col-sm-8">${recipient.city}</div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label"><b>State:</b></label>
                                <div class="col-sm-8">${recipient.state}</div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label"><b>Country Code:</b></label>
                                <div class="col-sm-8">${recipient.countryCode}</div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label"><b>Postal Code:</b></label>
                                <div class="col-sm-8">${recipient.postalCode}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col">
                    <div class="card shadow-sm"> <!-- Thêm shadow-sm cho card -->
                        <div class="card-header text-white"> <!-- Tùy chỉnh màu sắc -->
                            <h3 class="text-center mb-0">Transaction Details</h3>
                            <!-- Loại bỏ div thừa, chỉnh sửa padding và margin -->
                        </div>
                        <div class="card-body">
                            <p class="mb-3"><b>Description:</b> ${transaction.description}</p>
                            <!-- Chuyển sang p cho đồng nhất -->

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
                    <form action="execute_payment" method="post">
                        <input type="hidden" name="paymentId" value="${param.paymentId}"/>
                        <input type="hidden" name="PayerID" value="${param.PayerID}"/>
                        <input type="submit" value="Pay Now" class="btn btn-primary"/>
                    </form>
                </div>
            </div>

        </div>

        <div class="col-sm-2"></div>

    </div>

    <div class="row mt-4">
        <jsp:directive.include file="footer.jsp"/>
    </div>

</div>
</body>
</html>
