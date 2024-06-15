<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Manage Reviews"/>
</jsp:include>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp"/>

    <div class="row">&nbsp;</div>

    <div class="row">
        <div class="col text-center">
            <h3>Review Management</h3>
        </div>
    </div>

    <div class="row">&nbsp;</div>

    <c:if test="${message != null}">
        <c:choose>
            <c:when test="${alertType == 'success'}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong><i class="fas fa-check-circle"></i> Success!</strong> ${message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    <strong><i class="fas fa-exclamation-triangle"></i> Warning!</strong> ${message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:otherwise>
        </c:choose>
    </c:if>

    <div class="row">
        <div class="table-responsive">
            <table id="reviewTable" class="table table-centered table-hover mb-0 text-nowrap">
                <thead class="bg-light">
                <tr>
                    <th>Index</th>
                    <th>ID</th>
                    <th>Book</th>
                    <th>Rating</th>
                    <th>Headline</th>
                    <th>Customer</th>
                    <th>Review On</th>
                    <th>Actions</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="review" items="${listReviews}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${review.reviewId}</td>
                        <td>${review.book.title}</td>
                        <td>
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
                        </td>
                        <td>${review.headline}</td>
                        <td>${review.customer.fullname}</td>
                        <td>${review.reviewTime}</td>
                        <td>
                            <a href="edit_review?id=${review.reviewId}" class="text-muted"><i
                                    class="bi bi-pencil-square"></i></a> &nbsp;
                            <a href="javascript:void(0);" class="deleteLink text-danger" id="${review.reviewId}"><i
                                    class="bi bi-trash"></i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <jsp:directive.include file="footer.jsp"/>
</div>
<script>
    new DataTable('#reviewTable');
    $(document).ready(function () {
        $(".deleteLink").each(function () {
            $(this).on("click", function () {
                reviewId = $(this).attr("id");
                if (confirm('Are you sure you want to delete the review with ID ' + reviewId + '?')) {
                    window.location = 'delete_review?id=' + reviewId;
                }
            });
        });
    });
</script>
</body>
</html>