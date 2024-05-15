<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Customer Profile - Online Books Store</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<jsp:directive.include file="header.jsp"/>


<div align="center">
    <div class="col text-center"><h3>Welcome, ${loggedCustomer.fullname}</h3></div>


    <table class="customer">
        <tr>
            <td><b>E-mail Address:</b>
            <td>${loggedCustomer.email}</td>
        </tr>
        <tr>
            <td><b>First Name:</b>
            <td>${loggedCustomer.firstname}</td>
        </tr>
        <tr>
            <td><b>Last Name:</b>
            <td>${loggedCustomer.lastname}</td>
        </tr>
        <tr>
            <td><b>Phone Number:</b>
            <td>${loggedCustomer.phone}</td>
        </tr>
        <tr>
            <td><b>Address Line 1:</b>
            <td>${loggedCustomer.addressLine1}</td>
        </tr>
         <tr>
            <td><b>Address Line 2:</b>
            <td>${loggedCustomer.addressLine2}</td>
        </tr>
        <tr>
            <td><b>City:</b>
            <td>${loggedCustomer.city}</td>
        </tr>
        <tr>
            <td><b>State:</b>
            <td>${loggedCustomer.state}</td>
        </tr>
        <tr>
            <td><b>ZipCode:</b>
            <td>${loggedCustomer.zipcode}</td>
        </tr>
        <tr>
            <td><b>Country:</b>
            <td>${loggedCustomer.countryName}</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td colspan="2" align="center"><b><a href="edit_profile">Edit My Profile</a></b></td>
        </tr>
    </table>
</div>
<jsp:directive.include file="footer.jsp"/>
</body>
</html>