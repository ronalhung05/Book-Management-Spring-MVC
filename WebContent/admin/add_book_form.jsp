<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Add Book to Order" />
	</jsp:include>
<body>
<div class="container">

	<div class="row">&nbsp;</div>
	
	<div class="row">
		<div class="col text-center">
			<h3>Add book to Order ID: ${order.orderId}</h3>
		</div>
	</div>
	
	<div class="row">
		<div class="col">
			<form action="add_book_to_order" method="post">
				<div class="form-group row">
					<label class="col-sm-4 col-form-label">Select a book:</label>
					<div class="col-sm-8">
						<select name="bookId" class="form-control">
							<c:forEach items="${listBook}" var="book" varStatus="status">
								<option value="${book.bookId}">${book.title} - ${book.author}</option>
							</c:forEach>
						</select>						
					</div>
				</div>			
				
				<div class="form-group row">
					<label class="col-sm-4 col-form-label">Number of Copies:</label>
					<div class="col-sm-8">
						<select name="quantity" class="form-control">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>				
					</div>
				</div>	

				<div class="row m-4">
					<div class="col text-center">
						<button type="submit" class="btn btn-primary mr-2">Add</button>
						<button type="button" class="btn btn-secondary ml-2" onclick="javascript: self.close();">Cancel</button>
					</div>
				</div>
			</form>		
		</div>
	</div>
</div>	
</body>
</html>