<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="${book.title}"/>
</jsp:include>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp"/>
    <div class="row">
        <div class="col-md-4">
            <div>
                <img class="mb-3 img-fluid" src="data:image/jpg;base64,${book.base64Image}" alt="${book.title}">
            </div>
        </div>
        <div class="col-md-8">
            <div class="ps-lg-10 mt-6 mt-md-0">
                <h2 class="mb-1">${book.title}</h2>
                <small class="text-muted">by <span id="author">${book.author}</span></small>
                <div class="mb-4">
                    <small class="text-warning">
                        <jsp:directive.include file="book_rating.jsp"/>
                    </small><a href="#reviews" class="ms-2">(${fn:length(book.reviews)} Reviews)</a>
                </div>
                <div class="fs-4">
                    <span class="fw-bold text-dark">$${book.price}</span>
                </div>
                <hr class="my-6">
                <div>
                    <div class="input-group input-spinner  ">
                        <input type="button" value="-" class="button-minus btn btn-sm " data-field="quantity">
                        <input type="number" step="1" max="10" value="1" name="quantity"
                               class="quantity-field form-control-sm form-input   ">
                        <input type="button" value="+" class="button-plus btn btn-sm " data-field="quantity">
                    </div>
                </div>
                <div class="mt-3 row justify-content-start g-2 align-items-center">
                    <div class="col-xxl-4 col-lg-4 col-md-5 col-5 d-grid">
                        <button id="buttonAddToCart" type="button" class="btn btn-primary">
                            <i class="bi bi-bag me-2"></i>Add to cart
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <ul class="nav nav-pills nav-lb-tab" id="myTab" role="tablist">
                <!-- nav item -->
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="product-tab" data-bs-toggle="tab"
                            data-bs-target="#product-tab-pane" type="button" role="tab"
                            aria-controls="product-tab-pane"
                            aria-selected="true">Description
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="reviews-tab" data-bs-toggle="tab"
                            data-bs-target="#reviews-tab-pane" type="button" role="tab"
                            aria-controls="reviews-tab-pane"
                            aria-selected="false">Reviews
                    </button>
                </li>
            </ul>
            <!-- tab content -->
            <div class="tab-content" id="myTabContent">
                <!-- tab pane -->
                <div class="tab-pane fade show active" id="product-tab-pane" role="tabpanel"
                     aria-labelledby="product-tab"
                     tabindex="0">
                    <div class="my-8">
                        <div class="mb-5">
                            ${book.description}
                        </div>
                    </div>
                </div>
                <!-- tab pane -->
                <div class="tab-pane fade" id="reviews-tab-pane" role="tabpanel" aria-labelledby="reviews-tab"
                     tabindex="0">
                    <div class="my-8">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="me-lg-12 mb-6 mb-md-0">
                                    <div class="d-grid">
                                        <h4>Review this product</h4>
                                        <p class="mb-0">Share your thoughts with other customers.</p>
                                        <button id="buttonWriteReview"
                                                class="btn btn-outline-gray-400 mt-4 text-muted">Write the
                                            Review
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="mb-10">
                                    <div class="d-flex justify-content-between align-items-center mb-8">
                                        <div>
                                            <h4>Reviews</h4>
                                        </div>
                                    </div>
                                </div>
                                <c:forEach items="${book.reviews}" var="review">
                                    <div class="d-flex border-bottom pb-6 mb-6">
                                        <div class="ms-5">
                                            <a id="reviews"></a>
                                            <div class="mb-2">
                                                <c:forTokens items="${review.stars}" delims="," var="star">
                                                    <c:if test="${star eq 'on'}">
                                                        <i class="bi bi-star-fill text-warning"></i>
                                                    </c:if>
                                                    <c:if test="${star eq 'off'}">
                                                        <i class="bi bi-star text-warning"></i>
                                                    </c:if>
                                                </c:forTokens>
                                                <span class="ms-3 text-dark fw-bold">${review.headline}</span>
                                                <p class="text-muted">by ${review.customer.fullname}
                                                    on ${review.reviewTime}</p>
                                                <i>${review.comment}</i>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:directive.include file="footer.jsp"/>
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
