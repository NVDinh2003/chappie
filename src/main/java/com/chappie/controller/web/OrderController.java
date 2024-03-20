package com.chappie.controller.web;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chappie.model.Order;
import com.chappie.service.OrderService;

@WebServlet("/order")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService orderService;

	public void init() {
		orderService = new OrderService();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Long userId = Long.parseLong(request.getParameter("userId"));
		String paymentMethod = request.getParameter("paymentMethod");
		String shippingAddress = request.getParameter("shippingAddress");
		String phoneNumber = request.getParameter("phoneNumber");
		float totalPrice = Float.parseFloat(request.getParameter("totalPrice"));

		Order order = new Order();
		order.setUserId(userId);
		order.setCreatedDate(new Date());
		order.setPaymentMethod(paymentMethod);
		order.setShippingAddress(shippingAddress);
		order.setPhoneNumber(phoneNumber);
		order.setTotalPrice(totalPrice);

		orderService.placeOrder(order);

		response.sendRedirect("order-success.jsp");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Hiển thị đơn hàng của người dùng
		Long userId = Long.parseLong(request.getParameter("userId"));
		List<Order> orders = orderService.getOrdersByUserId(userId);

		// Truyền danh sách đơn hàng đến trang jsp để hiển thị
		request.setAttribute("orders", orders);
		request.getRequestDispatcher("orders.jsp").forward(request, response);
	}
}
