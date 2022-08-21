package com.spring.bms.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bms.like.dao.LikePostDao;
import com.spring.bms.like.dto.LikePostDto;

@Service
public class LikePostServiceImpl implements LikePostService {
	@Autowired
	private LikePostDao likePostDao;
	
	@Override
	public void addLikePost(LikePostDto likePostDto) throws Exception {
		likePostDao.insertLikePost(likePostDto);
	}

	@Override
	public boolean getLikePost(LikePostDto likePostDto) throws Exception {
		return likePostDao.selectLikePost(likePostDto);
	}

	@Override
	public void notLikePost(LikePostDto likePostDto) throws Exception {
		likePostDao.deleteLikePost(likePostDto);
	}

}
