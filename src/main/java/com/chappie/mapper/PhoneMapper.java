package com.chappie.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.chappie.model.Phone;

public class PhoneMapper implements RowMapper<Phone> {

	@Override
	public Phone mapRow(ResultSet rs) {
		try {

			Phone phone = new Phone();
			phone.setId(rs.getLong("id"));
			phone.setMaHangSX(rs.getString("MaHangSX"));
			phone.setTenDT(rs.getString("TenDT"));
			phone.setDonGia(rs.getLong("DonGia"));
			phone.setRAM(rs.getInt("RAM"));
			phone.setDungLuong(rs.getString("DungLuong"));
			phone.setImage1(rs.getString("image1"));
			phone.setImage2(rs.getString("image2"));
			phone.setChiTiet(rs.getString("ChiTiet"));
			phone.setS_image(rs.getString("s_image"));

			return phone;
		} catch (SQLException e) {
			return null;
		}

	}

}
