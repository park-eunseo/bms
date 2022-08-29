package com.spring.bms.member.service;

import com.spring.bms.member.dto.MemberDto;

public interface MemberService {

	public boolean adminCheck(MemberDto memberDto) throws Exception;
	public String registerIdCheck(String id) throws Exception;
	public void addMember(MemberDto memberDto) throws Exception;
	public MemberDto selectMember(MemberDto memberDto) throws Exception;
	public MemberDto selectOneMember(String id) throws Exception;
	public void updateMember(MemberDto memberDto) throws Exception;
	public void deleteMember(String id) throws Exception;
}
