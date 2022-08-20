package com.spring.bms.feed.service;

import java.util.List;

import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.member.dto.MemberDto;

public interface FeedService {
	public void addPost(PostDto postDto) throws Exception;
	public MemberDto getOneMember(String id) throws Exception;
	public List<PostDto> getPostList(String id) throws Exception;
	public PostDto getOnePost(String postId) throws Exception;
	public void modifyPost(PostDto postDto) throws Exception;
	public void deletePost(String postId) throws Exception;

}
