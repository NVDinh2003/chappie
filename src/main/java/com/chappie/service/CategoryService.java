package com.chappie.service;

import java.util.List;

import javax.inject.Inject;

import com.chappie.dao.CategoryDAO;
import com.chappie.model.Category;

public class CategoryService {

	@Inject
	private CategoryDAO manuDAO;

	public List<Category> findAll() {
		return manuDAO.findAll();
	}

}
