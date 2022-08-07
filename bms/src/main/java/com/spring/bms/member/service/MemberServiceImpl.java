package com.spring.bms.member.service;

import org.springframework.beans.factory.annotation.Autowired;
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
}
