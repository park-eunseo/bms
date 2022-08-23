package com.spring.bms.like.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.like.dao.LikeDao;
import com.spring.bms.like.dto.LikeMemberDto;
import com.spring.bms.like.dto.LikePostDto;

@Service
public class LikeServiceImpl implements LikeService {
	@Autowired
	private LikeDao likeDao;
	
	@Override
	public void addLikePost(LikePostDto likePostDto) throws Exception {
		likeDao.insertLikePost(likePostDto);
	}

	@Override
	public boolean getLikePost(LikePostDto likePostDto) throws Exception {
		return likeDao.selectLikePost(likePostDto);
	}

	@Override
	public void notLikePost(LikePostDto likePostDto) throws Exception {
		likeDao.deleteLikePost(likePostDto);
	}

	@Override
	public int getLikeCount(LikePostDto likePostDto) throws Exception {
		return likeDao.selectLikeCount(likePostDto);
	}

	@Override
	public List<PostDto> getLikePostList(String id) throws Exception {
		return likeDao.selectLikePostList(id);
	}

	@Override
	public void addLikeMember(LikeMemberDto likeMemberDto) throws Exception {
		likeDao.insertLikeMember(likeMemberDto);
	}
}
