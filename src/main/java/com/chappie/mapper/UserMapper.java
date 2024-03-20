package com.chappie.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.chappie.model.User;

public class UserMapper implements RowMapper<User> {

    @Override
    public User mapRow(ResultSet rs) {
	try {
	    User user = new User();
	    user.setId(rs.getLong("id"));
	    user.setHo(rs.getString("Ho"));
	    user.setTen(rs.getString("Ten"));
	    user.setEmail(rs.getString("Email"));
	    user.setSdt(rs.getString("SDT"));
	    user.setMatKhau(rs.getString("MatKhau"));
	    user.setNgaySinh(rs.getDate("NgaySinh"));
	    user.setDiaChi(rs.getString("DiaChi"));
	    user.setRole(rs.getInt("role"));

	    return user;
	} catch (SQLException e) {
	    return null;
	}
    }

}
