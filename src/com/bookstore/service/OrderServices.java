package com.bookstore.service;

import com.bookstore.controller.frontend.shoppingcart.ShoppingCart;
import com.bookstore.dao.OrderDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

public class OrderServices {
    private OrderDAO orderDao;
    private HttpServletRequest request;
    private HttpServletResponse response;

    public OrderServices(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.orderDao = new OrderDAO();
    }

    public void listAllOrder() throws ServletException, IOException {
        listAllOrder(null, null);
    }

    public void listAllOrder(String message, String alertType) throws ServletException, IOException {
        List<BookOrder> listOrder = orderDao.listAll();

        if (message != null) {
            request.setAttribute("message", message);
            request.setAttribute("alertType", alertType);
        }

        request.setAttribute("listOrder", listOrder);

        String listPage = "order_list.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(listPage);
        dispatcher.forward(request, response);

    }

    public void viewOrderDetailForAdmin() throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("id"));
        BookOrder order = orderDao.get(orderId);


        if (order != null) {
            request.setAttribute("order", order);
            String targetPage = "order_detail.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(targetPage);
            dispatcher.forward(request, response);
        } else {
            String message = "Could not find order with ID " + orderId;
            String alertType = "warning";
            listAllOrder(message, alertType);
        }
    }

    public void showCheckoutForm() throws ServletException, IOException {
        HttpSession session = request.getSession();
        ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");

        // tax is 10% of subtotal
        float tax = shoppingCart.getTotalAmount() * 0.1f;

        // shipping fee is 1.0$ per copy
        float shippingFee = shoppingCart.getTotalQuantity() * 1.0f;

        float total = shoppingCart.getTotalAmount() + tax + shippingFee;

        session.setAttribute("tax", tax);
        session.setAttribute("shippingFee", shippingFee);
        session.setAttribute("total", total);

        CommonUtility.generateContryList(request);
        String checkOutPage = "frontend/checkout.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(checkOutPage);
        dispatcher.forward(request, response);
    }

    private BookOrder readOrderInfo() {
        String paymentMethod = request.getParameter("paymentMethod");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String phone = request.getParameter("phone");
        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zipcode = request.getParameter("zipcode");
        String country = request.getParameter("country");
        String shippingAddress = address1 + ", " + city + ", " + zipcode + ", " + country;
        String orderStatus = request.getParameter("orderStatus");

        BookOrder order = new BookOrder();
        order.setFirstname(firstname);
        order.setLastname(lastname);
        order.setPhone(phone);
        order.setAddressLine1(address1);
        order.setAddressLine2(address2);
        order.setCity(city);
        order.setState(state);
        order.setCountry(country);
        order.setZipcode(zipcode);
        order.setPaymentMethod(paymentMethod);
        order.setStatus(orderStatus);


        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("loggedCustomer");
        order.setCustomer(customer);

        ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
        Map<Book, Integer> items = shoppingCart.getItems();

        Iterator<Book> iterator = items.keySet().iterator();

        Set<OrderDetail> orderDetails = new HashSet<>();

        while (iterator.hasNext()) {
            Book book = iterator.next();
            Integer quantity = items.get(book);
            float subTotal = quantity * book.getPrice();

            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setBook(book);
            orderDetail.setQuantity(quantity);
            orderDetail.setBookOrder(order);
            orderDetail.setSubtotal(subTotal);

            orderDetails.add(orderDetail);
        }
        order.setOrderDetails(orderDetails);

        float tax = (Float) session.getAttribute("tax");
        float shippingFee = (Float) session.getAttribute("shippingFee");
        float total = (Float) session.getAttribute("total");

        order.setSubtotal(shoppingCart.getTotalAmount());
        order.setTax(tax);
        order.setShippingFee(shippingFee);
        order.setTotal(total);

        return order;
    }

    public void listOrderByCustomer() throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("loggedCustomer");
        List<BookOrder> listOrders = orderDao.listByCustomer(customer.getCustomerId());

        request.setAttribute("listOrders", listOrders);

        String historyPage = "frontend/order_list.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(historyPage);
        dispatcher.forward(request, response);
    }

    public void showOrderDetailForCustomer() throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("loggedCustomer");

        BookOrder order = orderDao.get(orderId, customer.getCustomerId());
        request.setAttribute("order", order);

        String detailPage = "frontend/order_detail.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(detailPage);
        dispatcher.forward(request, response);
    }

    public void showEditOrderForm() throws ServletException, IOException {
        Integer orderId = Integer.parseInt(request.getParameter("id"));
        BookOrder order = orderDao.get(orderId);
        String alertType;

        if (order == null) {
            String message = "Could not find order with ID " + orderId;
            alertType = "warning";
            listAllOrder(message, alertType);
            return;
        }
        HttpSession session = request.getSession();
        Object isPendingBook = session.getAttribute("NewBookPendingToAddToOrder");

        if (isPendingBook == null) {
            session.setAttribute("order", order);
        } else {
            session.removeAttribute("NewBookPendingToAddToOrder");
        }

        CommonUtility.generateContryList(request);
        String editPage = "order_form.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(editPage);
        dispatcher.forward(request, response);
    }

    public void updateOrder() throws ServletException, IOException {
        HttpSession session = request.getSession();
        BookOrder order = (BookOrder) session.getAttribute("order");

        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String phone = request.getParameter("phone");
        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zipcode = request.getParameter("zipcode");
        String country = request.getParameter("country");

        float shippingFee = Float.parseFloat(request.getParameter("shippingFee"));
        float tax = Float.parseFloat(request.getParameter("tax"));

        String paymentMethod = request.getParameter("paymentMethod");
        String orderStatus = request.getParameter("orderStatus");

        order.setFirstname(firstname);
        order.setLastname(lastname);
        order.setPhone(phone);
        order.setAddressLine1(address1);
        order.setAddressLine2(address2);
        order.setCity(city);
        order.setState(state);
        order.setZipcode(zipcode);
        order.setShippingFee(shippingFee);
        order.setTax(tax);
        order.setPaymentMethod(paymentMethod);
        order.setStatus(orderStatus);

        String[] arrayBookId = request.getParameterValues("bookId");
        String[] arrayPrice = request.getParameterValues("price");
        String[] arrayQuantity = new String[arrayBookId.length];

        for (int i = 1; i <= arrayQuantity.length; i++) {
            arrayQuantity[i - 1] = request.getParameter("quantity" + i);
        }

        Set<OrderDetail> orderDetails = order.getOrderDetails();
        orderDetails.clear();

        float totalAmount = 0.0f;

        for (int i = 0; i < arrayBookId.length; i++) {
            int bookId = Integer.parseInt(arrayBookId[i]);
            int quantity = Integer.parseInt(arrayQuantity[i]);
            float price = Float.parseFloat(arrayPrice[i]);

            float subtotal = price * quantity;

            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setBook(new Book(bookId));
            orderDetail.setQuantity(quantity);
            orderDetail.setSubtotal(subtotal);
            orderDetail.setBookOrder(order);

            orderDetails.add(orderDetail);

            totalAmount += subtotal;
        }

        order.setSubtotal(totalAmount);
        totalAmount += shippingFee;
        totalAmount += tax;

        order.setTotal(totalAmount);

        orderDao.update(order);

        String message = "The order " + order.getOrderId() + " has been updated successfully";
        String alertType = "success";
        listAllOrder(message, alertType);
    }

    public void deleteOrder() throws ServletException, IOException {
        Integer orderId = Integer.parseInt(request.getParameter("id"));

        BookOrder order = orderDao.get(orderId);

        if (order != null) {
            orderDao.delete(orderId);

            String message = "The order ID " + orderId + " has been deleted.";
            String alertType = "success";
            listAllOrder(message, alertType);
        } else {
            String message = "Could not find order with ID " + orderId +
                    ", or it might have been deleted by another admin.";
            String alertType = "warning";
            listAllOrder(message, alertType);
        }
    }

    public void placeOrder() throws ServletException, IOException {
        String paymentMethod = request.getParameter("paymentMethod");
        BookOrder order = readOrderInfo();

        if (paymentMethod.equals("paypal")) {
            PaymentServices paymentServices = new PaymentServices(request, response);
            request.getSession().setAttribute("order4Paypal", order);
            paymentServices.authorizePayment(order);
        } else {    // Cash on Delivery
            placeOrderCOD(order);
        }
    }

    private void sendEmailToCustomer(){
        //lấy email hiện tại ra
        HttpSession session = request.getSession();
        Customer loggedCustomer = (Customer) session.getAttribute("loggedCustomer");
        String email = loggedCustomer.getEmail();
        String name = loggedCustomer.getFirstname();
        String title = "Order Confirmation from Evergreen BookStore";
        String body = "Dear, Customer " + name + ". Thank you for purchasing books at our Evergreen BookStore, for more information, please log in to our Website to view your Oders! ^^\n" +
                "If you have any questions or need further assistance, please contact us at Website or call (+84) 0903091548.\n" +
                "Thank you once again for choosing Evergreen BookStore. Have a great day!\n" +
                "Best regards.";
        //gửi mail
        MailServices.SendMail(email,title,body);
    }
    private void placeOrderCOD(BookOrder order) throws ServletException, IOException {

        saveOrder(order);
        sendEmailToCustomer();

        String message = "Thank you. Your order has been received. "
                + "We will deliver your books within a few days.";
        request.setAttribute("message", message);
        request.setAttribute("pageTitle", "Order Completed");


        String messagePage = "frontend/message.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(messagePage);
        dispatcher.forward(request, response);
    }

    public Integer placeOrderPaypal(Payment payment) {
        BookOrder order = (BookOrder) request.getSession().getAttribute("order4Paypal");
        ItemList itemList = payment.getTransactions().get(0).getItemList();
        ShippingAddress shippingAddress = itemList.getShippingAddress();
        String shippingPhoneNumber = itemList.getShippingPhoneNumber();

        String recipientName = shippingAddress.getRecipientName();
        String[] names = recipientName.split(" ");

        order.setFirstname(names[0]);
        order.setLastname(names[1]);
        order.setAddressLine1(shippingAddress.getLine1());
        order.setAddressLine2(shippingAddress.getLine2());
        order.setCity(shippingAddress.getCity());
        order.setState(shippingAddress.getState());
        order.setCountry(shippingAddress.getCountryCode());
        order.setPhone(shippingPhoneNumber);

        Integer orderId =  saveOrder(order);
        // Assuming saveOrder successfully saves the order and returns a non-null orderId
        if (orderId != null) {
            sendEmailToCustomer(); // Send confirmation email after successful order placement
        }

        return orderId;
    }

    private Integer saveOrder(BookOrder order) {
        BookOrder savedOrder = orderDao.create(order);

        ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");
        shoppingCart.clear();

        return savedOrder.getOrderId();
    }


}
