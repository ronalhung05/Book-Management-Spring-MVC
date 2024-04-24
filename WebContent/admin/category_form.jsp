<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create New Category - Evergreen Bookstore Administration</title>
<link rel="stylesheet" href="../css/style.css" >
<script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />


	<diV align="center">
		<h2>
			<c:if test="${category != null}">
			Edit Category
			</c:if>
			<c:if test="${category == null}">
			Create New Category
			</c:if>
		</h2>
	</diV>

	<diV align="center">
		<c:if test="${category != null}">
			<form id="categoryForm" action="update_category" method="post">
				<input type="hidden" name="categoryId" value=${category.categoryId} />
		</c:if>
		<c:if test="${category == null}">
			<form id="categoryForm" action="create_category" method="post">
		</c:if>
		
			<table class="form">
				<tbody>
					<tr>
						<td align="right">Name:</td>
						<td><input type="text" name="categoryName" id="category"
							size="20" value=${categoryName} ></td>
					</tr>
					<tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><button type="submit">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" onClick="javascript:history.go(-1);">Cancel</button></td>
					</tr>
				</tbody>
			</table>
		</form>
	</diV>
	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">

$(document).ready(function() {
	$("#categoryForm").validate({
		rules : {
			categoryName : "required"
		},
		messages : {
			categoryName : "Please enter category name"		}
	});

	$("#buttonCancel").click(function() {
		history.go(-1);
	});

});

	
	function validateFormInput() {
		const categoryField = document.getElementById("category");

		if (categoryField.value.length == 0) {
			alert("Category name is required!!");
			categoryField.focus();
			return false;
		}
	}
</script>
</html>