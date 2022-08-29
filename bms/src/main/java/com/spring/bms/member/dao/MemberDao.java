package com.spring.bms.member.dao;

import com.spring.bms.member.dto.MemberDto;

public interface MemberDao {

	public String selectIdCheck(String id) throws Exception;
	public void insertMember(MemberDto memberDto) throws Exception;
	public MemberDto selectMember(MemberDto memberDto) throws Exception;
	public MemberDto selectOneMember(String id) throws Exception;
	public void updateMember(MemberDto memberDto) throws Exception;
	public void deleteMember(String id) throws Exception;
	public boolean selectAdminCheck(MemberDto memberDto) throws Exception;
	
}
