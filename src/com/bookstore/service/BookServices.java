package com.bookstore.service;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.dao.OrderDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class BookServices {

    private BookDAO bookDAO;
    private CategoryDAO categoryDAO;
    private HttpServletRequest request;
    private HttpServletResponse response;

    public BookServices(HttpServletRequest request, HttpServletResponse response) {

        bookDAO = new BookDAO();
        categoryDAO = new CategoryDAO();
        this.request = request;
        this.response = response;
    }

    public void listBook() throws ServletException, IOException {
        listBook(null, null);
    }

    //nếu muốn thông báo ra message
    public void listBook(String message, String alertType) throws ServletException, IOException {
        List<Book> listBook = bookDAO.listAll();
        //lưu danh sách book gửi qua jsp book_list
        request.setAttribute("listBook", listBook);
        if (message != null) {
            request.setAttribute("message", message);
            request.setAttribute("alertType", alertType);
        }

        String listPage = "book_list.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
        requestDispatcher.forward(request, response);
    }

    public void showBookNewForm() throws ServletException, IOException {
        List<Category> listCategory = categoryDAO.listAll();

        request.setAttribute("listCategory", listCategory);
        String newPage = "book_form.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(newPage);
        requestDispatcher.forward(request, response);

    }

    public void createBook() throws ServletException, IOException {
        String title = request.getParameter("title");

        Book existBook = bookDAO.findByBookTitle(title);
        String alertType;
        if (existBook != null) {
            String message = "Could not create book. A book with title: " + title + " already exists";
            alertType = "warning";
            listBook(message, alertType);
        }

        Book newBook = new Book();
        readBookDetails(newBook);

        Book createdBook = bookDAO.create(newBook);

        if (createdBook.getBookId() > 0) {
            String message = "A new book has been created successfully";
            request.setAttribute("message", message);
            alertType = "success";
            listBook(message, alertType);
        }

    }

    public Book readBookDetails(Book book) throws ServletException, IOException {

        Integer categoryId = Integer.parseInt(request.getParameter("category"));

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String isbn = request.getParameter("isbn");
        float price = Float.parseFloat(request.getParameter("price"));
        String description = request.getParameter("description");

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        Date publishDate = null;

        try {
            publishDate = dateFormat.parse(request.getParameter("publishDate"));
        } catch (ParseException ex) {
            ex.printStackTrace();
            throw new ServletException("Error parsing publish date format is yyyy-MM-dd");
        }


        book.setTitle(title);
        book.setAuthor(author);
        book.setDescription(description);
        book.setIsbn(isbn);
        book.setPrice(price);
        book.setPublishDate(publishDate);

        Category category = categoryDAO.get(categoryId);
        book.setCategory(category);

        Part part = request.getPart("bookImage");

        if (part != null && part.getSize() > 0) {
            long size = part.getSize();
            byte[] imageBytes = new byte[(int) size];

            InputStream inputStream = part.getInputStream();
            inputStream.read(imageBytes);
            inputStream.close();

            book.setImage(imageBytes);
        }

        return book;

    }

    public void editBook() throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("id"));

        Book existBook = bookDAO.get(bookId);
        List<Category> listCategory = categoryDAO.listAll();

        request.setAttribute("book", existBook);
        request.setAttribute("listCategory", listCategory);


        String title = existBook.getTitle();
        title = title.replace(" ", "&nbsp;");
        request.setAttribute("title", title);


        String author = existBook.getAuthor();
        author = author.replace(" ", "&nbsp;");
        request.setAttribute("author", author);

        String description = existBook.getDescription();
        description = description.replace(" ", "&nbsp;");
        request.setAttribute("description", description);


        String newPage = "book_form.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(newPage);
        requestDispatcher.forward(request, response);
    }

    public void updateBook() throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));

        String title = request.getParameter("title");

        Book existBook = bookDAO.get(bookId);

        Book bookByTitle = bookDAO.findByBookTitle(title);
        String alertType;
        if (bookByTitle != null && !existBook.equals(bookByTitle)) {
            String message = "Could not update book because there's another book having same title.";
            alertType = "warning";
            listBook(message, alertType);
            return;
        }

        Book updatedBook = readBookDetails(existBook);

        bookDAO.update(updatedBook);

        String message = "The book has been updated successfully";
        alertType = "success";
        listBook(message, alertType);
    }

    public void deleteBook() throws ServletException, IOException {
        Integer bookId = Integer.parseInt(request.getParameter("id"));
        Book book = bookDAO.get(bookId);
        String alertType;
        if (book == null) {
            String message = "Could not find book with ID " + bookId
                    + ", or it might have been deleted";
            alertType = "warning";
            listBook(message, alertType);

        } else {
            if (!book.getReviews().isEmpty()) {
                String message = "Could not delete the book with ID " + bookId
                        + " because it has reviews";
                alertType = "warning";
                listBook(message, alertType);
            } else {
                OrderDAO orderDAO = new OrderDAO();
                long countByOrder = orderDAO.countOrderDetailByBook(bookId);

                if (countByOrder > 0) {
                    String message = "Could not delete book with ID " + bookId
                            + " because there are orders associated with it.";
                    alertType = "warning";
                    listBook(message, alertType);
                } else {
                    String message = "The book has been deleted successfully.";
                    alertType = "success";
                    bookDAO.delete(bookId);
                    listBook(message, alertType);
                }
            }
        }

    }

    public void listBookByCategory() throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("id"));
        Category category = categoryDAO.get(categoryId);
        List<Book> listBooks = bookDAO.listBooksByCategory(categoryId);
        if (category == null) {
            String message = "Sorry, the category ID " + categoryId + " is not available.";
            request.setAttribute("message", message);
            request.getRequestDispatcher("frontend/message.jsp").forward(request, response);
            return;
        }

        request.setAttribute("category", category);
        request.setAttribute("listBooks", listBooks);

        String listPage = "frontend/books_list_by_category.jsp";

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
        requestDispatcher.forward(request, response);
    }

    public void viewBookDetail() throws ServletException, IOException {
        Integer bookId = Integer.parseInt(request.getParameter("id"));
        Book book = bookDAO.get(bookId);
        String destPage = "frontend/book_detail.jsp";
        if (book != null) {
            request.setAttribute("book", book);

        } else {
            destPage = "frontend/message.jsp";
            String message = "Sorry, the book with ID " + bookId + " is not available.";
            request.setAttribute("message", message);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(destPage);
        requestDispatcher.forward(request, response);
    }

    public void search() throws ServletException, IOException {
        String keyword = request.getParameter("keyword");

        List<Book> result = null;
        if (keyword == "") {
            result = bookDAO.listAll();
        } else {
            result = bookDAO.search(keyword);
        }
        request.setAttribute("keyword", keyword);
        request.setAttribute("result", result);
        String destPage = "frontend/search_result.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(destPage);
        requestDispatcher.forward(request, response);
    }
}