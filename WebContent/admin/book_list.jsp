<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Manage Books"/>
</jsp:include>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp"/>

    <div class="row">&nbsp;</div>

    <div class="row">
        <div class="col text-center">
            <h3>Books Management</h3>
            <h4><a href="new_book" class="btn btn-success"><i class="bi bi-plus-lg"></i> Create New Book</a></h4>
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


    <div class="table-responsive">
        <table id="bookTable" class="table table-centered table-hover mb-0 text-nowrap table-striped table-bordered">
            <thead class="thead-dark">
            <tr>
                <th>Index</th>
                <th>Image</th>
                <th>Title</th>
                <th>Author</th>
                <th>Category</th>
                <th>Price</th>
                <th>Last Updated</th>
                <th>Actions</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="book" items="${listBook}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>
                        <img src="data:image/jpg;base64,${book.base64Image}" width="84" height="110"/>
                    </td>

                    <td>${book.title}</td>
                    <td>${book.author}</td>
                    <td>${book.category.name}</td>
                    <td>$${book.price}</td>
                    <td><fmt:formatDate pattern='dd/MM/yyyy' value='${book.lastUpdateTime}'/></td>
                    <td>
                        <a href="edit_book?id=${book.bookId}" class="text-muted"><i class="bi bi-pencil-square"></i>
                        </a>&nbsp;
                        <a href="javascript:void(0);" class="deleteLink text-danger" id="${book.bookId}"><i
                                class="bi bi-trash"></i></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


    <jsp:directive.include file="footer.jsp"/>
</div>
<script>
    new DataTable('#bookTable');
    $(document).ready(function () {
        $(".deleteLink").each(function () {
            $(this).on("click", function () {
                bookId = $(this).attr("id");
                if (confirm('Are you sure you want to delete the book with ID ' + bookId + '?')) {
                    window.location = 'delete_book?id=' + bookId;
                }
            });
        });
    });
</script>
</body>
</html>