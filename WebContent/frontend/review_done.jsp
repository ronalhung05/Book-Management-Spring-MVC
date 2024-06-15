<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Review Posted"/>
</jsp:include>
<body>
<div class="container mt-5">
    <jsp:directive.include file="header.jsp"/>

    <div class="row mb-4">
        <div class="col text-center">
            <h2>Your Review for "${book.title}"</h2>
            <h4 class="mt-2">Thank you, ${loggedCustomer.fullname}!</h4>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-4">
            <div class="card">
                <img class="card-img-top img-fluid" src="data:image/jpg;base64,${book.base64Image}" alt="${book.title}">
                <div class="card-body">
                    <h4 class="card-title">${book.title}</h4>
                    <p class="card-text">Your review has been successfully posted. We appreciate your feedback!</p>
                    <a href="${pageContext.request.contextPath}/" class="btn btn-primary">Go back to home</a>
                </div>
            </div>
        </div>
    </div>

    <jsp:directive.include file="footer.jsp"/>
</div>
</body>
</html>
