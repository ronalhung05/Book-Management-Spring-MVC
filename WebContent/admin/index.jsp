<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Evergreen Bookstore Administration</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<jsp:directive.include file="header.jsp"/>
<diV align="center">
    <h2 class="pageheading">Administrative Dashboard</h2>
</diV>
<diV align="center">
    <hr width="60%"/>
    <h2 class="pageheading">Quick Actions</h2>
    <b> <a href="create_book">New Book</a> &nbsp; <a
            href="create_user">New User</a> &nbsp; <a href="create_category">New
        Category</a> &nbsp; <a href="create_customer">New Customer</a> &nbsp;
    </b>
    <hr width="60%"/>
</diV>
<diV align="center">
    <h2 class="pageheading">Recent Sales</h2>
    <hr width="60%"/>
</diV>
<diV align="center">
    <h2 class="pageheading">Recent Reviews</h2>
    <hr width="60%"/>
</diV>
<diV align="center">
    <h2 class="pageheading">Statistics</h2>
    <hr width="60%"/>
</diV>

<jsp:directive.include file="footer.jsp"/>
</body>
</html>