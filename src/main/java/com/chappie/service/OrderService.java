package com.chappie.service;

import java.util.List;

import com.chappie.dao.OrderDAO;
import com.chappie.model.Cart;
import com.chappie.model.Order;
import com.chappie.model.OrderDetail;
import com.chappie.model.User;

public class OrderService {

	private final OrderDAO orderDAO = new OrderDAO();
	private final CartService cartService = new CartService();
	private final UserService userService = new UserService();

	public void placeOrder(User user) {
		User currentUser = userService.getUserByEmail(user.getEmail());

		List<Cart> cartItems = cartService.getCartItemsByUserId(currentUser.getId());

		Order order = new Order();
		order.setUserId(currentUser.getId());

		Long orderId = orderDAO.addOrder(order);

		for (Cart cartItem : cartItems) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrderId(orderId);
			orderDetail.setProductId(cartItem.getProductId());
			orderDetail.setQuantity(cartItem.getQuantity());

			orderDAO.addOrderDetail(orderDetail);
		}

		cartService.clearCart(currentUser.getId());
	}

	public List<Order> getOrdersByUserId(Long userId) {
		return orderDAO.getOrdersByUserId(userId);
	}
}
