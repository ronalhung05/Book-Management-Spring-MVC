<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Admin Login"/>
</jsp:include>
<body>
<div class="container mt-5">
    <div class="row mb-4">
        <div class="col text-center">
            <h2>Book Store Administration</h2>
            <h3>Admin Login</h3>
        </div>
    </div>

    <c:if test="${message != null}">
        <div class="row mb-3">
            <div class="col text-center text-danger">
                <h4>${message}</h4>
            </div>
        </div>
    </c:if>

    <form id="loginForm" action="login" method="post" class="mx-auto" style="max-width: 400px;">
        <div class="card border-secondary">
            <div class="card-body">
                <div class="form-group row mb-3">
                    <label class="col-sm-4 col-form-label" for="email">Email:</label>
                    <div class="col-sm-8">
                        <input type="email" name="email" id="email" required minlength="5" maxlength="30"
                               class="form-control">
                    </div>
                </div>
                <div class="form-group row mb-4">
                    <label class="col-sm-4 col-form-label" for="password">Password:</label>
                    <div class="col-sm-8">
                        <input type="password" name="password" id="password" required minlength="4" maxlength="32"
                               class="form-control">
                    </div>
                </div>
                <div class="row">
                    <div class="col text-center">
                        <button type="submit" class="btn btn-primary">Login</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>