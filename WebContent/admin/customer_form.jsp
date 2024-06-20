<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="page_head.jsp">
        <jsp:param name="pageTitle" value="${customer == null ? 'Create New Customer' : 'Edit Customer'}" />
    </jsp:include>
    <!-- Ensure jQuery is loaded. This is necessary for your script to work -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp" />

    <div class="row m-3">
        <div class="col text-center">
            <h2><c:out value="${customer != null ? 'Edit Customer' : 'Create New Customer'}" /></h2>
        </div>
    </div>

    <!-- Conditional form tags should wrap their contents correctly -->
    <c:if test="${customer != null}">
        <form action="update_customer" method="post" style="max-width: 700px; margin: 0 auto;" class="row g-3 needs-validation" novalidate>
            <input type="hidden" name="customerId" value="${customer.customerId}">
            <jsp:directive.include file="../common/customer_form.jsp" />
        </form>
    </c:if>
    <c:if test="${customer == null}">
        <form action="create_customer" method="post" style="max-width: 700px; margin: 0 auto;" class="row g-3 needs-validation" novalidate>
            <jsp:directive.include file="../common/customer_form.jsp" />
        </form>
    </c:if>

    <jsp:directive.include file="footer.jsp" />
</div>

<!-- Move your custom script here and ensure it's after jQuery -->
<script type="text/javascript">
    $(document).ready(function() {
        $('#confirmPassword').on('input', function() {
            checkPasswordMatch(this);
        });
    });

    function checkPasswordMatch(confirmPassword) {
        if (confirmPassword.value != $("#password").val()) {
            confirmPassword.setCustomValidity("Passwords do not match!");
        } else {
            confirmPassword.setCustomValidity("");
        }
    }
</script>
</body>
</html>
