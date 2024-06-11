<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Order Details" />
	</jsp:include>
<body>
<div class="container">
	<jsp:directive.include file="header.jsp" />
	
	<div class="row">&nbsp;</div>
	
	<div class="row">
		<div class="col text-center">
			<h3>Details of Order ID: ${order.orderId}</h3>
		</div>
	</div>
	
	<div class="row">&nbsp;</div>
	
	<c:if test="${message != null}">
		<div class="row">
			<div class="col text-center text-success">	
				<h4>${message}</h4>
			</div>
		</div>
	</c:if>

	<jsp:directive.include file="../common/common_order_detail.jsp" />	

	<div class="row m-4">
		<div class="col text-center">
			<a href="edit_order?id=${order.orderId}" class="btn btn-primary mr-2">Edit this Order</a>
			<a href="javascript:void(0);" class="deleteLink btn btn-secondary ml-2" id="${order.orderId}">Delete this Order</a>
		</div>
	</div>
	
	<jsp:directive.include file="footer.jsp" />
</div>	
	<script>
		$(document).ready(function() {
			$(".deleteLink").each(function() {
				$(this).on("click", function() {
					orderId = $(this).attr("id");
					if (confirm('Are you sure you want to delete the order with ID ' +  orderId + '?')) {
						window.location = 'delete_order?id=' + orderId;
					}					
				});
			});
		});	
	</script>
</body>
</html>