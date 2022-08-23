package com.spring.bms.like.dao;

import java.util.List;

import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.like.dto.LikeMemberDto;
import com.spring.bms.like.dto.LikePostDto;

public interface LikeDao {

	public void insertLikePost(LikePostDto likePostDto) throws Exception;
	public boolean selectLikePost(LikePostDto likePostDto) throws Exception;
	public void deleteLikePost(LikePostDto likePostDto) throws Exception;
	public int selectLikeCount(LikePostDto likePostDto) throws Exception;
	public List<PostDto> selectLikePostList(String id) throws Exception;
	public void insertLikeMember(LikeMemberDto likeMemberDto) throws Exception;

}
