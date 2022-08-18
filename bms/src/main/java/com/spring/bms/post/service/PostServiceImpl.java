package com.spring.bms.post.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bms.post.dao.PostDao;
import com.spring.bms.post.dto.PostDto;

@Service
public class PostServiceImpl implements PostService {
	@Autowired
	private PostDao postDao;
	
	@Override
	public void addPost(PostDto postDto) throws Exception {	
		postDao.insertPost(postDto);
	}

}
