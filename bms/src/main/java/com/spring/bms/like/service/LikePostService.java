package com.spring.bms.like.service;

import com.spring.bms.like.dto.LikePostDto;

public interface LikePostService {

	public void addLikePost(LikePostDto likePostDto) throws Exception;
	public boolean getLikePost(LikePostDto likePostDto) throws Exception;
	public void notLikePost(LikePostDto likePostDto) throws Exception;

}
