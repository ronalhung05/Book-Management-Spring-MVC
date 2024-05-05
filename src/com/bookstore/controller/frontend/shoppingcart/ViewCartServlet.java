package com.bookstore.controller.frontend.shoppingcart;

import com.bookstore.dao.BookDAO;
import com.bookstore.entity.Book;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/view_cart")
public class ViewCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ViewCartServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object cartObj = request.getSession().getAttribute("cart");
        if (cartObj == null) {
            ShoppingCart shoppingCart = new ShoppingCart();
            request.getSession().setAttribute("cart", shoppingCart);
        }


        String cartPage = "frontend/shopping_cart.jsp";
        request.getRequestDispatcher(cartPage).forward(request, response);
    }


}