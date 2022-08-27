package com.spring.bms.manage.service;

import java.util.List;
import java.util.Map;

import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.manage.dto.LikeMemberDto;
import com.spring.bms.manage.dto.LikePostDto;
import com.spring.bms.member.dto.MemberDto;

public interface ManageService {

	public void addLikePost(LikePostDto likePostDto) throws Exception;
	public void notLikePost(LikePostDto likePostDto) throws Exception;
	public void addLikeMember(LikeMemberDto likeMemberDto) throws Exception;
	public void notLikeMember(LikeMemberDto likeMemberDto) throws Exception;
	public int getTotalRowCount(Map<String, Object> countMap) throws Exception;
	public List<Map<String, Object>> getManageList(Map<String, Object> manageMap) throws Exception;
}
