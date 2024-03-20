package com.chappie.dao;

import java.util.List;

import com.chappie.mapper.OrderMapper;
import com.chappie.model.Order;
import com.chappie.model.OrderDetail;

public class OrderDAO extends AbstractDAO<Order> {

	public Long addOrder(Order order) {
		String sql = "INSERT INTO orders(userId, createdDate, paymentMethod, shippingAddress, phoneNumber, status, totalPrice) VALUES (?, ?, ?, ?, ?, ?, ?)";
		return insert(sql, order.getUserId(), order.getCreatedDate(), order.getPaymentMethod(),
				order.getShippingAddress(), order.getPhoneNumber(), order.getStatus(), order.getTotalPrice());
	}

	public List<Order> getOrdersByUserId(Long userId) {
		String sql = "SELECT * FROM orders WHERE userId=?";
		List<Order> listOrder = query(sql, new OrderMapper(), userId);
		return listOrder.isEmpty() ? null : listOrder;
	}

	public void addOrderDetail(OrderDetail orderDetail) {

	}
}
