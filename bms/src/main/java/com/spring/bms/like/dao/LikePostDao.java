package com.spring.bms.like.dao;

import com.spring.bms.like.dto.LikePostDto;

public interface LikePostDao {

	public void insertLikePost(LikePostDto likePostDto) throws Exception;
	public boolean selectLikePost(LikePostDto likePostDto) throws Exception;
	public void deleteLikePost(LikePostDto likePostDto) throws Exception;

}
