package com.spring.bms.manage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.manage.dao.ManageDao;
import com.spring.bms.manage.dto.LikeMemberDto;
import com.spring.bms.manage.dto.LikePostDto;
import com.spring.bms.member.dto.MemberDto;

@Service
public class ManageServiceImpl implements ManageService {
	@Autowired
	private ManageDao manageDao;
	
	@Override
	public void addLikePost(LikePostDto likePostDto) throws Exception {
		manageDao.insertLikePost(likePostDto);
	}

	@Override
	public void notLikePost(LikePostDto likePostDto) throws Exception {
		manageDao.deleteLikePost(likePostDto);
	}

	@Override
	public void addLikeMember(LikeMemberDto likeMemberDto) throws Exception {
		manageDao.insertLikeMember(likeMemberDto);
	}

	@Override
	public void notLikeMember(LikeMemberDto likeMemberDto) throws Exception {
		manageDao.deleteLikeMember(likeMemberDto);
	}

	@Override
	public int getTotalRowCount(Map<String, Object> countMap) throws Exception {
		return manageDao.selectTotalRowCount(countMap);
	}

	@Override
	public List<Map<String, Object>> getManageList(Map<String, Object> manageMap) throws Exception {
		return manageDao.selectManageList(manageMap);
	}
}
