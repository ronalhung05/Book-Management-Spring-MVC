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

        //tạo đối tượng cart 
        Object cartObject = request.getSession().getAttribute("cart");
        
        ShoppingCart shoppingCart = null;

        //tồn tại 
        if (cartObject != null && cartObject instanceof ShoppingCart) {
            shoppingCart = (ShoppingCart) cartObject;
        } else {
        	//cấp phát mới 
            shoppingCart = new ShoppingCart();
            request.getSession().setAttribute("cart", shoppingCart);
        }

        BookDAO bookDAO = new BookDAO();
        Book book = bookDAO.get(bookId);

        shoppingCart.addItem(book);// thêm sách rồi chuyển url khác 

        String cartPage = request.getContextPath().concat("/view_cart");
        response.sendRedirect(cartPage);

    }


}