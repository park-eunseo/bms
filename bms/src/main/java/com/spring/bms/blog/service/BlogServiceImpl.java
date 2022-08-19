package com.spring.bms.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bms.blog.dao.BlogDao;
import com.spring.bms.blog.dto.PostDto;
import com.spring.bms.member.dto.MemberDto;

@Service
public class BlogServiceImpl implements BlogService {
	@Autowired
	private BlogDao postDao;
	
	@Override
	public void addPost(PostDto postDto) throws Exception {	
		postDao.insertPost(postDto);
	}
	
	@Override
	public MemberDto getOneMember(String id) throws Exception {
		return postDao.selectOneMember(id);
	}

	@Override
	public List<PostDto> getPostList(String id) throws Exception {
		return postDao.selectPostList(id);
	}

	@Override
	public PostDto getOnePost(String postId) throws Exception {
		return postDao.selectOnePost(postId);
	}

	@Override
	public void modifyPost(PostDto postDto) throws Exception {
		postDao.updatePost(postDto);
	}

	@Override
	public void deletePost(String postId) throws Exception {
		postDao.deletePost(postId);
	}


}
