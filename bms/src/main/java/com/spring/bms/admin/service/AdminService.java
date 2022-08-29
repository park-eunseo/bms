package com.spring.bms.admin.service;

import java.util.List;
import java.util.Map;

import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.member.dto.MemberDto;

public interface AdminService {
	public List<MemberDto> getMemberList(Map<String, Object> memberMap) throws Exception;
	public int getTotalMemberCount() throws Exception;
	public int getTotalPostCount(String memberId) throws Exception;
	public List<PostDto> getPostList(Map<String, Object> postMap) throws Exception;

}
