package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Category;

public class CategoryServices {

	
	private CategoryDAO categoryDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public CategoryServices(HttpServletRequest request, HttpServletResponse response) {
		categoryDAO = new CategoryDAO();
		this.request = request;
		this.response = response;
	}

	public void listCategory() throws ServletException, IOException {
		listCategory(null);
	}

	public void listCategory(String message) throws ServletException, IOException {
		List<Category> listCategories = categoryDAO.listAll();
		request.setAttribute("listCategories", listCategories);
		if (message != null) {
			request.setAttribute("message", message);
		}

		String listPage = "category_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}

	public void createCategory() throws ServletException, IOException {
		
		String categoryName = request.getParameter("categoryName");
		Category existCategory = categoryDAO.findByCategoryName(categoryName);

		if (existCategory != null) {
			String message = "Could not create category. A category with name: " + categoryName + " already exists";
			request.setAttribute("message", message);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			requestDispatcher.forward(request, response);

		} else {
			Category category = new Category(categoryName);
			categoryDAO.create(category);
			listCategory("A new category created successfully");
		}
	}
	
	public void editCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		
		Category category = categoryDAO.get(categoryId);
		String editPage = "category_form.jsp";
		String categoryName = category.getName();
		categoryName = categoryName.replace(" ", "&nbsp;");
		request.setAttribute("categoryName", categoryName);
		request.setAttribute("category", category);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		
		requestDispatcher.forward(request, response);
	}

	public void updateCategory() throws ServletException, IOException {
		
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String categoryName = request.getParameter("categoryName");
		
		Category categoryById = categoryDAO.get(categoryId);
		Category categoryByName = categoryDAO.findByCategoryName(categoryName);
	
		
		//tên đã tồn tại nhưng ở id khác thì không thay đổi được
		if(categoryByName != null && categoryById.getCategoryId() != categoryByName.getCategoryId()) {
			String message = "Could not update category. Category with name "+ categoryByName.getName() + " already exists.";
			request.setAttribute("message", message);
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			requestDispatcher.forward(request,response);
		}
		else {
			categoryById.setName(categoryName);
			categoryDAO.update(categoryById);
			String message = "Category has been updated successfully";
			listCategory(message);
		}
		
	}

	public void deleteCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		BookDAO bookDAO = new BookDAO();
		long numOfBooks = bookDAO.countByCategory(categoryId);
		String message;
		
		if(numOfBooks >  0) {
			message = "Could not delete the category (ID: %d) because it currently contains some books";
			message = String.format(message, categoryId);
		}else {
			categoryDAO.delete(categoryId);
			message = "Category has been deleted successfully";
		}
		
		listCategory(message);
	}

}