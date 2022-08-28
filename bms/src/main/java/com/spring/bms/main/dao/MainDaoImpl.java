package com.spring.bms.main.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bms.feed.dto.PostDto;

@Repository
public class MainDaoImpl implements MainDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Map<String, Object>> selectSearchList(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("main.selectSearchList", searchMap);
	}

	@Override
	public List<Map<String, Object>> selectFavoriteList(Map<String, Object> postMap) throws Exception {
		return sqlSession.selectList("main.selectFavoritePostList", postMap);
	}

	@Override
	public int selectSearchResultCount(Map<String, Object> countMap) throws Exception {
		return sqlSession.selectOne("main.selectSearchResultCount", countMap);
	}

	@Override
	public int selectTotalPostCount(String id) throws Exception {
		return sqlSession.selectOne("main.selectTotalPostCount", id);
	}

	@Override
	public List<Map<String, Object>> selectRandomPost(String id) throws Exception {
		return sqlSession.selectList("main.selectRandomPost", id);
	}

}
