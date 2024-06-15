<div class="text-center position-relative">
    <a href="view_book?id=${book.bookId}">
        <img class="mb-3 img-fluid"
             src="data:image/jpg;base64,${book.base64Image}"/>
    </a>
</div>
<div>
    <h2 class="fs-6"><a href="view_book?id=${book.bookId}" class="text-inherit text-decoration-none">${book.title}</a>
    </h2>
</div>
<div>
    <jsp:directive.include file="book_rating.jsp"/>
</div>
<div>
    <i>by ${book.author}</i>
</div>
<div>

</div>
<div class="d-flex justify-content-between align-items-right mt-3">
    <div><span class="text-dark"><b>$${book.price}</b></span>
    </div>
    <div>
        <a href="#!" class="btn btn-primary btn-sm add-to-cart-btn" data-book-id="${book.bookId}">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
                 fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                 stroke-linejoin="round" class="feather feather-plus">
                <line x1="12" y1="5" x2="12" y2="19"></line>
                <line x1="5" y1="12" x2="19" y2="12"></line>
            </svg>
            Add
        </a>
    </div>
</div>