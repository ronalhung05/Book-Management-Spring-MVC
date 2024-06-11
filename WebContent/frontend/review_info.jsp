<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Your Review - Online Book Store</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <script type="text/javascript" src="js/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
</head>
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