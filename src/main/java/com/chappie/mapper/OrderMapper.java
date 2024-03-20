package com.chappie.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.chappie.model.Order;

public class OrderMapper implements RowMapper<Order> {

	@Override
	public Order mapRow(ResultSet rs) {
		try {
			Order order = new Order();
			order.setId(rs.getLong("id"));
			order.setUserId(rs.getLong("userId"));
			order.setCreatedDate(rs.getTimestamp("createdDate"));
			order.setPaymentMethod(rs.getString("paymentMethod"));
			order.setShippingAddress(rs.getString("shippingAddress"));
			order.setPhoneNumber(rs.getString("phoneNumber"));
			order.setStatus(rs.getInt("status"));
			order.setTotalPrice(rs.getFloat("totalPrice"));
			return order;
		} catch (SQLException e) {
			return null;
		}
	}
}
