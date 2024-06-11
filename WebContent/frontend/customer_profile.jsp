<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Customer Profile"/>
</jsp:include>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp"/>

    <div class="row">
        <div class="col text-center"><h3>Welcome, ${loggedCustomer.fullname}</h3></div>
    </div>

    <div class="row">
        <div class="col-sm-3"></div>

        <div class="col-sm-6">
            <div class="row">
                <div class="col"><b>E-mail Address:</b></div>
                <div class="col">${loggedCustomer.email}</div>
            </div>

            <div class="row">
                <div class="col"><b>First Name:</b></div>
                <div class="col">${loggedCustomer.firstname}</div>
            </div>

            <div class="row">
                <div class="col"><b>Last Name:</b></div>
                <div class="col">${loggedCustomer.lastname}</div>
            </div>

            <div class="row">
                <div class="col"><b>Phone Number:</b></div>
                <div class="col">${loggedCustomer.phone}</div>
            </div>

            <div class="row">
                <div class="col"><b>Address Line 1:</b></div>
                <div class="col">${loggedCustomer.addressLine1}</div>
            </div>

            <div class="row">
                <div class="col"><b>Address Line 2:</b></div>
                <div class="col">${loggedCustomer.addressLine2}</div>
            </div>

            <div class="row">
                <div class="col"><b>City:</b></div>
                <div class="col">${loggedCustomer.city}</div>
            </div>

            <div class="row">
                <div class="col"><b>State:</b></div>
                <div class="col">${loggedCustomer.state}</div>
            </div>

            <div class="row">
                <div class="col"><b>Zip Code:</b></div>
                <div class="col">${loggedCustomer.zipcode}</div>
            </div>

            <div class="row">
                <div class="col"><b>Country:</b></div>
                <div class="col">${loggedCustomer.countryName}</div>
            </div>

            <div class="row">&nbsp;</div>

            <div class="row">
                <div class="col text-center"><b><a href="edit_profile">Edit My Profile</a></b></div>
            </div>
        </div>

        <div class="col-sm-3"></div>
    </div>

    <jsp:directive.include file="footer.jsp"/>
</div>
</body>
</html>