<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Edit My Profile"/>
</jsp:include>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp"/>

    <div class="row mt-4 mb-4">
        <div class="col text-center">
            <h2>Edit My Profile</h2>
        </div>
    </div>

    <form action="update_profile" method="post" style="max-width: 700px; margin: 0 auto;" class="row g-3 needs-validation" novalidate>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="email" class="form-label">E-mail:</label>
                    <input type="email" id="email" name="email" class="form-control" value="${loggedCustomer.email}"
                           readonly/>
                </div>
                <div class="form-group">
                    <label for="firstname" class="form-label">First Name:</label>
                    <input type="text" id="firstname" name="firstname" class="form-control"
                           value="${loggedCustomer.firstname}" required minlength="2" maxlength="30"/>
                    <div class="invalid-feedback">
                        Please enter your first name.
                    </div>
                </div>
                <div class="form-group">
                    <label for="lastname" class="form-label">Last Name:</label>
                    <input type="text" id="lastname" name="lastname" class="form-control"
                           value="${loggedCustomer.lastname}" required minlength="2" maxlength="30"/>
                    <div class="invalid-feedback">
                        Please enter your last name.
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" id="password" name="password" class="form-control" maxlength="16"
                           placeholder="Leave blank if not changing"/>
                </div>
                <div class="form-group">
                    <label for="confirmPassword" class="form-label">Confirm Password:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" class="form-control"
                           maxlength="16" oninput="checkPasswordMatch(this)"/>
                </div>
                <div class="form-group">
                    <label for="zipcode" class="form-label">Zip Code:</label>
                    <input type="text" id="zipcode" name="zipcode" class="form-control"
                           value="${loggedCustomer.zipcode}" required minlength="3" maxlength="24"/>
                    <div class="invalid-feedback">
                        Please enter zipcode.
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="phone" class="form-label">Phone Number:</label>
                    <input type="text" id="phone" name="phone" class="form-control" value="${loggedCustomer.phone}"
                           required minlength="9" maxlength="10"/>
                    <div class="invalid-feedback">
                        Please enter your phone number.
                    </div>
                </div>
                <div class="form-group">
                    <label for="address1" class="form-label">Address Line 1:</label>
                    <input type="text" id="address1" name="address1" class="form-control"
                           value="${loggedCustomer.addressLine1}" required minlength="10" maxlength="128"/>
                    <div class="invalid-feedback">
                        Please enter your address line 1.
                    </div>
                </div>
                <div class="form-group">
                    <label for="address2" class="form-label">Address Line 2:</label>
                    <input type="text" id="address2" name="address2" class="form-control"
                           value="${loggedCustomer.addressLine2}" maxlength="128"/>
                    <div class="invalid-feedback">
                        Please enter your address line 2
                    </div>
                </div>
                <div class="form-group">
                    <label for="city" class="form-label">City:</label>
                    <input type="text" id="city" name="city" class="form-control" value="${loggedCustomer.city}"
                           required minlength="2" maxlength="32"/>
                    <div class="invalid-feedback">
                        Please enter your city.
                    </div>
                </div>
                <div class="form-group">
                    <label for="state" class="form-label">State:</label>
                    <input type="text" id="state" name="state" class="form-control" value="${loggedCustomer.state}"
                           required minlength="2" maxlength="45"/>
                    <div class="invalid-feedback">
                        Please enter your state.
                    </div>
                </div>
                <div class="form-group">
                    <label for="country" class="form-label">Country:</label>
                    <select id="country" name="country" class="form-control" required>
                        <c:forEach items="${mapCountries}" var="country">
                            <option value="${country.value}" ${loggedCustomer.country eq country.value ? 'selected' : ''}>${country.key}</option>
                        </c:forEach>
                    </select>
                    <div class="invalid-feedback">
                        Please select your country.
                    </div>
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
