<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="page_head.jsp">
        <jsp:param name="pageTitle" value="Message"/>
    </jsp:include>
</head>
<body>

<jsp:directive.include file="header.jsp"/>

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

<jsp:directive.include file="footer.jsp"/>
</body>
</html>