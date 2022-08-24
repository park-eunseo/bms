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
	private SqlSession SqlSession;
	
	@Override
	public List<Map<String, Object>> selectSearchList(Map<String, Object> searchMap) throws Exception {
		return SqlSession.selectList("main.selectSearchList", searchMap);
	}

}
