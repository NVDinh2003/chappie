package com.chappie.service;

import java.util.List;

import javax.inject.Inject;

import com.chappie.dao.CartDAO;
import com.chappie.model.Cart;

public class CartService {

	@Inject
	private CartDAO cartDAO;

	public void addToCart(Cart cart) {
		cartDAO.addToCart(cart); // Sử dụng phương thức save của AbstractDAO để lưu Cart vào CSDL
	}

	public List<Cart> getCartItemsByUserId(Long userId) {
		return cartDAO.getCartItemsByUserId(userId);
	}

	public List<Cart> getAllPhoneItemsByUserId(Long userId) {
		return cartDAO.getAllPhoneItemsByUserId(userId);
	}

//	public Long existCartProductByProductId(long productId) {
//		return cartDAO.existCartProductByProductId(productId);
//	}

	public Cart getCartByUserIdAndProductId(Long userId, long productId) {
		return cartDAO.getCartByUserIdAndProductId(userId, productId);
	}

	public void updateCart(Cart existingCart) {
		cartDAO.updateCart(existingCart);

	}

	public void removeFromCart(Cart existingCart) {
		cartDAO.removeFromCart(existingCart);
	}

	public void updateQuantity(long itemId, int quantity) {
		cartDAO.updateQuantity(itemId, quantity);
	}

}
