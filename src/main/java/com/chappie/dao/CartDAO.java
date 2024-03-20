package com.chappie.dao;

import java.util.List;

import com.chappie.mapper.CartMapper;
import com.chappie.model.Cart;

public class CartDAO extends AbstractDAO<Cart> {

	public void addToCart(Cart cart) {
		String sql = "INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, ?);";
		insert(sql, cart.getUserId(), cart.getProductId(), cart.getQuantity());
	}

	public List<Cart> getCartItemsByUserId(Long userId) {

		String sql = "SELECT * FROM cart WHERE user_id = ?";
		List<Cart> listCart = query(sql, new CartMapper(), userId);
		return listCart.isEmpty() ? null : listCart;
	}

	public List<Cart> getAllPhoneItemsByUserId(Long userId) {
		String sql = "SELECT * FROM cart c join product p on c.product_id=p.id WHERE c.user_id = ?";
		List<Cart> listCart = query(sql, new CartMapper(), userId);
		return listCart.isEmpty() ? null : listCart;
	}

//	public Long existCartProductByProductId(long productId) {
//		String sql = "SELECT * FROM cart WHERE product_id = ?";
//		List<Cart> listCart = query(sql, new CartMapper(), productId);
//		return listCart.isEmpty() ? null : listCart.get(0).getProductId();
//	}

	public Cart getCartByUserIdAndProductId(Long userId, long productId) {
		String sql = "SELECT * FROM cart WHERE user_id = ? and product_id = ?";
		List<Cart> listCart = query(sql, new CartMapper(), userId, productId);
		return listCart.isEmpty() ? null : listCart.get(0);
	}

	public void updateCart(Cart existingCart) {
		String sql = "UPDATE cart SET quantity = ? WHERE (id = ?);";
		update(sql, existingCart.getQuantity(), existingCart.getId());
	}

	public void removeFromCart(Cart existingCart) {
		String sql = "DELETE FROM cart WHERE (id = ?);";
		update(sql, existingCart.getId());
	}

	public void updateQuantity(long itemId, int quantity) {
		String sql = "UPDATE cart SET quantity = ? WHERE (id = ?);";
		update(sql, quantity, itemId);

	}

}
