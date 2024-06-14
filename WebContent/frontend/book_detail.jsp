<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="${book.title}"/>
</jsp:include>
<body>
<div class="container mt-4">
    <jsp:directive.include file="header.jsp"/>

    <div class="row mb-4">
        <div class="col-12">
            <h2>${book.title}</h2> 
            <small class="text-muted">by <span id="author">${book.author}</span></small>
        </div>
    </div>

    <div class="row mb-4">
        <div class="col-sm-2">
            <img class="img-fluid" src="data:image/jpg;base64,${book.base64Image}" alt="${book.title}"/>
        </div>
        <div class="col-sm-8">
            <div class="mb-2">
                <jsp:directive.include file="book_rating.jsp"/>&nbsp;&nbsp;
                <a href="#reviews">${fn:length(book.reviews)} Reviews</a>
            </div>
            <div>${book.description}</div>
        </div>
        <div class="col-sm-2 text-center">
            <div class="mb-2"><h2 class="text-primary">$${book.price}</h2></div>
            <div>
                <button id="buttonAddToCart" class="btn btn-primary btn-lg btn-block">Add to Cart</button>
            </div>
        </div>
    </div>

    <div class="row mb-4">
        <div class="col-12 text-center">
            <h3><a id="reviews">Customer Reviews</a></h3>
            <button id="buttonWriteReview" class="btn btn-secondary">Write a Customer Review</button>
        </div>
    </div>

    <c:forEach items="${book.reviews}" var="review">
        <div class="row mb-2">
            <div class="col-sm-2 text-center">
                <c:forTokens items="${review.stars}" delims="," var="star">
                    <c:if test="${star eq 'on'}">
                        <img src="images/rating_on.png" alt="Rating On"/>
                    </c:if>
                    <c:if test="${star eq 'off'}">
                        <img src="images/rating_off.png" alt="Rating Off"/>
                    </c:if>
                </c:forTokens>
            </div>
            <div class="col-sm-8">
                <b>${review.headline}</b>
                <p class="text-muted">by ${review.customer.fullname} on ${review.reviewTime}</p>
                <i>${review.comment}</i>
            </div>
        </div>
    </c:forEach>

    <jsp:directive.include file="footer.jsp"/>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#buttonWriteReview").click(function () {
            window.location = 'write_review?book_id=' + ${book.bookId};
        });

        $("#buttonAddToCart").click(function () {
            window.location = 'add_to_cart?book_id=' + ${book.bookId};
        });
    });
</script>
</body>
</html>
