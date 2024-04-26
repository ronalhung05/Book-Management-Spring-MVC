<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Books - Evergreen Bookstore Administration</title>
<link rel="stylesheet" href="../css/style.css" >
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<diV align="center">
		<h2>Book Management</h2>
		<h3>
			<a href="new_book">Create New Book</a>
		</h3>
	</diV>
	<c:if test="${message != null}">
		<div align="center">
			<h4 class="message">
				<i>${message}</i>
			</h4>
		</div>
	</c:if>

	<diV align="center">
		<table border="1" cellpadding="5">
			<tr>
				<th>Index</th>
				<th>ID</th>
				<th>Image</th>
				<th>Title</th>
				<th>Author</th>
				<th>Category</th>
				<th>Price</th>
				<th>Last Updated</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="book" items="${listBook }"
				varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td>${book.bookId}</td>
					<!--<td>${book.image}</td>  -->
					<td><img alt="book_image" src="data:image/jpg;base64,${book.base64Image }" width="84" height="110"/></td>
					<td>${book.title}</td>
					<td>${book.author}</td>
					<td>${book.category.name}</td>
					<td>$${book.price}</td>
					<td><fmt:formatDate pattern='MM/dd/yyyy' value='${book.lastUpdateTime }' /></td>
					<td><a href="edit_book?id=${book.bookId}">Edit</a>
						&nbsp; <a href="javascript:confirmDelete(${book.bookId})">Delete</a></td>
				</tr>
			</c:forEach>

		</table>
	</diV>
	<jsp:directive.include file="footer.jsp" />
	<script type="text/javascript">
		function confirmDelete(bookId) {
			if (confirm('Are you sure you want to delete book with ID '
					+ bookId + '?')) {
				window.location = 'delete_book?id=' + bookId;
			}
		}
	</script>
</body>
</html>