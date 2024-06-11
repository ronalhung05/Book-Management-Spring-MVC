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
            <h4><a href="new_book">Create New Book</a></h4>
        </div>
    </div>

    <div class="row">&nbsp;</div>

    <c:if test="${message != null}">
        <div class="row">
            <div class="col text-center text-success">
                <h4>${message}</h4>
            </div>
        </div>
    </c:if>

    <div class="row">
        <table class="table table-bordered table-striped table-hover table-responsive-sm">
            <thead class="thead-dark">
            <tr>
                <th>Index</th>
                <th>ID</th>
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
                    <td>${book.bookId}</td>

                    <td>
                        <img src="data:image/jpg;base64,${book.base64Image}" width="84" height="110"/>
                    </td>

                    <td>${book.title}</td>
                    <td>${book.author}</td>
                    <td>${book.category.name}</td>
                    <td>$${book.price}</td>
                    <td><fmt:formatDate pattern='MM/dd/yyyy' value='${book.lastUpdateTime}'/></td>
                    <td>
                        <a href="edit_book?id=${book.bookId}">Edit</a> &nbsp;
                        <a href="javascript:void(0);" class="deleteLink" id="${book.bookId}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


    <jsp:directive.include file="footer.jsp"/>
</div>
<script>
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