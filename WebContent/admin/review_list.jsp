<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Manage Reviews" />
	</jsp:include>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp" />

	<div class="row">&nbsp;</div>
	
	<div class="row">
		<div class="col text-center">
			<h3>Review Management</h3>
		</div>
	</div>
	
	<div class="row">&nbsp;</div>
	
	<c:if test="${message != null}">
		<div class="row">
			<div class="col text-center">	
				<h4 class="message">${message}</h4>
			</div>
		</div>
	</c:if>
	
	<div class="row">
		<table class="table table-bordered table-striped table-hover table-responsive-sm">
			<thead class="thead-dark">
				<tr>
					<th>Index</th>
					<th>ID</th>
					<th>Book</th>
					<th>Rating</th>
					<th>Headline</th>
					<th>Customer</th>
					<th>Review On</th>
					<th>Actions</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="review" items="${listReviews}" varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td>${review.reviewId}</td>
					<td>${review.book.title}</td>
					<td>${review.rating}</td>
					<td>${review.headline}</td>
					<td>${review.customer.fullname}</td>
					<td>${review.reviewTime}</td>
					<td>
						<a href="edit_review?id=${review.reviewId}">Edit</a> &nbsp;
						<a href="javascript:void(0);" class="deleteLink" id="${review.reviewId}">Delete</a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	
	<jsp:directive.include file="footer.jsp" />
</div>	
	<script>
		$(document).ready(function() {
			$(".deleteLink").each(function() {
				$(this).on("click", function() {
					reviewId = $(this).attr("id");
					if (confirm('Are you sure you want to delete the review with ID ' +  reviewId + '?')) {
						window.location = 'delete_review?id=' + reviewId;
					}					
				});
			});
		});	
	</script>
</body>
</html>