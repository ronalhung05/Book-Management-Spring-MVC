<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="page_head.jsp">
    <jsp:param name="pageTitle" value="Manage Customers"/>
</jsp:include>
<body>
<div class="container">
    <jsp:directive.include file="header.jsp"/>

    <div class="row">&nbsp;</div>

    <div class="row">
        <div class="col text-center">
            <h3>Customers Management</h3>
            <h4><a href="new_customer" class="btn btn-success"><i class="bi bi-plus-lg"></i> Create New Customer</a>
            </h4>
        </div>
    </div>

    <div class="row">&nbsp;</div>

    <c:if test="${message != null}">
        <c:choose>
            <c:when test="${alertType == 'success'}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong><i class="fas fa-check-circle"></i> Success!</strong> ${message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    <strong><i class="fas fa-exclamation-triangle"></i> Warning!</strong> ${message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:otherwise>
        </c:choose>
    </c:if>

    <div class="row">
        <div class="table-responsive">
            <table id="customerTable"
                   class="table table-centered table-hover mb-0 text-nowrap">
                <thead class="bg-light">
                <tr>
                    <th>Index</th>
                    <th>ID</th>
                    <th>E-mail</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>City</th>
                    <th>Country</th>
                    <th>Registered Date</th>
                    <th>Actions</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="customer" items="${listCustomer}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${customer.customerId}</td>
                        <td>${customer.email}</td>
                        <td>${customer.firstname}</td>
                        <td>${customer.lastname}</td>
                        <td>${customer.city}</td>
                        <td>${customer.countryName}</td>
                        <td>${customer.registerDate}</td>
                        <td>
                            <a href="edit_customer?id=${customer.customerId}" class="text-muted"><i
                                    class="bi bi-pencil-square"></i></a> &nbsp;
                            <a href="javascript:void(0);" class="deleteLink text-danger" id="${customer.customerId}"><i
                                    class="bi bi-trash"></i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>


    <jsp:directive.include file="footer.jsp"/>
</div>
<script>
    new DataTable('#customerTable');
    $(document).ready(function () {
        $(".deleteLink").each(function () {
            $(this).on("click", function () {
                customerId = $(this).attr("id");
                if (confirm('Are you sure you want to delete the customer with ID ' + customerId + '?')) {
                    window.location = 'delete_customer?id=' + customerId;
                }
            });
        });
    });
</script>
</body>
</html>