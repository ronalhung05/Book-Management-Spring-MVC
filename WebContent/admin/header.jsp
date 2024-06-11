<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col text-center">
        <a href="${pageContext.request.contextPath}/admin/">
            <img src="../images/BookstoreAdminLogo.png" class="img-fluid"/>
        </a>
    </div>
</div>

<div class="row">
    <div class="col text-center">
        Welcome, <c:out value="${sessionScope.useremail}"/> | <a href="logout">Logout</a>
    </div>
</div>

<div class="row">&nbsp;</div>

<nav class="navbar navbar-expand-lg bg-body-tertiar">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#topNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-center" id="topNavbar">
        <ul class="navbar-nav">
            <li class="nav-item text-center">
                <a href="list_users" class="nav-link"><img src="../images/users.svg"/><br/>Users</a>
            </li>
            <li class="nav-item text-center">
                <a href="list_category" class="nav-link"><img src="../images/category.svg"/><br/>Categories</a>
            </li>
            <li class="nav-item text-center">
                <a href="list_book" class="nav-link"><img src="../images/bookstack.svg"/><br/>Books</a>
            </li>
            <li class="nav-item text-center">
                <a href="list_customer" class="nav-link"><img src="../images/customer.svg"/><br/>Customers</a>
            </li>
            <li class="nav-item text-center">
                <a href="list_review" class="nav-link"><img src="../images/review.svg"/><br/>Reviews</a>
            </li>
            <li class="nav-item text-center">
                <a href="list_order" class="nav-link"><img src="../images/order.svg"/><br/>Orders</a>
            </li>
        </ul>
    </div>
</nav>
