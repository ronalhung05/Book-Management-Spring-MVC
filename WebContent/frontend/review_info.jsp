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

    <form id="reviewForm" style="max-width: 800px; margin: 0 auto">
        <div class="row">
            <div class="col text-center"><h3>You already wrote a review for this book</h3></div>
        </div>
        <div class="row">
            <div class="col">
                <hr/>
            </div>
        </div>
        <div class="row">
            <div class="col-sm text-center">
                <h4>${book.title}</h4>
                <img class="img-fluid" src="data:image/jpg;base64,${book.base64Image}"/>
            </div>
            <div class="col-sm">
                <div>&nbsp;</div>
                <div id="rateYo"></div>
                <div>&nbsp;</div>
                <div>
                    <input type="text" name="headline" size="60" readonly="readonly" class="form-control"
                           value="${review.headline}"/>
                </div>
                <div>&nbsp;</div>
                <div>
                    <textarea name="comment" cols="70" rows="10" readonly="readonly"
                              class="form-control">${review.comment}</textarea>
                </div>
            </div>
        </div>
    </form>

    <jsp:directive.include file="footer.jsp"/>
</div>
<script type="text/javascript">

    $(document).ready(function () {

        $("#rateYo").rateYo({
            starWidth: "40px",
            fullStar: true,
            rating: ${review.rating},
            readOnly: true
        });
    });
</script>
</body>
</html>