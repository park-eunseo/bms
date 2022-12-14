package com.spring.bms.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.spring.bms.admin.dto.ManagerNoticeDto;
import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.member.dto.MemberDto;

public interface AdminDao {
	public List<MemberDto> selectMemberList(Map<String, Object> memberMap) throws Exception;
	int selectTotalMemberCount(String searchWord) throws Exception;
	public int selectTotalPostCount(String memberId) throws Exception;
	public List<PostDto> selectPostList(Map<String, Object> postMap) throws Exception;
	public void deleteMember(String memberId) throws Exception;
	public void deletePost(String postId) throws Exception;
	
	public void insertNotice(ManagerNoticeDto managerNoticeDto) throws Exception;
	public int selectTotalNoticeCount() throws Exception;
	public List<ManagerNoticeDto> selectNoticeList(Map<String, Object> noticeMap) throws Exception;
	public ManagerNoticeDto selectOneNotice(String noticeId) throws Exception;
	public void deleteNotice(String noticeId) throws Exception;
	public void updateNotice(ManagerNoticeDto managerNoticeDto) throws Exception;

}
