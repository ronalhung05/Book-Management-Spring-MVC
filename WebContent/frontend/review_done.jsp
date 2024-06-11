<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Review Posted"/>
</jsp:include>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp"/>

    <div class="row">&nbsp;</div>

    <div class="row">
        <div class="col"><h2>Your Reviews</h2></div>
        <div class="col"><h4>${loggedCustomer.fullname}</h4></div>
    </div>

    <div class="row">
        <div class="col">
            <hr/>
        </div>
    </div>
    <div class="row">
        <div class="col-sm">
            <h4>${book.title}</h4>
            <img class="img-fluid" src="data:image/jpg;base64,${book.base64Image}"/>
        </div>
        <div>&nbsp;</div>
        <div class="col-sm text-center">
            <h4>Your review has been posted. Thank you!</h4>
        </div>
    </div>

    <jsp:directive.include file="footer.jsp"/>
</div>
</body>
</html>