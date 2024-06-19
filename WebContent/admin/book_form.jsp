<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>${book != null ? 'Edit Book' : 'Create New Book'} - Evergreen Bookstore Administration</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>

    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/richtext.min.css">
    <script type="text/javascript" src="../js/jquery.richtext.min.js"></script>
    <link rel="stylesheet" href="../css/theme.min.css">
</head>
<body>
<div class="container mt-4">
    <jsp:include page="header.jsp"/>

    <div class="row mb-4">
        <div class="col text-center">
            <h2><c:out value="${book != null ? 'Edit Book' : 'Create New Book'}"/></h2>
        </div>
    </div>

    <c:if test="${book != null}">
    <form action="update_book" method="post" enctype="multipart/form-data" style="max-width: 600px; margin: 0 auto;" class="row g-3 needs-validation" novalidate>
        <input type="hidden" name="bookId" value="${book.bookId}">
        </c:if>
        <c:if test="${book == null}">
        <form action="create_book" method="post" enctype="multipart/form-data"
              style="max-width: 600px; margin: 0 auto;" class="row g-3 needs-validation" novalidate>
            </c:if>

            <div class="form-group row mb-3">
                <label class="col-sm-4 col-form-label" for="category">Category:</label>
                <div class="col-sm-8">
                    <select name="category" id="category" class="form-control" required>
                        <c:forEach items="${listCategory}" var="category">
                            <c:if test="${category.categoryId eq book.category.categoryId}">
                                <option value="${category.categoryId}" selected>${category.name}</option>
                            </c:if>
                            <c:if test="${category.categoryId ne book.category.categoryId}">
                                <option value="${category.categoryId}">${category.name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group row mb-3">
                <label class="col-sm-4 col-form-label" for="title">Title:</label>
                <div class="col-sm-8">
                    <input type="text" name="title" id="title" value="${book.title}" class="form-control" required/>
                    <div class="invalid-feedback">
                        Please provide a valid title.
                    </div>
                </div>
            </div>

            <div class="form-group row mb-3">
                <label class="col-sm-4 col-form-label" for="author">Author:</label>
                <div class="col-sm-8">
                    <input type="text" name="author" id="author" value="${book.author}" class="form-control" required/>
                    <div class="invalid-feedback">
                        Please provide a valid author.
                    </div>
                </div>
            </div>

            <div class="form-group row mb-3">
                <label class="col-sm-4 col-form-label" for="isbn">ISBN:</label>
                <div class="col-sm-8">
                    <input type="text" name="isbn" id="isbn" value="${book.isbn}" class="form-control" required/>
                    <div class="invalid-feedback">
                        Please provide a valid isbn.
                    </div>
                </div>
            </div>

            <div class="form-group row mb-3">
                <label class="col-sm-4 col-form-label" for="publishDate">Publish Date:</label>
                <div class="col-sm-8">
                    <input type="date" name="publishDate" id="publishDate" class="form-control" required
                           value="<fmt:formatDate pattern='yyyy-MM-dd' value='${book.publishDate}' />"/>
                    <div class="invalid-feedback">
                        Please choose a valid date.
                    </div>
                </div>
            </div>

            <div class="form-group row mb-3">
                <label class="col-sm-4 col-form-label" for="bookImage">Book Image:</label>
                <div class="col-sm-8">
                    <c:if test="${book == null}">
                        <input type="file" id="bookImage" name="bookImage" class="form-control" required/><br/>
                    </c:if>
                    <c:if test="${book != null}">
                        <input type="file" id="bookImage" name="bookImage" class="form-control"/><br/>
                    </c:if>

                    <img id="thumbnail" alt="Image Preview" class="img-thumbnail mt-2"
                         src="data:image/jpg;base64,${book.base64Image}"/>
                    <div class="invalid-feedback">
                        Please upload your image.
                    </div>
                </div>
            </div>

            <div class="form-group row mb-3">
                <label class="col-sm-4 col-form-label" for="price">Price:</label>
                <div class="col-sm-8">
                    <input type="text" name="price" id="price" value="${book.price}" class="form-control" required/>
                    <div class="invalid-feedback">
                        Please provide a valid price.
                    </div>
                </div>

            </div>

            <!-- Phần Description giữ nguyên -->
            <div class="mb-3 col-lg-12">
                <label class="col-sm-4 col-form-label" for="description">Description:</label>
                <textarea rows="5" cols="50" name="description" id="description" class="form-control"
                          required>${book.description}</textarea>
                <div class="invalid-feedback">
                    Please provide a valid description.
                </div>
            </div>

            <div class="row mb-4">
                <div class="col text-center">
                    <button type="submit" class="btn btn-primary mr-2">Save</button>
                    <button type="button" class="btn btn-secondary ml-2" onclick="history.go(-1);">Cancel</button>
                </div>
            </div>
        </form>
</div>
<jsp:directive.include file="footer.jsp"/>
</body>
<script type="text/javascript">

    $(document).ready(function () {
        $('#description').richText();

        $('#bookImage').change(function () {
            showImageThumbnail(this);
        });

    });

    function showImageThumbnail(fileInput) {
        var file = fileInput.files[0];

        var reader = new FileReader();

        reader.onload = function (e) {
            $('#thumbnail').attr('src', e.target.result);
        };

        reader.readAsDataURL(file);
    }
</script>
</html>