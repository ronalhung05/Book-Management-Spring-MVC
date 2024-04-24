package com.bookstore.controller.admin.category;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.CategoryServices;


@WebServlet("/admin/list_category")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public CategoryServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().println("Hello categories");
		CategoryServices categoryServices = new CategoryServices(request,response);
		categoryServices.listCategory();
	}


}
