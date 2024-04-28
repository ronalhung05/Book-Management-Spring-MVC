<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Books in ${category.name} - Online Books Store</title>

<link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>

	<jsp:directive.include file="header.jsp" />

	<div class="center">
		<h2>${category.name}</h2>
	</div>


	<div class="book_group">
		<c:forEach items="${listBooks}" var="book">
			<div class="book">
		     <div>
		     <a href="view_book?id=${book.bookId}">
		     <img  class="book_small"   src="data:image/jpg;base64,${book.base64Image}"  />
		     </a>
		     </div>
		     
			<div>
			<a href="view_book?id=${book.bookId}">
			<b>${book.title}</b>
			</a>
			</div>
			<div> Rating *****</div>
			<div> 
            </div>
			<div> <i>by  ${book.author}</i></div>
			<div><b>$${book.price}</b></div>
		</div>
		</c:forEach>
	</div>
	



	<jsp:directive.include file="footer.jsp" />
</body>
</html>