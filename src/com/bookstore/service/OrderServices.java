package com.bookstore.service;

import com.bookstore.controller.frontend.shoppingcart.ShoppingCart;
import com.bookstore.dao.OrderDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;

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
        listAllOrder(null);
    }

    public void listAllOrder(String message) throws ServletException, IOException {
        List<BookOrder> listOrder = orderDao.listAll();

        if (message != null) {
            request.setAttribute("message", message);
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
            listAllOrder(message);
        }
    }

    public void showCheckoutForm() throws ServletException, IOException {
        String checkOutPage = "frontend/checkout.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(checkOutPage);
        dispatcher.forward(request, response);
    }

    public void placeOrder() throws ServletException, IOException {
        String recipientName = request.getParameter("recipientName");
        String recipientPhone = request.getParameter("recipientPhone");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String zipcode = request.getParameter("zipcode");
        String country = request.getParameter("country");
        String paymentMethod = request.getParameter("paymentMethod");
        String shippingAddress = address + ", " + city + ", " + zipcode + ", " + country;

        BookOrder order = new BookOrder();
        order.setRecipientName(recipientName);
        order.setRecipientPhone(recipientPhone);
        order.setShippingAddress(shippingAddress);
        order.setPaymentMethod(paymentMethod);

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
        order.setTotal(shoppingCart.getTotalAmount());

        orderDao.create(order);

        String message = "Thank you. Your order has been received! " + " " + " We will delivery your book within a few days.";
        request.setAttribute("message", message);
        String targetPage = "frontend/message.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(targetPage);
        requestDispatcher.forward(request, response);
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

        if (order == null) {
            String message = "Could not find order with ID " + orderId;
            listAllOrder(message);
            return;
        }
        HttpSession session = request.getSession();
        Object isPendingBook = session.getAttribute("NewBookPendingToAddToOrder");

        if (isPendingBook == null) {
            session.setAttribute("order", order);
        } else {
            session.removeAttribute("NewBookPendingToAddToOrder");
        }

        String editPage = "order_form.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(editPage);
        dispatcher.forward(request, response);
    }

    public void updateOrder() throws ServletException, IOException {
        HttpSession session = request.getSession();
        BookOrder order = (BookOrder) session.getAttribute("order");

        String recipientName = request.getParameter("recipientName");
        String recipientPhone = request.getParameter("recipientPhone");
        String shippingAddress = request.getParameter("shippingAddress");

        String paymentMethod = request.getParameter("paymentMethod");
        String orderStatus = request.getParameter("orderStatus");

        order.setRecipientName(recipientName);
        order.setRecipientPhone(recipientPhone);
        order.setShippingAddress(shippingAddress);
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

        order.setTotal(totalAmount);
        orderDao.update(order);

        String message = "The order " + order.getOrderId() + " has been updated successfully";
        listAllOrder(message);
    }

    public void deleteOrder() throws ServletException, IOException {
        Integer orderId = Integer.parseInt(request.getParameter("id"));

        BookOrder order = orderDao.get(orderId);

        if (order != null) {
            orderDao.delete(orderId);

            String message = "The order ID " + orderId + " has been deleted.";
            listAllOrder(message);
        } else {
            String message = "Could not find order with ID " + orderId +
                    ", or it might have been deleted by another admin.";
            listAllOrder(message);
        }
    }
}
