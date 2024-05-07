<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Evergreen - Online Books Store</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<jsp:directive.include file="header.jsp"/>

<div class="center">
    <br/> <br/>
    <h2>New books:</h2>
    <div class="book_group">
        <c:forEach items="${listNewBooks}" var="book">
            <jsp:directive.include file = "book_group.jsp"/>
        </c:forEach>
    </div>
    <h2>Best-selling Books</h2>
    <div class="next-row">
        <c:forEach items="${listBestSellingBooks}" var="book">
            <jsp:directive.include file = "book_group.jsp"/>
        </c:forEach>
    </div>
    <h2>Most-Favored Books</h2>
    <div class="next-row">
        <c:forEach items="${listMostFavoredBooks}" var="book">
           <jsp:directive.include file = "book_group.jsp"/>
        </c:forEach>
    </div>
    <br/> <br/>
</div>
<jsp:directive.include file="footer.jsp"/>
</body>
</html>