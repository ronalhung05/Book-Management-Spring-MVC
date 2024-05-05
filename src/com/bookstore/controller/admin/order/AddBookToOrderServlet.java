package com.bookstore.controller.admin.order;

import java.io.IOException;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.dao.BookDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.OrderDetail;

@WebServlet("/admin/add_book_to_order")
public class AddBookToOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddBookToOrderServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        BookDAO bookDao = new BookDAO();
        Book book = bookDao.get(bookId);

        HttpSession session = request.getSession();
        BookOrder order = (BookOrder) session.getAttribute("order");

        float subtotal = quantity * book.getPrice();

        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setBook(book);
        orderDetail.setQuantity(quantity);
        orderDetail.setSubtotal(subtotal);

        float newTotal = order.getTotal() + subtotal;
        order.setTotal(newTotal);

        // update existing order detail that has the same book
        boolean isBoolAlreadyInOrder = false;
        Set<OrderDetail> orderDetails = order.getOrderDetails();
        for (OrderDetail od : orderDetails) {
            if (od.getBook().equals(book)) {
                isBoolAlreadyInOrder = true;
                od.setQuantity(od.getQuantity() + quantity);
                od.setSubtotal(od.getSubtotal() + subtotal);
                break;
            }
        }

        if (!isBoolAlreadyInOrder) {
            orderDetails.add(orderDetail);
        }

        request.setAttribute("book", book);
        session.setAttribute("NewBookPendingToAddToOrder", true);

        String resultPage = "add_book_result.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(resultPage);
        dispatcher.forward(request, response);
    }

}
