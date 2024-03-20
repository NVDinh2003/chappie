package com.chappie.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.chappie.model.Cart;

public class CartMapper implements RowMapper<Cart> {

	@Override
	public Cart mapRow(ResultSet rs) {
		try {
			Cart cart = new Cart();
			cart.setId(rs.getLong("id"));
			cart.setUserId(rs.getLong("user_id"));
			cart.setProductId(rs.getLong("product_id"));
			cart.setQuantity(rs.getInt("quantity"));
			return cart;
		} catch (SQLException e) {
			return null;
		}

	}

}
