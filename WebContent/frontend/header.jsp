<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="p-3 mb-3 border-bottom">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="${pageContext.request.contextPath}/"
               class="d-flex align-items-center mb-2 mb-lg-0 text-decoration-none">
                <img src="images/BookstoreLogo.png" class="img-fluid" width="200px"/>
            </a>
            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="${pageContext.request.contextPath}/" class="nav-link px-2 link-emphasis">Home</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link  link-body-emphasis"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        Category
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <c:forEach var="category" items="${listCategory}" varStatus="status">
                            <li>
                                <a href="view_category?id=${category.categoryId}" class="dropdown-item">
                                    <c:out value="${category.name}"/>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
                <li><a href="about" class="nav-link px-2 link-body-emphasis">About</a></li>
            </ul>
            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search" action="search_book" method="get">
                <input type="search" class="form-control form-control-dark" placeholder="Search book..."
                       name="keyword" aria-label="Search">
            </form>
            <c:if test="${loggedCustomer == null}">
                <div class="text-end">
                    <a href="login" class="btn btn-primary me-2"><i class="bi bi-person-circle me-2"></i>Login</a>
                    <a href="register" class="btn btn-warning me-2"><i class="bi bi-pencil me-2"></i>Sign-up</a>
                    <a href="view_cart" class="btn btn-info"><i class="bi bi-cart me-2"></i>Cart</a>
                </div>
            </c:if>
            <c:if test="${loggedCustomer != null}">
                <a href="view_cart" class="btn btn-primary me-2"><i class="bi bi-cart me-2"></i>Cart</a>
                <div class="dropdown">
                    <a class="d-block link-body-emphasis text-decoration-none" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <img src="images/users.svg" class="rounded-circle" alt="" width="30" height="30">
                    </a>

                    <ul class="dropdown-menu text-small">
                        <li><a class="dropdown-item" href="view_profile">Welcome, ${loggedCustomer.fullname}</a></li>
                        <li><a class="dropdown-item" href="view_orders">My Orders</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="logout">Sign out</a></li>
                    </ul>
                </div>

            </c:if>
        </div>
    </div>
</header>

