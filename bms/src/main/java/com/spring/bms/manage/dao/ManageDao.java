package com.spring.bms.manage.dao;

import java.util.List;
import java.util.Map;

import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.manage.dto.LikeMemberDto;
import com.spring.bms.manage.dto.LikePostDto;
import com.spring.bms.member.dto.MemberDto;

public interface ManageDao {

	public void insertLikePost(LikePostDto likePostDto) throws Exception;
	public void deleteLikePost(LikePostDto likePostDto) throws Exception;
	public void insertLikeMember(LikeMemberDto likeMemberDto) throws Exception;
	public void deleteLikeMember(LikeMemberDto likeMemberDto) throws Exception;
	public int selectTotalRowCount(Map<String, Object> countMap) throws Exception;
	public List<Map<String, Object>> selectManageList(Map<String, Object> manageMap) throws Exception;
}
