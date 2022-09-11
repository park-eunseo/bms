package com.spring.bms.category.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bms.category.dto.CategoryDto;

@Repository
public class CategoryDaoImpl implements CategoryDao {
	@Autowired
	private SqlSession sqlsession;

	@Override
	public boolean insertCategory(CategoryDto categoryDto) throws Exception {
		boolean isCheck = false;

		if (sqlsession.selectOne("category.isCategoryCheck", categoryDto) == null) { // 값이 없으면 중복 X
			isCheck = true;
			sqlsession.insert("category.insertCategory", categoryDto);
		}

		return isCheck;
	}

	@Override
	public List<CategoryDto> selectCategoryList(String id) throws Exception {
		return sqlsession.selectList("category.selectCategoryList", id);
	}

	@Override
	public boolean udpateCategory(CategoryDto categoryDto) throws Exception {
		boolean isCheck = false;

		if (sqlsession.selectOne("category.isCategoryCheck", categoryDto) == null) { // 값이 없으면 중복 X true 반환
			isCheck = true;
			sqlsession.update("category.updateCategory", categoryDto);
		}

		return isCheck;
	}

	@Override
	public void deleteCategory(CategoryDto categoryDto) throws Exception {
		sqlsession.update("category.updateBasicCategory", categoryDto);
		sqlsession.delete("category.deleteCategory", categoryDto);
	}

}
