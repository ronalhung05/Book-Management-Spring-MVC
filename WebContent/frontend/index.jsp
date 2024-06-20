<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Evergreen Books"/>
</jsp:include>
<body>
<div class="container">

    <jsp:directive.include file="header.jsp"/>

    <div class="row">
        <div class="col-12 mb-6">
            <h3 class="mb-0">New Book</h3>
            &nbsp;
        </div>
    </div>
    <div class="row g-4 row-cols-lg-5 row-cols-2 row-cols-md-3">
        <c:forEach items="${listNewBooks}" var="book">
            <div class="col">
                <div class="card h-100">
                    <div class="card-body">
                        <jsp:directive.include file="book_group.jsp"/>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    &nbsp;
    <div class="row">
        <div class="col-12 mb-6">
            <h3 class="mb-0">Best-Selling Books</h3>
            &nbsp;
        </div>
    </div>

    <div class="row g-4 row-cols-lg-5 row-cols-2 row-cols-md-3">
        <c:forEach items="${listBestSellingBooks}" var="book">
            <div class="col">
                <div class="card h-100">
                    <div class="card-body">
                        <jsp:directive.include file="book_group.jsp"/>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    &nbsp;
    <div class="row">
        <div class="col-12 mb-6">
            <h3 class="mb-0">Most Favoured Books</h3>
            &nbsp;
        </div>
    </div>

    <div class="row g-4 row-cols-lg-5 row-cols-2 row-cols-md-3">
        <c:forEach items="${listMostFavoredBooks}" var="book">
            <div class="col">
                <div class="card h-100">
                    <div class="card-body">
                        <jsp:directive.include file="book_group.jsp"/>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<jsp:directive.include file="footer.jsp"/>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const buttons = document.querySelectorAll('.add-to-cart-btn');
        buttons.forEach(button => {
            button.addEventListener('click', function (event) {
                event.preventDefault();  // Ngăn chặn hành vi mặc định của thẻ <a>
                const bookId = this.getAttribute('data-book-id');
                console.log('Book ID:', bookId);  // Kiểm tra Book ID
                window.location.href = 'add_to_cart?book_id=' + bookId;
            });
        });
    });
</script>
</body>
</html>
