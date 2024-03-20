package com.chappie.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.chappie.model.OrderDetail;

public class OrderDetailMapper implements RowMapper<OrderDetail> {

	@Override
	public OrderDetail mapRow(ResultSet rs) {
		try {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setId(rs.getLong("id"));
			orderDetail.setOrderId(rs.getLong("orderId"));
			orderDetail.setProductId(rs.getLong("productId"));
			orderDetail.setQuantity(rs.getInt("quantity"));
			orderDetail.setPrice(rs.getDouble("price"));
			return orderDetail;
		} catch (SQLException e) {
			return null;
		}
	}
}
