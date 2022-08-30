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
	public boolean getMemberCheck(MemberDto memberDto) throws Exception; // 새 비밀번호 지정을 위한 회원 정보 확인
	public void updateNewPassword(MemberDto memberDto) throws Exception;
}
