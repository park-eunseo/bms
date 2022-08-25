package com.spring.bms.feed.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.feed.dto.ReplyDto;
import com.spring.bms.manage.dto.LikeMemberDto;
import com.spring.bms.manage.dto.LikePostDto;
import com.spring.bms.member.dto.MemberDto;

@Repository
public class FeedDaoImpl implements FeedDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertPost(PostDto postDto) throws Exception {
		sqlSession.insert("feed.insertPost", postDto);
	}

	@Override
	public MemberDto selectOneMember(String id) throws Exception {
		return sqlSession.selectOne("feed.selectOneMember", id);
	}
	
	@Override
	public List<PostDto> selectPostList(Map<String, String> postMap) throws Exception {
		return sqlSession.selectList("feed.selectPostList", postMap);
	}

	@Override
	public PostDto selectOnePost(String postId) throws Exception {
		return sqlSession.selectOne("feed.selectOnePost", postId);
	}

	@Override
	public void updatePost(PostDto postDto) throws Exception {
		sqlSession.update("feed.updatePost", postDto);
	}

	@Override
	public void deletePost(String postId) throws Exception {
		sqlSession.delete("feed.deletePost", postId);
	}

	@Override
	public void insertReply(ReplyDto replyDto) throws Exception {
		sqlSession.insert("feed.insertReply", replyDto);
		sqlSession.update("feed.updateReplyAdd", replyDto);
	}

	@Override
	public void deleteReply(ReplyDto replyDto) throws Exception {
		sqlSession.update("feed.deleteReply", replyDto);
		sqlSession.update("feed.updateReplyCancel", replyDto);
	}
	
	@Override
	public void updateReply(ReplyDto replyDto) throws Exception {
		sqlSession.update("feed.updateReply", replyDto);
	}
	
	@Override
	public List<ReplyDto> selectReplyList(String postId) throws Exception {
		return sqlSession.selectList("feed.selectReplyList", postId);
	}

	@Override
	public boolean selectLikePost(LikePostDto likePostDto) throws Exception {	// 게시글 좋아요 유무 select
		boolean isLike = false;
		
		if(sqlSession.selectOne("feed.selectLikePost", likePostDto) != null) { // 결과값이 있으면 좋아요 버튼을 누른 것
			isLike = true;
		}

		return isLike;
	}

	@Override
	public boolean selectLikeMember(LikeMemberDto likeMemberDto) throws Exception {	
		boolean isLike = false;
		
		if(sqlSession.selectOne("feed.selectLikeMember", likeMemberDto) != null){
			isLike = true;
		}
		
		return isLike;
	}
	
	@Override
	public int selectLikeCount(String postId) throws Exception {
		return sqlSession.selectOne("feed.selectLikeCount", postId);
	}

	@Override
	public int selectReplyCount(String postId) throws Exception {
		return sqlSession.selectOne("feed.selectReplyCount", postId);
	}

}
