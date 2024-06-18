<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Edit My Profile"/>
</jsp:include>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp"/>

    <div class="row mt-4 mb-4">
        <div class="col text-center">
            <h2>Edit My Profile</h2>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/complete_registration" method="post" style="max-width: 800px; margin: 0 auto;">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="email">E-mail:</label>
                    <input type="email" id="email" name="email" class="form-control" value="${customer.email}"
                           readonly/>
                </div>
                <div class="form-group">
                    <label for="firstname">First Name:</label>
                    <input type="text" id="firstname" name="firstname" class="form-control"
                           value="${customer.firstname}" required minlength="2" maxlength="30"/>
                </div>
                <div class="form-group">
                    <label for="lastname">Last Name:</label>
                    <input type="text" id="lastname" name="lastname" class="form-control"
                           value="${customer.lastname}" required minlength="2" maxlength="30"/>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" class="form-control" maxlength="16"
                           required minlength="5"/>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" class="form-control"
                           required minlength="5" maxlength="16" oninput="checkPasswordMatch(this)"/>
                </div>
                <div class="form-group">
                    <label for="zipcode">Zip Code:</label>
                    <input type="text" id="zipcode" name="zipcode" class="form-control"
                           value="${customer.zipcode}" required minlength="3" maxlength="24"/>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="phone">Phone Number:</label>
                    <input type="text" id="phone" name="phone" class="form-control" value="${customer.phone}"
                           required minlength="9" maxlength="15"/>
                </div>
                <div class="form-group">
                    <label for="address1">Address Line 1:</label>
                    <input type="text" id="address1" name="address1" class="form-control"
                           value="${customer.addressLine1}" required minlength="10" maxlength="128"/>
                </div>
                <div class="form-group">
                    <label for="address2">Address Line 2:</label>
                    <input type="text" id="address2" name="address2" class="form-control"
                           value="${customer.addressLine2}" maxlength="128"/>
                </div>
                <div class="form-group">
                    <label for="city">City:</label>
                    <input type="text" id="city" name="city" class="form-control" value="${customer.city}"
                           required minlength="2" maxlength="32"/>
                </div>
                <div class="form-group">
                    <label for="state">State:</label>
                    <input type="text" id="state" name="state" class="form-control" value="${customer.state}"
                           required minlength="2" maxlength="45"/>
                </div>
                <div class="form-group">
                    <label for="country">Country:</label>
                    <select id="country" name="country" class="form-control" required>
                        <c:forEach items="${mapCountries}" var="country">
                            <option value="${country.value}" ${customer.country eq country.value ? 'selected' : ''}>${country.key}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col text-center">
                <button type="submit" class="btn btn-primary mr-3">Save</button>
                <input type="button" value="Cancel" class="btn btn-secondary" onclick="history.go(-1);"/>
            </div>
        </div>
    </form>

    <jsp:directive.include file="footer.jsp"/>
</div>
<script type="text/javascript" src="js/customer-form.js"></script>
</body>
</html>
