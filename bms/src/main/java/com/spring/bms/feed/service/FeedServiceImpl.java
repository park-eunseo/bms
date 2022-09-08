package com.spring.bms.feed.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bms.feed.dao.FeedDao;
import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.feed.dto.ReplyDto;
import com.spring.bms.manage.dto.LikeMemberDto;
import com.spring.bms.manage.dto.LikePostDto;
import com.spring.bms.member.dto.MemberDto;

@Service
public class FeedServiceImpl implements FeedService {
	@Autowired
	private FeedDao feedDao;
	
	@Override
	public MemberDto getOneMember(String id) throws Exception {
		return feedDao.selectOneMember(id);
	}

	@Override
	public List<Map<String, Object>> getPostList(Map<String, Object> postMap) throws Exception {
		return feedDao.selectPostList(postMap);
	}

	@Override
	public PostDto getOnePost(String postId) throws Exception {
		return feedDao.selectOnePost(postId);
	}

	@Override
	public void addPost(PostDto postDto) throws Exception {	
		feedDao.insertPost(postDto);
	}
	
	@Override
	public void modifyPost(PostDto postDto) throws Exception {
		feedDao.updatePost(postDto);
	}

	@Override
	public void deletePost(String postId) throws Exception {
		feedDao.deletePost(postId);
	}

	@Override
	public void writeReply(ReplyDto replyDto) throws Exception {
		feedDao.insertReply(replyDto);
	}
	
	@Override
	public void modifyReply(ReplyDto replyDto) throws Exception {
		feedDao.updateReply(replyDto);
	}

	@Override
	public void deleteReply(ReplyDto replyDto) throws Exception {
		feedDao.deleteReply(replyDto);
	}
	
	@Override
	public List<ReplyDto> getReplyList(String postId) throws Exception {
		return feedDao.selectReplyList(postId);
	}

	@Override
	public boolean getLikeMember(LikeMemberDto likeMemberDto) throws Exception {
		return feedDao.selectLikeMember(likeMemberDto);
	}

	@Override
	public boolean getLikePost(LikePostDto likePostDto) throws Exception {
		return feedDao.selectLikePost(likePostDto);
	}

	@Override
	public int getLikeCount(String postId) throws Exception {
		return feedDao.selectLikeCount(postId);
	}

	@Override
	public int getReplyCount(String postId) throws Exception {
		return feedDao.selectReplyCount(postId);
	}

	@Override
	public int getTotalPostCount(Map<String, Object> countMap) throws Exception {
		return feedDao.selectTotalPostCount(countMap);
	}

}
