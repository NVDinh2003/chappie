package com.chappie.controller.web;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chappie.model.User;
import com.chappie.service.UserService;

@WebServlet(urlPatterns = { "/dang-nhap", "/thoat" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private UserService userService;

//	get tất cả file từ file message.properties (ở mục resources)
	ResourceBundle bundle = ResourceBundle.getBundle("message");

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		// duyệt cookie
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("UID")) {
					String phoneNumber = cookie.getValue();
					User u = userService.findByPhoneNumber(phoneNumber);
					if (u != null) {
						session.setAttribute("USERMODEL", u);
						session.setMaxInactiveInterval(60 * 60 * 24);
					}
					break;
				}
			}
		}

		String action = request.getParameter("action");

		if (action != null && action.equals("login")) {
			String message = request.getParameter("message");
			String alert = request.getParameter("alert");
			if (message != null && alert != null) {
				request.setAttribute("message", bundle.getString(message));
				request.setAttribute("alert", alert);
			}
			request.getRequestDispatcher("views/login_register.jsp").forward(request, response);

		} else if (action != null && action.equals("logout")) {
			session.removeAttribute("USERMODEL");

//			Cookie cookie = new Cookie("UID", null);
//			cookie.setMaxAge(0);
//			response.addCookie(cookie);

			response.sendRedirect("trang-chu");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		if (action != null && action.equals("register")) {
			String ho = request.getParameter("ho");
			String ten = request.getParameter("ten");
			String email = request.getParameter("email");
			String sdt = request.getParameter("sdt");
			String matKhau = request.getParameter("matKhau");
			String diaChi = request.getParameter("diaChi");

			if (userService.exists(email, sdt)) {
				response.sendRedirect("dang-nhap?action=login&message=username_already_exists&alert=danger");
			} else {

				User newUser = new User(ho, ten, email, sdt, matKhau, diaChi);
				userService.save(newUser);

				response.sendRedirect("dang-nhap?action=login&message=register_success&alert=success");
			}

		} else if (action != null && action.equals("login")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String checkboxIsChecked = request.getParameter("checkboxIsChecked");
			User user = userService.findByUserNameAndPassWord(username, password);

			if (user != null) {

				if (checkboxIsChecked != null) {
					Cookie cookie = new Cookie("UID", user.getSdt());
					cookie.setMaxAge(3600 * 24 * 30); // 30 ngày
					response.addCookie(cookie);
					User u = userService.findByPhoneNumber(cookie.getValue());
					if (u != null)
						session.setAttribute("USERMODEL", u);
				} else {
//					 Nếu đăng nhập thành công, lưu thông tin người dùng vào Session
					session.setAttribute("USERMODEL", user);
					session.setMaxInactiveInterval(60 * 60 * 24);

					Cookie cookie = new Cookie("UID", null);
					cookie.setMaxAge(0);
					response.addCookie(cookie);

				}

				if (user.getRole() == 0)
					response.sendRedirect("trang-chu");
				else if (user.getRole() == 1)
					response.sendRedirect("admin-home");

			} else
				response.sendRedirect("dang-nhap?action=login&message=username_password_invalid&alert=danger");
		}
	}

}
