package com.chappie.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
	private Long id;
	private Long userId;
	private Long productId;
	private int quantity;

	public Cart(Long userId, Long productId, int quantity) {
		super();
		this.userId = userId;
		this.productId = productId;
		this.quantity = quantity;
	}

	private Phone phone;

}
