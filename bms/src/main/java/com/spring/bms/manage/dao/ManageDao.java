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
	public List<PostDto> selectLikePostList(String id) throws Exception;
	public void insertLikeMember(LikeMemberDto likeMemberDto) throws Exception;
	public void deleteLikeMember(LikeMemberDto likeMemberDto) throws Exception;
	public List<MemberDto> selectLikeMemberList(String id) throws Exception;
	public List<Map<String, String>> selectMyReplyList(String id) throws Exception;


}
