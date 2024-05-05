package com.bookstore.controller.frontend.shoppingcart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Arrays;

@WebServlet("/update_cart")
public class UpdateCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateCartServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] arrayBookIds = request.getParameterValues("bookId");
        String[] arrayQuantities = new String[arrayBookIds.length];

        for (int i = 1; i <= arrayQuantities.length; i++) {
            String aQuantity = request.getParameter("quantity" + i);
            arrayQuantities[i - 1] = aQuantity;
        }

        int[] bookIds = Arrays.stream(arrayBookIds).mapToInt(Integer::parseInt).toArray();
        int[] quantities = Arrays.stream(arrayQuantities).mapToInt(Integer::parseInt).toArray();

        ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
        cart.updateCart(bookIds, quantities);

        String cartPage = request.getContextPath().concat("/view_cart");
        response.sendRedirect(cartPage);
    }
}