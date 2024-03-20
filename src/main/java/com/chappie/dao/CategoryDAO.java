package com.chappie.dao;

import java.util.List;

import com.chappie.mapper.CategoryMapper;
import com.chappie.model.Category;

public class CategoryDAO extends AbstractDAO<Category> {

	public List<Category> findAll() {
		String sql = "select * from category";
		return query(sql, new CategoryMapper());
	}

}
