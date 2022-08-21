package com.spring.bms.category.service;

import java.util.List;

import com.spring.bms.category.dto.CategoryDto;

public interface CategoryService {

	public boolean addCategory(CategoryDto categoryDto) throws Exception;
	public List<CategoryDto> getCategoryList(String id) throws Exception;
	public boolean modifyCategory(CategoryDto categoryDto) throws Exception;
	public void deleteCategory(CategoryDto categoryDto) throws Exception;

}
