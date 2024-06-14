package com.bookstore.controller.admin;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@WebFilter("/admin/*")
public class AdminLoginFilter extends HttpFilter implements Filter {
 
	private static final long serialVersionUID = 1L;

	public AdminLoginFilter() {
	}

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession(false);
		
		boolean loggedIn = session != null && session.getAttribute("useremail") != null;
		String loginURI = httpRequest.getContextPath() + "/admin/login";
		boolean loginRequest = httpRequest.getRequestURI().equals(loginURI);
		//yêu cầu truy cập đăng nhập
		boolean loginPage = httpRequest.getRequestURI().endsWith("login.jsp");
		//yêu cầu có phải trang đăng nhập

		//đăng nhập nhưng còn bấm trang đăng nhập -> chuyển admin chính
		if (loggedIn && (loginRequest || loginPage)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/");
			dispatcher.forward(request, response);			
			
		} else if (loggedIn || loginRequest) {//cho phép vào các site admin khi đã đăng nhập
			System.out.println("user logged in");
			chain.doFilter(request, response);	
		} else { //chưa đăng nhập
			System.out.println("user not logged in");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
			
		}
		
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
