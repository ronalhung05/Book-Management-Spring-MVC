<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Write Reviews"/>
</jsp:include>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp"/>

    <form action="submit_review" method="post" style="max-width: 800px; margin: 0 auto">
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
            <div class="col-sm">
                <div id="rateYo"></div>
                <input type="hidden" id="rating" name="rating"/>
                <input type="hidden" name="bookId" value="${book.bookId}"/>
                <div>&nbsp;</div>
                <div>
                    <input type="text" name="headline" class="form-control"
                           placeholder="Headline or summary for your review (required)" required minlength="10"
                           maxlength="128"/>
                </div>
                <div>&nbsp;</div>
                <div>
						<textarea name="comment" cols="70" rows="10" class="form-control"
                                  placeholder="Write your review details..." required minlength="10"
                                  maxlength="500"></textarea>
                </div>
            </div>
        </div>
        <div>&nbsp;</div>
        <div class="row">
            <div class="col text-center">
                <button type="submit" class="btn btn-primary">Submit</button>
                &nbsp;&nbsp;
                <button type="button" onclick="history.go(-1)" class="btn btn-secondary">Cancel</button>
            </div>
        </div>
    </form>
</div>
<jsp:directive.include file="footer.jsp"/>
<script type="text/javascript">
    $(document).ready(function () {
        $("#rateYo").rateYo({
            starWidth: "40px",
            fullStar: true,
            onSet: function (rating, rateYoInstance) {
                $("#rating").val(rating);
            }
        });
    });
</script>
</body>
</html>