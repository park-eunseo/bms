package com.spring.bms.category.dao;

import java.util.List;

import com.spring.bms.category.dto.CategoryDto;

public interface CategoryDao {

	public boolean insertCategory(CategoryDto categoryDto) throws Exception;
	public List<CategoryDto> selectCategoryList(String id) throws Exception;

}
