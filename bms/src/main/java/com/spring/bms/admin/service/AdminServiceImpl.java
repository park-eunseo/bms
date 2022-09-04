package com.spring.bms.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bms.admin.dao.AdminDao;
import com.spring.bms.admin.dto.ManagerNoticeDto;
import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.member.dto.MemberDto;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public List<MemberDto> getMemberList(Map<String, Object> memberMap) throws Exception {
		return adminDao.selectMemberList(memberMap);
	}

	@Override
	public int getTotalMemberCount(String searchWord) throws Exception {
		return adminDao.selectTotalMemberCount(searchWord);
	}

	@Override
	public int getTotalPostCount(String memberId) throws Exception {
		return adminDao.selectTotalPostCount(memberId);
	}

	@Override
	public List<PostDto> getPostList(Map<String, Object> postMap) throws Exception {
		return adminDao.selectPostList(postMap);
	}

	@Override
	public void deleteMember(String memberId) throws Exception {
		adminDao.deleteMember(memberId);
	}

	@Override
	public void deletePost(String postId) throws Exception {
		adminDao.deletePost(postId);
	}

	@Override
	public void writeNotice(ManagerNoticeDto managerNoticeDto) throws Exception {
		adminDao.insertNotice(managerNoticeDto);
	}

	@Override
	public int getTotalNoticeCount() throws Exception {
		return adminDao.selectTotalNoticeCount();
	}

	@Override
	public List<ManagerNoticeDto> getNoticeList(Map<String, Object> noticeMap) throws Exception {
		return adminDao.selectNoticeList(noticeMap);
	}

	@Override
	public ManagerNoticeDto getOneNotice(String noticeId) throws Exception {
		return adminDao.selectOneNotice(noticeId);
	}

	@Override
	public void deleteNotice(String noticeId) throws Exception {
		adminDao.deleteNotice(noticeId);
	}

	@Override
	public void modifyNotice(ManagerNoticeDto managerNoticeDto) throws Exception {
		adminDao.updateNotice(managerNoticeDto);
	}
}
