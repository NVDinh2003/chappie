package com.chappie.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
	private Long id;
	private Long userId;
	private Date createdDate;
	private String paymentMethod;
	private String shippingAddress;
	private String phoneNumber;
	private int status;
	private float totalPrice;

}
