package com.chappie.controller.web;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chappie.model.Cart;
import com.chappie.model.Phone;
import com.chappie.model.User;
import com.chappie.service.CartService;
import com.chappie.service.PhoneService;

@WebServlet(name = "cart", urlPatterns = { "/cart" })
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private CartService cartService;

	@Inject
	private PhoneService phoneService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action != null && action.equals("viewCart")) {
			viewCart(request, response);
		} else {
			// Xử lý các action khác nếu cần
		}
	}

	private void viewCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Lấy thông tin người dùng (đây là giả sử đã đăng nhập)
		User user = (User) request.getSession().getAttribute("USERMODEL");
		Long userId = user.getId();

		// Lấy danh sách sản phẩm trong giỏ hàng
		List<Cart> cartItems = cartService.getCartItemsByUserId(userId);

		// Lấy chi tiết của từng sản phẩm
		long cartTotalPrice = 0;
		if (cartItems != null) {
			for (Cart cartItem : cartItems) {
				Phone phone = phoneService.getPhoneByCartId(cartItem.getId());
				cartItem.setPhone(phone);
				cartTotalPrice += cartItem.getPhone().getDonGia() * cartItem.getQuantity();
			}
		}

		request.setAttribute("cartItems", cartItems);
		request.setAttribute("cartTotal", cartTotalPrice);

		// Chuyển hướng người dùng về trang giỏ hàng
		request.getRequestDispatcher("views/web/cart2.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action != null && action.equals("addToCart")) {
			addToCart(request, response);
		} else if (action != null && action.equals("removeItem")) {
			removeItem(request, response);
		} else if (action != null && action.equals("updateQuantity")) {
			updateQuantity(request, response);
		}
	}

	private void updateQuantity(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Lấy thông tin sản phẩm từ request
		long productId = Long.parseLong(request.getParameter("productId"));
		String actionType = request.getParameter("actionType");

		// Lấy thông tin người dùng (đây là giả sử đã đăng nhập)
		User user = (User) request.getSession().getAttribute("USERMODEL");
		Long userId = user.getId(); // Thay bằng lấy thông tin người dùng từ đăng nhập

		// Lấy giỏ hàng của người dùng
		Cart cart = cartService.getCartByUserIdAndProductId(userId, productId);

		if (cart != null) {
			// Thực hiện tăng hoặc giảm quantity tùy thuộc vào actionType
			if (cart.getQuantity() == 1) {
				cartService.removeFromCart(cart);
			} else if ("increase".equals(actionType)) {
				cart.setQuantity(cart.getQuantity() + 1);
			} else if ("decrease".equals(actionType) && cart.getQuantity() > 1) {
				cart.setQuantity(cart.getQuantity() - 1);
			}

			// Cập nhật giỏ hàng trong CSDL
			cartService.updateCart(cart);
		}

		// Chuyển hướng người dùng về trang giỏ hàng
		response.sendRedirect("cart?action=viewCart");
	}

	private void addToCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Lấy thông tin sản phẩm từ request
		long productId = Long.parseLong(request.getParameter("productId"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));

		// Lấy thông tin người dùng (đây là giả sử đã đăng nhập)
		User user = (User) request.getSession().getAttribute("USERMODEL");
		Long userId = user.getId(); // Thay bằng lấy thông tin người dùng từ đăng nhập

		// Kiểm tra xem đã có dữ liệu Cart của User và Product trong CSDL chưa
		Cart existingCart = cartService.getCartByUserIdAndProductId(userId, productId);

		if (existingCart != null) {
			// Nếu đã có, cập nhật số lượng
			existingCart.setQuantity(existingCart.getQuantity() + quantity);
			cartService.updateCart(existingCart);
		} else {
			// Nếu chưa có, tạo mới và thêm vào CSDL
			Cart cart = new Cart(userId, productId, quantity);
			cartService.addToCart(cart);
		}

		// Chuyển hướng người dùng về trang danh sách sản phẩm hoặc trang giỏ hàng
		response.sendRedirect("products");
	}

	private void removeItem(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long productId = Long.parseLong(request.getParameter("productId"));

		// Lấy thông tin người dùng (đây là giả sử đã đăng nhập)
		User user = (User) request.getSession().getAttribute("USERMODEL");
		Long userId = user.getId();

		// Kiểm tra xem đã có dữ liệu Cart của User và Product trong CSDL chưa
		Cart existingCart = cartService.getCartByUserIdAndProductId(userId, productId);

		if (existingCart != null) {
			// Nếu có, xóa sản phẩm khỏi giỏ hàng và CSDL
			cartService.removeFromCart(existingCart);

			// Chuyển hướng người dùng về trang giỏ hàng
			response.sendRedirect("cart?action=viewCart");
		} else {

		}
	}
}
