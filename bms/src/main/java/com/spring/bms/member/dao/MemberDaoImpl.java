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
		sqlSession.insert("member.insertDefaultCategory", memberDto.getId()); 
		// 회원가입하면서 기본 카테고리인 '전체'를 입력
	}

	@Override
	public MemberDto selectMember(MemberDto memberDto) throws Exception { // 회원 로그인
		sqlSession.update("member.updateRecentLogin", memberDto); // 로그인하면서 최근 접속일 수정
		return sqlSession.selectOne("member.selectLoginMember", memberDto);
	}

	@Override
	public MemberDto selectOneMember(String id) throws Exception {
		return sqlSession.selectOne("member.selectOneMember", id);
	}

	@Override
	public void updateMember(MemberDto memberDto) throws Exception {
		sqlSession.update("member.updateMember", memberDto);
	}

	@Override
	public void deleteMember(String id) throws Exception {
		sqlSession.update("feed.updateReplyDelete", id);
		sqlSession.delete("member.deleteMember", id);
	}

	@Override
	public boolean selectAdminCheck(MemberDto memberDto) throws Exception {
		boolean isAdmin = false;
		
		if(sqlSession.selectOne("member.selectAdminCheck", memberDto) != null) { // 로그인한 계정이 admin 계정과 동일하다면 반환할 값이 O
			isAdmin = true;
		}
		
		return isAdmin;
	}

}
