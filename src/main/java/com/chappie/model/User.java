package com.chappie.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	private Long id;
	private String ho;
	private String ten;
	private String email;
	private String sdt;
	private String matKhau;
	private Date ngaySinh;
	private String diaChi;
	private Integer role;

	public User(String ho, String ten, String email, String sdt, String matKhau, String diaChi) {
		this.ho = ho;
		this.ten = ten;
		this.email = email;
		this.sdt = sdt;
		this.matKhau = matKhau;
		this.ngaySinh = null;
		this.diaChi = diaChi;
	}

}
