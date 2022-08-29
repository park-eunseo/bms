package com.spring.bms.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.member.dto.MemberDto;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MemberDto> selectMemberList(Map<String, Object> memberMap) throws Exception {
		return sqlSession.selectList("admin.selectMemberList", memberMap);
	}

	@Override
	public int selectTotalMemberCount() throws Exception {
		return sqlSession.selectOne("admin.selectTotalMemberCount");
	}

	@Override
	public int selectTotalPostCount(String memberId) throws Exception {
		return sqlSession.selectOne("admin.selectTotalPostCount", memberId);
	}

	@Override
	public List<PostDto> selectPostList(Map<String, Object> postMap) throws Exception {
		return sqlSession.selectList("admin.selectPostList", postMap);
	}
}
