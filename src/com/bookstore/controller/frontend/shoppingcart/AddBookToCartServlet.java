package com.bookstore.controller.frontend.shoppingcart;

import com.bookstore.dao.BookDAO;
import com.bookstore.entity.Book;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/add_to_cart")
public class AddBookToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddBookToCartServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer bookId = Integer.parseInt(request.getParameter("book_id"));

        Object cartObject = request.getSession().getAttribute("cart");

        ShoppingCart shoppingCart = null;

        if (cartObject != null && cartObject instanceof ShoppingCart) {
            shoppingCart = (ShoppingCart) cartObject;
        } else {
            shoppingCart = new ShoppingCart();
            request.getSession().setAttribute("cart", shoppingCart);
        }

        BookDAO bookDAO = new BookDAO();
        Book book = bookDAO.get(bookId);

        shoppingCart.addItem(book);

        String cartPage = request.getContextPath().concat("/view_cart");
        response.sendRedirect(cartPage);

    }


}