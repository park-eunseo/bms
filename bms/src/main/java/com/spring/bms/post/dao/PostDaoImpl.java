package com.spring.bms.post.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bms.post.dto.PostDto;

@Repository
public class PostDaoImpl implements PostDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertPost(PostDto postDto) throws Exception {
		sqlSession.insert("post.insertPost", postDto);
	}

}
