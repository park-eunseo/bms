package com.spring.bms.feed.service;

import java.util.List;
import java.util.Map;

import org.springframework.util.MultiValueMap;

import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.feed.dto.ReplyDto;
import com.spring.bms.manage.dto.LikeMemberDto;
import com.spring.bms.manage.dto.LikePostDto;
import com.spring.bms.member.dto.MemberDto;

public interface FeedService {
	public void addPost(PostDto postDto) throws Exception;
	public MemberDto getOneMember(String id) throws Exception;
	public List<PostDto> getPostList(Map<String, String> postMap) throws Exception;
	public PostDto getOnePost(String postId) throws Exception;
	public void modifyPost(PostDto postDto) throws Exception;
	public void deletePost(String postId) throws Exception;
	public void writeReply(ReplyDto replyDto) throws Exception;
	public List<ReplyDto> getReplyList(String postId) throws Exception;
	public void deleteReply(ReplyDto replyDto) throws Exception;
	public void modifyReply(ReplyDto replyDto) throws Exception;
	
	public boolean getLikePost(LikePostDto likePostDto) throws Exception;
	public boolean getLikeMember(LikeMemberDto likeMemberDto) throws Exception;
	public int getLikeCount(String postId) throws Exception;
	public int getReplyCount(String postId) throws Exception;

}
