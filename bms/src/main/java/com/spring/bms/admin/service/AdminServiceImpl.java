package com.spring.bms.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bms.admin.dao.AdminDao;
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
	public int getTotalMemberCount() throws Exception {
		return adminDao.selectTotalMemberCount();
	}

	@Override
	public int getTotalPostCount(String memberId) throws Exception {
		return adminDao.selectTotalPostCount(memberId);
	}

	@Override
	public List<PostDto> getPostList(Map<String, Object> postMap) throws Exception {
		return adminDao.selectPostList(postMap);
	}

}
