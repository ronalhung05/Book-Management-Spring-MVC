<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Manage Categories"/>
</jsp:include>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp"/>

    <div class="row">&nbsp;</div>

    <div class="row">
        <div class="col text-center">
            <h3>Category Management</h3>
            <h4><a href="category_form.jsp">Create New Category</a></h4>
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
                <th>Name</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="cat" items="${listCategories}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${cat.categoryId}</td>
                    <td>${cat.name}</td>
                    <td>
                        <a href="edit_category?id=${cat.categoryId}">Edit</a> &nbsp;
                        <a href="javascript:void(0);" class="deleteLink" id="${cat.categoryId}">Delete</a>
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
                categoryId = $(this).attr("id");
                if (confirm('Are you sure you want to delete the category with ID ' + categoryId + '?')) {
                    window.location = 'delete_category?id=' + categoryId;
                }
            });
        });
    });
</script>
</body>
</html>