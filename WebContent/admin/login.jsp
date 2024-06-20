<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Admin Login"/>
</jsp:include>
<body>
<main>
    <!-- section -->
    <section class="my-lg-14 my-8">
        <form id="loginForm" action="login" method="post" class="row g-3 needs-validation" novalidate>
            <div class="container">
                <!-- row -->
                <div class="row justify-content-center align-items-center">
                    <div class="col-12 col-md-6 col-lg-4 order-lg-1 order-2">
                        <!-- img -->
                        <img
                                src="../images/svg-graphics/signin-g.svg"
                                alt=""
                                class="img-fluid"
                        />
                    </div>
                    <!-- col -->
                    <div
                            class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1"
                    >
                        <div class="mb-lg-9 mb-5">
                            <h1 class="mb-1 h2 fw-bold">Sign in to Admin Evergreen BookStore</h1>
                            <p>
                                Welcome back to Admin Evergreen BookStore! Enter your email to get started.
                            </p>
                        </div>

                        <form class="row g-3 needs-validation" novalidate>
                            <div class="row g-3">
                                <div class="col-12">
                                    <label for="email" class="form-label visually-hidden">Email address</label>
                                    <input
                                            type="email"
                                            class="form-control"
                                            name="email"
                                            placeholder="Email"
                                            required
                                            id="email"
                                    />
                                    <div class="invalid-feedback">
                                        Please provide a valid email.
                                    </div>
                                </div>
                                <div class="col-12">
                                    <!-- input -->
                                    <div class="password-field position-relative">
                                        <label for="password" class="form-label visually-hidden">Password</label>
                                        <input
                                                id="password"
                                                type="password"
                                                name="password"
                                                placeholder="Enter Password"
                                                class="form-control"
                                                required
                                        />
                                        <span
                                        ><i id="passwordToggler" class="bi bi-eye-slash"></i
                                        ></span>
                                        <div class="invalid-feedback">
                                            Please provide a valid password.
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 d-grid">
                                    <button type="submit" class="btn btn-primary">
                                        Sign In
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </form>
    </section>
</main>
<script src="../js/vendors/validation.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script>
    $(document).ready(function() {
        <c:if test="${message != null}">
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "newestOnTop": false,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
        toastr.warning("${message}");
        </c:if>
    });
</script>
</body>
</html>