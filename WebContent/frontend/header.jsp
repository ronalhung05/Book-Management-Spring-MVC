<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
    <title>Insert title here</title>
</head>
<body>

<div class="center">
    <div>
        <a href="${pageContext.request.contextPath}/">
            <img src="images/BookstoreLogo.png">
        </a>
    </div>

    <div>
        <form action="search_book" method="get">
            <input type="text" name="keyword" size="50"/>
            <input type="submit" value="Search"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <c:if test="${loggedCustomer == null}">
                <a href="login">Sign In</a> |
                <a href="register">Register</a> |
            </c:if>

            <c:if test="${loggedCustomer != null}">
                <a href="view_profile"> Welcome , ${loggedCustomer.fullname}</a> |
                <a href="view_orders">My orders</a> |
                <a href="logout">Logout |</a>
            </c:if>

            <a href="view_cart">Cart</a>
        </form>
    </div>

    <div>
        <c:forEach var="category" items="${listCategory}" varStatus="status">
            <a href="view_category?id=${category.categoryId}">
                <font size="+1"><b><c:out value="${category.name}"/></b></font>
            </a>
            <c:if test="${not status.last}">
                &nbsp; | &nbsp;
            </c:if>
        </c:forEach>
    </div>

</div>
</body>
</html>