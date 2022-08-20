package com.spring.bms.feed.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.member.dto.MemberDto;

@Repository
public class FeedDaoImpl implements FeedDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertPost(PostDto postDto) throws Exception {
		sqlSession.insert("feed.insertPost", postDto);
	}

	@Override
	public MemberDto selectOneMember(String id) throws Exception {
		return sqlSession.selectOne("feed.selectOneMember", id);
	}
	
	@Override
	public List<PostDto> selectPostList(String id) throws Exception {
		return sqlSession.selectList("feed.selectPostList", id);
	}

	@Override
	public PostDto selectOnePost(String postId) throws Exception {
		return sqlSession.selectOne("feed.selectOnePost", postId);
	}

	@Override
	public void updatePost(PostDto postDto) throws Exception {
		sqlSession.update("feed.updatePost", postDto);
	}

	@Override
	public void deletePost(String postId) throws Exception {
		sqlSession.delete("feed.deletePost", postId);
	}

}
