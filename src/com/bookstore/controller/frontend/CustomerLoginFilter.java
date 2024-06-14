package com.bookstore.controller.frontend;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class CustomerLoginFilter extends HttpFilter implements Filter {
    private static final String[] loginRequiredURLs = {
            "/view_profile", "/edit_profile", "/update_profile", "/write_review", "/checkout", "/place_order", "/view_orders", "/show_order_detail"
    };

    public CustomerLoginFilter() {
        super();
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession(false); // does not create new session if not exists
        boolean loggedIn = session != null && session.getAttribute("loggedCustomer") != null;
        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
        //lấy tên đường dẫn cuối

        if (path.startsWith("/admin/")) {
            chain.doFilter(request, response); //gửi tới bộ lọc tiếp theo
            return;
        }
        String requestURL = httpRequest.getRequestURL().toString(); //full url link
        if (!loggedIn && isLoginRequired(requestURL)) {
            String queryString = httpRequest.getQueryString(); //get ?id=...
            String redirectURL = requestURL;

            if (queryString != null) {
                redirectURL = redirectURL.concat("?").concat(queryString); //concate the query string
            }
            session.setAttribute("redirectURL", redirectURL);
            String loginPage = "frontend/login.jsp";
            RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(loginPage);
            dispatcher.forward(request, response);
        } else {
            chain.doFilter(request, response);
        }
    }

    private boolean isLoginRequired(String requestURL) {
        for (String loginRequiredURL : loginRequiredURLs) {
            if (requestURL.contains(loginRequiredURL)) {
                return true;
            }
        }
        return false;
    }

    public void init(FilterConfig fConfig) throws ServletException {

    }

}
