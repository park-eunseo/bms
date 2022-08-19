package com.spring.bms.blog.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bms.blog.dto.PostDto;
import com.spring.bms.member.dto.MemberDto;

@Repository
public class BlogDaoImpl implements BlogDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertPost(PostDto postDto) throws Exception {
		sqlSession.insert("blog.insertPost", postDto);
	}

	@Override
	public MemberDto selectOneMember(String id) throws Exception {
		return sqlSession.selectOne("blog.selectOneMember", id);
	}
	
	@Override
	public List<PostDto> selectPostList(String id) throws Exception {
		return sqlSession.selectList("blog.selectPostList", id);
	}

	@Override
	public PostDto selectOnePost(String postId) throws Exception {
		return sqlSession.selectOne("blog.selectOnePost", postId);
	}

	@Override
	public void updatePost(PostDto postDto) throws Exception {
		sqlSession.update("blog.updatePost", postDto);
	}

	@Override
	public void deletePost(String postId) throws Exception {
		sqlSession.delete("blog.deletePost", postId);
	}

}
