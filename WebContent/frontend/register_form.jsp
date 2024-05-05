<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Register as a Customer</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="/css/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
<jsp:directive.include file="header.jsp"/>

<div align="center">
    <h2 class="pageheading">
        Register as a Customer
    </h2>
</div>

<form action="register_customer" id="customerForm" method="post">
    <table class="form">
        <tbody>
        <tr>
            <td align="right">E-mail:</td>
            <td align="left"><input type="text" id="email" name="email"
                                    size="45"></td>
        </tr>
        <tr>
            <td align="right">Full Name:</td>
            <td align="left"><input type="text" id="fullName"
                                    name="fullName" size="45"></td>
        </tr>
        <tr>
            <td align="right">Password:</td>
            <td align="left"><input type="password" id="password"
                                    name="password" size="45"></td>
        </tr>
        <tr>
            <td align="right">Confirm Password:</td>
            <td align="left"><input type="password" id="confirmPassword"
                                    name="confirmPassword" size="45"></td>
        </tr>
        <tr>
            <td align="right">Phone Number:</td>
            <td align="left"><input type="text" id="phone" name="phone"
                                    size="45"></td>
        </tr>
        <tr>
            <td align="right">Address:</td>
            <td align="left"><input type="text" id="address"
                                    name="address" size="45"></td>
        </tr>
        <tr>
            <td align="right">City:</td>
            <td align="left"><input type="text" id="city" name="city"
                                    size="45"></td>
        </tr>
        <tr>
            <td align="right">ZipCode:</td>
            <td align="left"><input type="text" id="zipcode"
                                    name="zipcode" size="45"></td>
        </tr>
        <tr>
            <td align="right">Country:</td>
            <td align="left"><input type="text" id="country"
                                    name="country" size="45"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" onClick="javascript:history.go(-1);">Cancel</button>
            </td>
        </tr>
        </tbody>
    </table>
</form>
<jsp:directive.include file="footer.jsp"/>

<script type="text/javascript">
    $(document).ready(function () {

        $("#customerForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
                fullName: "required",
                password: "required",
                confirmPassword: {
                    required: true,
                    equalTo: "#password"
                },
                phone: "required",
                address: "required",
                city: "required",
                zipcode: "required",
                country: "required"
            },

            messages: {
                email: {
                    required: "Please enter e-mail address",
                    email: "Please enter a valid e-mail address"
                },
                fullName: "Please enter full name",
                password: "Please enter password",
                confirmPassword: {
                    required: "Please confirm password",
                    email: "Confirm password does not match password"
                },
                phone: "Please enter phone number",
                address: "Plese enter address",
                city: "Plese enter city",
                zipcode: "Please enter zip code",
                country: "Plese enter country"
            }
        });

        $("#buttonCancel").click(function () {
            history.go(-1);
        });

    });

</script>
</body>
</html>