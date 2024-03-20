package com.chappie.controller.web;

import java.io.IOException;
import java.util.List;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chappie.model.Cart;
import com.chappie.model.User;
import com.chappie.service.CartService;
import com.chappie.service.CategoryService;
import com.chappie.service.PhoneService;
import com.chappie.service.UserService;

@WebServlet(urlPatterns = { "/trang-chu", "/contact" })
public class HomeController extends HttpServlet {

	@Inject
	private PhoneService phoneService;

	@Inject
	private CategoryService categoryService;

	@Inject
	private CartService cartService;

	@Inject
	private UserService userService;

//	get tất cả file từ file message.properties (ở mục resources)
	ResourceBundle bundle = ResourceBundle.getBundle("message");

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// lấy size của giỏ hàng
		User user = (User) request.getSession().getAttribute("USERMODEL");
		if (user != null) {
			Long userId = user.getId();
			// Lấy danh sách sản phẩm trong giỏ hàng
			List<Cart> cartItems = cartService.getCartItemsByUserId(userId);
			request.setAttribute("cartItems", cartItems);
		}

		String hangDT = request.getParameter("dien-thoai");
		String donGia = request.getParameter("gia");
		String ram = request.getParameter("ram");
		String dungLuong = request.getParameter("dung-luong");
		request.setAttribute("categoryList", categoryService.findAll());

		String action = request.getParameter("action");

		if (action != null && action.equals("help")) {
			request.getRequestDispatcher("views/web/contact.jsp").forward(request, response);
		} else {
			if (hangDT != null)
				request.setAttribute("listPhones", phoneService.findAllByCategory(hangDT, 6));
			else if (donGia != null)
				request.setAttribute("listPhones", phoneService.findAllByPrice(donGia, 6));
			else if (ram != null)
				request.setAttribute("listPhones", phoneService.findAllByRam(ram, 6));
			else if (dungLuong != null)
				request.setAttribute("listPhones", phoneService.findAllByDungLuong(dungLuong, 6));
			else
				request.setAttribute("listPhones", phoneService.findAllRandom(6));

			request.setAttribute("phoneCategory", phoneService.findAllRandom(4));

			// List Phone Recommended
			for (int i = 1; i <= 3; i++)
				request.setAttribute("phoneRecommended" + i, phoneService.findAllRandom(3));

			request.getRequestDispatcher("views/web/home.jsp").forward(request, response);
		}
	}

//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//		request.setAttribute("categoryList", categoryService.findAll());
//
//		String action = request.getParameter("action");
//
//		if (action != null && action.equals("help")) {
//			request.getRequestDispatcher("views/web/contact.jsp").forward(request, response);
//		} else {
//			ServletUtil.processPhonesParameter(request, phoneService);
//
//			request.setAttribute("phoneCategory", phoneService.findAllRandom(4));
//
//			// List Phone Recommended
//			for (int i = 1; i <= 3; i++)
//				request.setAttribute("phoneRecommended" + i, phoneService.findAllRandom(3));
//
//			request.getRequestDispatcher("views/web/home.jsp").forward(request, response);
//		}
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
