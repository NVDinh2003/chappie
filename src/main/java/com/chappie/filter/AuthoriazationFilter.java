package com.chappie.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chappie.model.User;

public class AuthoriazationFilter implements Filter {

	private ServletContext context;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.context = filterConfig.getServletContext();
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
//	String url = request.getRequestURI();
//	String url = request.getContextPath();
		String url = request.getServletPath();

		if (url.contains("/admin")) {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("USERMODEL");
			if (user != null) {
				if (user.getRole() == 1) {
					chain.doFilter(servletRequest, servletResponse);
				} else if (user.getRole() == 0) {
					response.sendRedirect("dang-nhap?action=login&message=not_permission&alert=danger");
				}
			} else {
				response.sendRedirect("dang-nhap?action=login&message=not_login&alert=danger");
			}

		} else {
			chain.doFilter(servletRequest, servletResponse);
		}
	}

	@Override
	public void destroy() {

	}

}
