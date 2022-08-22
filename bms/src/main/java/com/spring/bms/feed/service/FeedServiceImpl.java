package com.spring.bms.feed.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bms.feed.dao.FeedDao;
import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.member.dto.MemberDto;

@Service
public class FeedServiceImpl implements FeedService {
	@Autowired
	private FeedDao feedDao;
	
	@Override
	public void addPost(PostDto postDto) throws Exception {	
		feedDao.insertPost(postDto);
	}
	
	@Override
	public MemberDto getOneMember(String id) throws Exception {
		return feedDao.selectOneMember(id);
	}

	@Override
	public List<PostDto> getPostList(Map<String, String> postMap) throws Exception {
		return feedDao.selectPostList(postMap);
	}

	@Override
	public PostDto getOnePost(String postId) throws Exception {
		return feedDao.selectOnePost(postId);
	}

	@Override
	public void modifyPost(PostDto postDto) throws Exception {
		feedDao.updatePost(postDto);
	}

	@Override
	public void deletePost(String postId) throws Exception {
		feedDao.deletePost(postId);
	}


}
