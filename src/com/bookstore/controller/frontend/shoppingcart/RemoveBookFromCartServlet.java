package com.bookstore.controller.frontend.shoppingcart;

import com.bookstore.entity.Book;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.Serial;

@WebServlet("/remove_from_cart")
public class
RemoveBookFromCartServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    public RemoveBookFromCartServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer bookId = Integer.parseInt(request.getParameter("book_id"));

        Object cartObject = request.getSession().getAttribute("cart");

        ShoppingCart shoppingCart = (ShoppingCart) cartObject;

        shoppingCart.removeItem(new Book(bookId));

        String cartPage = request.getContextPath().concat("/view_cart");
        response.sendRedirect(cartPage);
    }

}