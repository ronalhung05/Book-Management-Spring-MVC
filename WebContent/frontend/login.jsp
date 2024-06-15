<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Customer Login"/>
</jsp:include>
<body>
<main>
    <!-- section -->
    <section class="my-lg-14 my-8">
        <c:if test="${message != null}">
            <div class="row">
                <div class="col text-center"><h4 class="message">${message}</h4></div>
            </div>
        </c:if>
        <form action="login" method="post">
            <div class="container">
                <!-- row -->
                <div class="row justify-content-center align-items-center">
                    <div class="col-12 col-md-6 col-lg-4 order-lg-1 order-2">
                        <!-- img -->
                        <img
                                src="images/svg-graphics/signin-g.svg"
                                alt=""
                                class="img-fluid"
                        />
                    </div>
                    <!-- col -->
                    <div
                            class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1"
                    >
                        <div class="mb-lg-9 mb-5">
                            <h1 class="mb-1 h2 fw-bold">Sign in to Evergreen BookStore</h1>
                            <p>
                                Welcome back to Evergreen BookStore! Enter your email to get started.
                            </p>
                        </div>

                        <form>
                            <div class="row g-3">
                                <div class="col-12">
                                    <input
                                            type="email"
                                            class="form-control"
                                            name="email"
                                            placeholder="Email"
                                            required
                                    />
                                </div>
                                <div class="col-12">
                                    <!-- input -->
                                    <div class="password-field position-relative">
                                        <input
                                                type="password"
                                                name="password"
                                                placeholder="Enter Password"
                                                class="form-control"
                                                required
                                        />
                                        <span
                                        ><i id="passwordToggler" class="bi bi-eye-slash"></i
                                        ></span>
                                    </div>
                                </div>
                                <div class="col-12 d-grid">
                                    <button type="submit" class="btn btn-primary">
                                        Sign In
                                    </button>
                                </div>
                                <div>
                                    Don’t have an account? <a href="register"> Sign Up</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </form>
    </section>
</main>
</body>
</html>