<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Evergreen Books"/>
</jsp:include>
<body>
<div class="container mt-4">

    <jsp:directive.include file="header.jsp"/>

    <div class="row text-center my-4">
        <div class="col">
            <h2>New Books</h2>
            <hr class="my-4">
        </div>
    </div>

    <div class="row justify-content-center mb-5">
        <c:forEach items="${listNewBooks}" var="book">
            <div class="col-md-4 col-lg-3 mb-4">
                <jsp:directive.include file="book_group.jsp"/>
            </div>
        </c:forEach>
    </div>

    <div class="row text-center my-4">
        <div class="col">
            <h2>Best-Selling Books</h2>
            <hr class="my-4">
        </div>
    </div>

    <div class="row justify-content-center mb-5">
        <c:forEach items="${listBestSellingBooks}" var="book">
            <div class="col-md-4 col-lg-3 mb-4">
                <jsp:directive.include file="book_group.jsp"/>
            </div>
        </c:forEach>
    </div>

    <div class="row text-center my-4">
        <div class="col">
            <h2>Most-favored Books</h2>
            <hr class="my-4">
        </div>
    </div>

    <div class="row justify-content-center mb-5">
        <c:forEach items="${listFavoredBooks}" var="book">
            <div class="col-md-4 col-lg-3 mb-4">
                <jsp:directive.include file="book_group.jsp"/>
            </div>
        </c:forEach>
    </div>

    <jsp:directive.include file="footer.jsp"/>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
