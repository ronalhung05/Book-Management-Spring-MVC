<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="${category == null ? 'Create New Category' : 'Edit Category'}"/>
</jsp:include>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp"/>

    <div class="row m-3">
        <div class="col text-center">
            <h2><c:out value="${category != null ? 'Edit Category' : 'Create New Category'}"/></h2>
        </div>
    </div>

    <c:if test="${category != null}">
    <form action="update_category" method="post" style="max-width: 400px; margin: 0 auto;">
        <input type="hidden" name="categoryId" value="${category.categoryId}">
        </c:if>
        <c:if test="${category == null}">
        <form action="create_category" method="post" style="max-width: 400px; margin: 0 auto;">
            </c:if>

            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Name:</label>
                <div class="col-sm-8">
                    <input type="text" name="categoryName" size="20" value="${category.name}" class="form-control"
                           required minlength="3" maxlength="20"/>
                </div>
            </div>

            <div class="row m-4">
                <div class="col text-center">
                    <button type="submit" class="btn btn-primary mr-2">Save</button>
                    <button type="button" class="btn btn-secondary ml-2" onclick="history.go(-1);">Cancel</button>
                </div>
            </div>
        </form>

        <jsp:directive.include file="footer.jsp"/>
</div>
</body>
</html>