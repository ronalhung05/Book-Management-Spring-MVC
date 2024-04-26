<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create New Book - Evergreen Bookstore Administration</title>
<link rel="stylesheet" href="../css/style.css" >
<link href="../css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="..//css/richtext.min.css">


<script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.richtext.min.js"></script>

<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>




</head>
<body>
	<jsp:directive.include file="header.jsp" />


	<diV align="center">
		<h2>
			<c:if test="${book != null}">
			Edit Book
			</c:if>
			<c:if test="${book == null}">
			Create New Book
			</c:if>
		</h2>
	</diV>

	<diV align="center">
		<c:if test="${book != null}">
			<form name="bookForm" id="bookForm" action="update_book" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="bookId" value=${book.bookId } />
		</c:if>
		<c:if test="${book == null}">
			<form name="bookForm" id="bookForm" action="create_book" method="post"
				enctype="multipart/form-data">
		</c:if>
		<table class="form">
			<tbody>
				<tr>
					<td align="right">Category:</td>
					<td>
					<select name="category">
						<c:forEach items="${listCategory}" var="category">
							<c:if test="${category.categoryId eq book.category.categoryId}">
								<option value="${category.categoryId}" selected>
							</c:if>
							<c:if test="${category.categoryId ne book.category.categoryId}">
								<option value="${category.categoryId}">
							</c:if>							
								${category.name}
							</option>
						</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td align="right">Title:</td>
					<td><input type="text" name="title" id="title" size="20"
						value=${title}></td>
				</tr>
				<tr>
					<td align="right">Author:</td>
					<td><input type="text" name="author" id="author" size="20"
						value=${author}></td>
				</tr>
				<tr>
					<td align="right">ISBN:</td>
					<td><input type="text" name="isbn" id="isbn" size="20"
						value=${book.isbn}></td>
				</tr>
				<tr>
					<td align="right">Publish Date:</td>
					<td><input type="text" name="publishDate" id="publishDate"
						size="20" value="<fmt:formatDate pattern='MM/dd/yyyy' value='${book.publishDate }' />" /></td>
				</tr>
				<tr>
					<td align="right">Book Image:</td>
					<td align="left"><input type="file" name="bookImage"
						id="bookImage" size="20" /><br /> <img id="thumbnail"
						alt="Image Preview" style="width: 20%; margin-top: 10px"
						src="data:image/jpg;base64,${book.base64Image }"></td>
				</tr>
				<tr>
					<td align="right">Price:</td>
					<td><input type="text" name="price" id="price" size="20"
						value=${book.price}></td>
				</tr>
				<tr>
					<td align="right">Description:</td>
					<td align="left"><textarea id="description" name="description"
							rows="5" cols="50">${description}</textarea></td>
				</tr>

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
	// Get a reference to our file input
	//const fileInput = document.querySelector('input[type="file"]');
	//fileInput.onchange = () => {
	//  const selectedFile = fileInput.files[0];
	//  console.log(selectedFile);
	//}

	$(document).ready(function() {


		$('#publishDate').datepicker();
		$('#description').richText();
		
		$('#bookImage').change(function() {
			showImageThumbnail(this);
		});
		$("#bookForm").validate({
			rules : {
				category : "required",
				title : "required",
				author : "required",
				isbn : "required",
				publishDate : "required",
				//bookImage : "required",
				price : "required",
				description : "required"
			},

			messages : {
				category : "Please enter book category",
				title : "Please enter book title",
				author : "Please enter author's name",
				isbn : "Please enter isbn number",
				publishDate : "Please enter publish date",
				//bookImage : "Please choose the book image",
				price : "Please enter the book price",
				description : "Please enter book description"
			}
		});

		$("#buttonCancel").click(function() {
			history.go(-1);
		});

	});

	function showImageThumbnail(fileInput) {
		let file = fileInput.files[0];

		let reader = new FileReader();

		reader.onload = function(e) {
			$('#thumbnail').attr('src', e.target.result);
		};

		reader.readAsDataURL(file);
	}
</script>

</html>