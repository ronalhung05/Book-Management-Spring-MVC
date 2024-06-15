<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Books in ${category.name}"/>
</jsp:include>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp"/>

    <div class="row">
        <div class="col text-center"><h2>${category.name}</h2></div>
    </div>

    <div>&nbsp;</div>

    <div class="row g-4 row-cols-lg-5 row-cols-2 row-cols-md-3">
        <c:forEach items="${listBooks}" var="book">
            <div class="col">
                <div class="card h-100">
                    <div class="card-body">
                        <jsp:directive.include file="book_group.jsp"/>
                    </div>
                </div>
            </div>
            <%--        <jsp:directive.include file="book_group.jsp"/>--%>
        </c:forEach>
    </div>

    <jsp:directive.include file="footer.jsp"/>
</div>
</body>
</html>