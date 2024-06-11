<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Evergreen Books"/>
</jsp:include>
<body>
<div class="container">

    <jsp:directive.include file="header.jsp"/>

    <div class="row text-center">
        <div class="col"><h2>New Books:</h2></div>
    </div>

    <div class="row justify-content-center mb-3">
        <c:forEach items="${listNewBooks}" var="book">
            <jsp:directive.include file="book_group.jsp"/>
        </c:forEach>
    </div>

    <div class="row text-center">
        <div class="col"><h2>Best-Selling Books:</h2></div>
    </div>

    <div class="row justify-content-center mb-3">
        <c:forEach items="${listBestSellingBooks}" var="book">
            <jsp:directive.include file="book_group.jsp"/>
        </c:forEach>
    </div>

    <div class="row text-center">
        <div class="col"><h2>Most-favored Books:</h2></div>
    </div>

    <div class="row justify-content-center mb-3">
        <c:forEach items="${listFavoredBooks}" var="book">
            <jsp:directive.include file="book_group.jsp"/>
        </c:forEach>
    </div>

    <jsp:directive.include file="footer.jsp"/>
</div>
</body>
</html>