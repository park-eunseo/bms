package com.spring.bms.blog.dao;

import java.util.List;

import com.spring.bms.blog.dto.PostDto;
import com.spring.bms.member.dto.MemberDto;

public interface BlogDao {

	public void insertPost(PostDto postDto) throws Exception;
	public List<PostDto> selectPostList(String id) throws Exception;
	public MemberDto selectOneMember(String id) throws Exception;
	public PostDto selectOnePost(String postId) throws Exception;
	public void updatePost(PostDto postDto) throws Exception;
	public void deletePost(String postId) throws Exception;
}
