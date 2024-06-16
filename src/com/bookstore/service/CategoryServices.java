package com.bookstore.service;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Category;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

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
        listCategory(null, null);
    }


    public void listCategory(String message, String alertType) throws ServletException, IOException {
        List<Category> listCategories = categoryDAO.listAll();
        request.setAttribute("listCategories", listCategories);
        if (message != null) {
            request.setAttribute("message", message);
            request.setAttribute("alertType", alertType);

        }

        String listPage = "category_list.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
        requestDispatcher.forward(request, response);
    }

    public void createCategory() throws ServletException, IOException {

        String categoryName = request.getParameter("categoryName");
        Category existCategory = categoryDAO.findByCategoryName(categoryName);
        String alertType;
        if (existCategory != null) {
            String message = "Could not create category. A category with name: " + categoryName + " already exists";
            alertType = "warning";
            listCategory(message, alertType);
        } else {
            Category category = new Category(categoryName);
            categoryDAO.create(category);
            String message = "A new category created successfully";
            alertType = "success";
            listCategory(message, alertType);
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
        String message;
        Category categoryById = categoryDAO.get(categoryId);
        Category categoryByName = categoryDAO.findByCategoryName(categoryName);
        String alertType;
        //tên đã tồn tại nhưng ở id khác thì không thay đổi được
        if (categoryByName != null && categoryById.getCategoryId() != categoryByName.getCategoryId()) {
            message = "Could not update category. Category with name " + categoryByName.getName() + " already exists.";
            alertType = "warning";
            
        } else {
            categoryById.setName(categoryName);
            categoryDAO.update(categoryById);
            message = "Category has been updated successfully";
            alertType = "success";
           
        }
        listCategory(message, alertType);

    }

    public void deleteCategory() throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("id"));
        BookDAO bookDAO = new BookDAO();
        long numOfBooks = bookDAO.countByCategory(categoryId);
        String message;
        String alertType;
        if (numOfBooks > 0) {
            message = "Could not delete the category (ID: %d) because it currently contains some books";
            message = String.format(message, categoryId);
            alertType = "warning";
        } else {
            categoryDAO.delete(categoryId);
            message = "Category has been deleted successfully";
            alertType = "success";
        }
        listCategory(message, alertType);
    }

}