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

@WebServlet("/chi-tiet")
public class ProductDetail extends HttpServlet {

	@Inject
	private PhoneService phoneService;

	@Inject
	private CartService cartService;

	@Inject
	private CategoryService categoryService;
	
//	get tất cả file từ file message.properties (ở mục resources)
	ResourceBundle bundle = ResourceBundle.getBundle("message");

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("USERMODEL");
		if (user != null) {
			Long userId = user.getId();
			// Lấy danh sách sản phẩm trong giỏ hàng
			List<Cart> cartItems = cartService.getCartItemsByUserId(userId);
			request.setAttribute("cartItems", cartItems);
		}

		String id_raw = request.getParameter("id");

		if (id_raw != null) {
			Long id = 0L;
			try {
				id = Long.parseLong(id_raw);
			} catch (NumberFormatException e) {
				e.getMessage();
			}
			request.setAttribute("model", phoneService.findOneById(id));
		}

		for (int i = 1; i <= 3; i++)
			request.setAttribute("phoneRecommended" + i, phoneService.findAllRandom(3));
		request.setAttribute("categoryList", categoryService.findAll());
		
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");
		if (message != null && alert != null) {
			request.setAttribute("message", bundle.getString(message));
			request.setAttribute("alert", alert);
		}

		request.getRequestDispatcher("views/web/detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
