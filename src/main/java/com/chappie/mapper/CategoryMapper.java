package com.chappie.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.chappie.model.Category;

public class CategoryMapper implements RowMapper<Category> {

    @Override
    public Category mapRow(ResultSet rs) {
	try {
	    Category manuModel = new Category();
	    manuModel.setMaHangSX(rs.getString("MaHangSX"));
	    manuModel.setTenHangSX(rs.getString("TenHangSX"));

	    return manuModel;
	} catch (SQLException e) {
	    return null;
	}
    }

}
