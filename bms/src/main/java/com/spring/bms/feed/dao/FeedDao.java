package com.spring.bms.feed.dao;

import java.util.List;
import java.util.Map;

import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.feed.dto.ReplyDto;
import com.spring.bms.member.dto.MemberDto;

public interface FeedDao {

	public void insertPost(PostDto postDto) throws Exception;
	public List<PostDto> selectPostList(Map<String, String> postMap) throws Exception;
	public MemberDto selectOneMember(String id) throws Exception;
	public PostDto selectOnePost(String postId) throws Exception;
	public void updatePost(PostDto postDto) throws Exception;
	public void deletePost(String postId) throws Exception;
	public void insertReply(ReplyDto replyDto) throws Exception;
	public List<ReplyDto> selectReplyList(String postId) throws Exception;
	public void deleteReply(String replyId) throws Exception;
	public void updateReply(ReplyDto replyDto) throws Exception;
}
