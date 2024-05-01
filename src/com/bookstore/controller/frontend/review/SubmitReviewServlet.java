package com.bookstore.controller.frontend.review;

import com.bookstore.service.ReviewServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/submit_review")
public class SubmitReviewServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public SubmitReviewServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ReviewServices reviewServices = new ReviewServices(request, response);
        reviewServices.submitReview();
    }
}