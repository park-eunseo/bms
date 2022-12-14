package com.spring.bms.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.bms.member.dao.MemberDao;
import com.spring.bms.member.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public String registerIdCheck(String id) throws Exception{
		return memberDao.selectIdCheck(id);
	}

	@Override
	public void addMember(MemberDto memberDto) throws Exception {
		memberDao.insertMember(memberDto);
	}

	@Override
	public MemberDto selectMember(MemberDto memberDto) throws Exception {
		return memberDao.selectMember(memberDto);
	}

	@Override
	public MemberDto selectOneMember(String id) throws Exception {
		return memberDao.selectOneMember(id);
	}

	@Override
	public void updateMember(MemberDto memberDto) throws Exception {
		 memberDao.updateMember(memberDto);
	}

	@Override
	public void deleteMember(String id) throws Exception {
		memberDao.deleteMember(id);
	}

	@Override
	public boolean adminCheck(MemberDto memberDto) throws Exception {
		return memberDao.selectAdminCheck(memberDto);
	}

	@Override
	public boolean getMemberCheck(MemberDto memberDto) throws Exception {
		return memberDao.selectMemberCheck(memberDto);
	}

	@Override
	public void updateNewPassword(MemberDto memberDto) throws Exception {
		memberDao.updateNewPassword(memberDto);
	}
}
