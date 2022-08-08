package com.spring.bms.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.spring.bms.member.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String selectIdCheck(String id) throws Exception {
		String registerIdCheck = "false";		
		if(sqlSession.selectOne("member.selectIdCheck", id) == null) registerIdCheck = "true";

		return registerIdCheck;
	}

	@Override
	public void insertMember(MemberDto memberDto) throws Exception {
		sqlSession.insert("member.insertMember", memberDto);
	}

	@Override
	public MemberDto selectMember(MemberDto memberDto) throws Exception {
		return sqlSession.selectOne("member.selectLoginMember", memberDto);
	}

	@Override
	public MemberDto selectOneMember(String id) throws Exception {
		return sqlSession.selectOne("member.selectOneMember", id);
	}

}
