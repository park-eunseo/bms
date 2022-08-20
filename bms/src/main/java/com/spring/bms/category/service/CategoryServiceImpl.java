package com.spring.bms.category.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bms.category.dao.CategoryDao;
import com.spring.bms.category.dto.CategoryDto;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDao categoryDao;
	
	@Override
	public boolean addCategory(CategoryDto categoryDto) throws Exception {
		return categoryDao.insertCategory(categoryDto);
	}

	@Override
	public List<CategoryDto> getCategoryList(String id) throws Exception {
		return categoryDao.selectCategoryList(id);
	}


}
