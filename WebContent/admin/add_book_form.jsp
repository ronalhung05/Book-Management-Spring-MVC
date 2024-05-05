<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add Book to Order</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row">&nbsp;</div>
    <div class="row">
        <div class="col text-center">
            <h3>Add Book to Order ID: ${order.orderId}</h3>
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
                            <c:forEach begin="0" end="4" varStatus="status">
                                <option value="${status.index + 1}">${status.index + 1}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col text-center">
                        <button type="submit" class="btn btn-primary mr-2">Add</button>
                        <button type="button" class="btn btn-secondary ml-2" onclick="javascript: self.close();">
                            Cancel
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
