package com.bookstore.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.dao.CustomerDAO;
import com.bookstore.dao.OrderDAO;
import com.bookstore.dao.ReviewDAO;
import com.bookstore.entity.Customer;

public class CustomerServices {
    CustomerDAO customerDAO = new CustomerDAO();
    private HttpServletRequest request;
    private HttpServletResponse response;


    public CustomerServices(HttpServletRequest request, HttpServletResponse response) {
        super();
        this.request = request;
        this.response = response;
    }

    private void updateCustomerFieldsFromForm(Customer customer) {
        String email = request.getParameter("email");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String addressLine1 = request.getParameter("address1");
        String addressLine2 = request.getParameter("address2");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zipcode = request.getParameter("zipcode");
        String country = request.getParameter("country");

        if (email != null && !email.isEmpty()) {
            customer.setEmail(email);
        }
        customer.setFirstname(firstname);
        customer.setLastname(lastname);

        if (password != null && !password.isEmpty()) {
            customer.setPassword(password);
        }
        customer.setPhone(phone);
        customer.setAddressLine1(addressLine1);
        customer.setAddressLine2(addressLine2);
        customer.setCity(city);
        customer.setState(state);
        customer.setZipcode(zipcode);
        customer.setCountry(country);
    }

    public void listCustomer() throws ServletException, IOException {

        listCustomer(null);
    }

    public void listCustomer(String message) throws ServletException, IOException {

        List<Customer> listCustomer = customerDAO.listAll();
        if (message != null) {
            request.setAttribute("message", message);
        }
        request.setAttribute("listCustomer", listCustomer);

        String listPage = "customer_list.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
        requestDispatcher.forward(request, response);
    }

    public void createCustomer() throws ServletException, IOException {
        String email = request.getParameter("email");
        Customer existCustomer = customerDAO.findByEmail(email);

        if (existCustomer != null) {
            String message = "Could not create customer: the email " + email + " is already registered by another customer.";
            listCustomer(message);
        } else {
            Customer newCustomer = new Customer();
            updateCustomerFieldsFromForm(newCustomer);
            customerDAO.create(newCustomer);

            String message = "New customer has been created successfully";
            listCustomer(message);
        }
    }

    public void editCustomer() throws ServletException, IOException {
        Integer customerId = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerDAO.get(customerId);

        request.setAttribute("customer", customer);
        
        CommonUtility.generateContryList(request);

        CommonUtility.generateContryList(request);

        String editPage = "customer_form.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
        requestDispatcher.forward(request, response);

    }

    public void updateCustomer() throws ServletException, IOException {
        // TODO Auto-generated method stub
        Integer customerId = Integer.parseInt(request.getParameter("customerId"));
        String email = request.getParameter("email");

        Customer customerByEmail = customerDAO.findByEmail(email);
        String message = null;

        if (customerByEmail != null && customerByEmail.getCustomerId() != customerId) {
            message = "Could not update the customer ID " + customerId +
                    " because there's an existing customer having the same email.";
        } else {
            Customer customerById = customerDAO.get(customerId);
            updateCustomerFieldsFromForm(customerById);

            customerDAO.update(customerById);
            message = "The customer has been updated successfully.";

        }
        listCustomer(message);
    }

    public void deleteCustomer() throws ServletException, IOException {
        Integer customerId = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerDAO.get(customerId);

        if (customer != null) {
            ReviewDAO reviewDAO = new ReviewDAO();
            long reviewCount = reviewDAO.countByCustomer(customerId);

            if (reviewCount > 0) {
                String message = "Could not delete customer with ID " + customerId
                        + " because he/she posted reviews for books.";
                listCustomer(message);
            } else {
                OrderDAO orderDAO = new OrderDAO();
                long orderCount = orderDAO.countByCustomer(customerId);

                if (orderCount > 0) {
                    String message = "Could not delete customer with ID " + customerId
                            + " because he/she placed orders.";
                    listCustomer(message);
                } else {
                    customerDAO.delete(customerId);
                    String message = "The customer has been deleted successfully.";
                    listCustomer(message);
                }
            }
        } else {
            String message = "Could not find customer with ID " + customerId + ", "
                    + "or it has been deleted by another admin";
            listCustomer(message);
        }

    }

    public void registerCustomer() throws ServletException, IOException {
        String email = request.getParameter("email");
        Customer existCustomer = customerDAO.findByEmail(email);
        String message = "";
        if (existCustomer != null) {
            message = "Could not register customer: the email "
                    + email + " is already registered by another customer.";
        } else {
            Customer newCustomer = new Customer();
            updateCustomerFieldsFromForm(newCustomer);

            customerDAO.create(newCustomer);
            message = "You have registered successfully! Thank you.<br/>"
                    + "<a href = 'login'>Click here</a> to login";

        }
        String messagePage = "frontend/message.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(messagePage);
        request.setAttribute("message", message);
        requestDispatcher.forward(request, response);
    }

    public void showLogin() throws ServletException, IOException {
        String loginPage = "frontend/login.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(loginPage);
        dispatcher.forward(request, response);
    }

    public void doLogin() throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Customer customer = customerDAO.checkLogin(email, password);

        if (customer == null) {
            String message = "Login failed. Please check your email and password.";
            request.setAttribute("message", message);
            showLogin();
        } else {
            HttpSession session = request.getSession();
            request.getSession().setAttribute("loggedCustomer", customer);

            Object objRedirectURL = session.getAttribute("redirectURL");
            if (objRedirectURL != null) {
                String redirectURL = (String) objRedirectURL;
                session.removeAttribute("redirectURL");
                response.sendRedirect(redirectURL);
            } else {
                showCustomerProfile();
            }
        }

    }

    public void showCustomerProfile() throws ServletException, IOException {
        String profilePage = "frontend/customer_profile.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(profilePage);
        dispatcher.forward(request, response);
    }

    public void showCustomerProfileEditForm() throws ServletException, IOException {
        CommonUtility.generateContryList(request);
        String editPage = "frontend/edit_profile.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(editPage);
        dispatcher.forward(request, response);
    }

    public void updateCustomerProfile() throws ServletException, IOException {
        Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
        updateCustomerFieldsFromForm(customer);
        customerDAO.update(customer);
        showCustomerProfile();
    }

    public void newCustomer() throws ServletException, IOException {
        CommonUtility.generateContryList(request);

        String customerForm = "customer_form.jsp";
        request.getRequestDispatcher(customerForm).forward(request, response);
    }

    public void ShowCustomerRegistrationForm() throws ServletException, IOException {
        CommonUtility.generateContryList(request);
        String registerForm = "frontend/register_form.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(registerForm);
        dispatcher.forward(request, response);
    }
}
