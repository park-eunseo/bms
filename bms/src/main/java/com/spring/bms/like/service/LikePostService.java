package com.spring.bms.like.service;

import java.util.List;

import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.like.dto.LikePostDto;

public interface LikePostService {

	public void addLikePost(LikePostDto likePostDto) throws Exception;
	public boolean getLikePost(LikePostDto likePostDto) throws Exception;
	public void notLikePost(LikePostDto likePostDto) throws Exception;
	public int getLikeCount(LikePostDto likePostDto) throws Exception;
	public List<PostDto> getLikePostList(String id) throws Exception;

}
