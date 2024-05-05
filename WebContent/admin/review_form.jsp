<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Create New Review - Evergreen Bookstore Administration</title>
    <link rel="stylesheet" href="../css/style.css">
    <script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
<jsp:directive.include file="header.jsp"/>


<diV align="center">
    <h2>Edit Review</h2>
</diV>

<diV align="center">
    <form id="reviewForm" action="update_review" method="post">
        <input type="hidden" name="reviewId" value="${review.reviewId}"/>

        <table class="form">
            <tbody>
            <tr>
                <td align="right">Book:</td>
                <td align="left"><b>${review.book.title}</b></td>
            </tr>
            <tr>
                <td align="right">Rating:</td>
                <td align="left"><b>${review.rating}</b></td>
            </tr>
            <tr>
                <td align="right">Customer:</td>
                <td align="left"><b>${review.customer.fullname}</b></td>
            </tr>
            <tr>
                <td align="right">Headline:</td>
                <td align="left"><input type="text" name="headline"
                                        size="50" value="${review.headline}"></td>
            </tr>
            <tr>
                <td align="right">Comment:</td>
                <td align="left">
                    <textarea rows="5" cols="70" name="comment">${review.comment }</textarea></td>
            </tr>
            <tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" onClick="javascript:history.go(-1);">Cancel</button>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</diV>
<jsp:directive.include file="footer.jsp"/>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        $("#reviewForm").validate({
            rules: {
                headline: "required",
                comment: "required"
            },
            messages: {
                headline: "Please enter headline",
                comment: "Please enter comment",
            }
        });

        $("#buttonCancel").click(function () {
            history.go(-1);
        });

    });
</script>
</html>