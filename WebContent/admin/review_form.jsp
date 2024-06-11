<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Edit Review" />
	</jsp:include>
</head>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp" />
	
	<div class="row m-3">
		<div class="col text-center">
			<h2>Edit Review</h2>
		</div>
	</div>
	
	<form action="update_review" method="post" style="max-width: 700px; margin: 0 auto;">
		<input type="hidden" name="reviewId" value="${review.reviewId}">

		<div class="form-group row">
			<label class="col-sm-4 col-form-label">Book:</label>
			<div class="col-sm-8">
				<b>${review.book.title}</b>
			</div>
		</div>
	
		<div class="form-group row">
			<label class="col-sm-4 col-form-label">Rating:</label>
			<div class="col-sm-8">
				<b>${review.rating}</b>
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-4 col-form-label">Customer:</label>
			<div class="col-sm-8">
				<b>${review.customer.fullname}</b>
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-4 col-form-label">Headline:</label>
			<div class="col-sm-8">
				<input type="text" size="60" name="headline" value="${review.headline}" class="form-control" required minlength="10" maxlength="128" />
			</div>
		</div>
				
		<div class="form-group row">
			<label class="col-sm-4 col-form-label">Comment:</label>
			<div class="col-sm-8">
				<textarea rows="5" cols="70" name="comment" class="form-control" required>${review.comment}</textarea>
			</div>
		</div>
		
		<div class="row m-4">
			<div class="col text-center">
				<button type="submit" class="btn btn-primary mr-2">Save</button>
				<button type="button" class="btn btn-secondary ml-2" onclick="history.go(-1);">Cancel</button>
			</div>
		</div>			
	</form>

	<jsp:directive.include file="footer.jsp" />
</div>	
</body>
</html>