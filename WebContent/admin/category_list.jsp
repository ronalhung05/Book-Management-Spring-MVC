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
            <h4><a href="category_form.jsp" class="btn btn-success"><i class="bi bi-plus-lg"></i> Create New
                Category</a>
            </h4>
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
            <table id="categoryTable"
                   class="table table-centered table-hover mb-0 text-nowrap table-striped table-bordered">
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
                            <a href="edit_category?id=${cat.categoryId}" class="text-muted"><i
                                    class="bi bi-pencil-square"></i></a> &nbsp;
                            <a href="javascript:void(0);" class="deleteLink text-danger"
                               id="${cat.categoryId}"><i class="bi bi-trash"></i></a>
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
    new DataTable('#categoryTable');
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