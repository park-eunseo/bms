package com.spring.bms.admin.service;

import java.util.List;
import java.util.Map;

import com.spring.bms.admin.dto.ManagerNoticeDto;
import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.member.dto.MemberDto;

public interface AdminService {
	public List<MemberDto> getMemberList(Map<String, Object> memberMap) throws Exception;
	public int getTotalMemberCount(String searchWord) throws Exception;
	public int getTotalPostCount(String memberId) throws Exception;
	public List<PostDto> getPostList(Map<String, Object> postMap) throws Exception;
	public void deleteMember(String memberId) throws Exception;
	public void deletePost(String postId) throws Exception;
	
	public void writeNotice(ManagerNoticeDto managerNoticeDto) throws Exception;
	public int getTotalNoticeCount() throws Exception;
	public List<ManagerNoticeDto> getNoticeList(Map<String, Object> noticeMap) throws Exception;
	public ManagerNoticeDto getOneNotice(String noticeId) throws Exception;
	public void deleteNotice(String noticeId) throws Exception;
	public void modifyNotice(ManagerNoticeDto managerNoticeDto) throws Exception;

}
