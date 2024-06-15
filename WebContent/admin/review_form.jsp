<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="page_head.jsp">
        <jsp:param name="pageTitle" value="Edit Review"/>
    </jsp:include>
    <style>
        .bold-label {
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container py-4">
    <jsp:directive.include file="header.jsp"/>

    <div class="card">
        <div class="card-header text-center">
            <h2>Edit Review</h2>
        </div>
        <div class="card-body">
            <form action="update_review" method="post" class="needs-validation" novalidate>
                <input type="hidden" name="reviewId" value="${review.reviewId}">

                <div class="mb-3 row">
                    <label class="col-sm-4 col-form-label bold-label">Book:</label>
                    <div class="col-sm-8">
                        <p class="form-control-plaintext bold-label">${review.book.title}</p>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-4 col-form-label bold-label">Rating:</label>
                    <div class="col-sm-8">
                        <c:set var="maxStars" value="5"/>
                        <c:forEach var="i" begin="1" end="${maxStars}">
                            <c:choose>
                                <c:when test="${i <= review.rating}">
                                    <span><i class="bi bi-star-fill text-warning"></i></span>
                                </c:when>
                                <c:otherwise>
                                    <span><i class="bi bi-star-fill text-light"></i></span>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-4 col-form-label bold-label">Customer:</label>
                    <div class="col-sm-8">
                        <p class="form-control-plaintext bold-label">${review.customer.fullname}</p>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-4 col-form-label bold-label">Headline:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="headline" value="${review.headline}" required
                               minlength="10" maxlength="128"/>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-4 col-form-label bold-label">Comment:</label>
                    <div class="col-sm-8">
                        <textarea class="form-control" name="comment" rows="5" required>${review.comment}</textarea>
                    </div>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary mr-2">Save</button>
                    <button type="button" class="btn btn-secondary ml-2" onclick="history.go(-1);">Cancel</button>
                </div>
            </form>
        </div>
    </div>

    <jsp:directive.include file="footer.jsp"/>
</div>
</body>
</html>