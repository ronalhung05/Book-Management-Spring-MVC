<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Evergreen - Online Books Store</title>
</head>
<body>
<jsp:directive.include file="header.jsp"/>
<div align="center">
    <br/> <br/>
    <h2>New books:</h2>
    <div class="book_group">
        <c:forEach items="${listNewBooks}" var="book">
            <div class="book">
                <div>
                    <a href="view_book?id=${book.bookId}">
                        <img class="book_small" src="data:image/jpg;base64,${book.base64Image}"/>
                    </a>
                </div>

                <div>
                    <a href="view_book?id=${book.bookId}">
                        <b>${book.title}</b>
                    </a>
                </div>
                <div>
                    <jsp:directive.include file="book_rating.jsp"/>
                </div>
                <div></div>
                <div><i>by ${book.author}</i></div>
                <div><b>$${book.price}</b></div>
            </div>
        </c:forEach>
    </div>
    <h2>Best-selling Books</h2>
    <h2>Favourite Books</h2>
    <br/> <br/>
</div>
<jsp:directive.include file="footer.jsp"/>
</body>
</html>