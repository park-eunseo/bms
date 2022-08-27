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
	public List<Map<String, Object>> selectPostList(Map<String, Object> postMap) throws Exception {
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
		// 하위 댓글(답댓글)이면 DB 완전 삭제
		if(sqlSession.selectOne("feed.selectCheckTopReply", replyDto) != null) {
			sqlSession.delete("feed.deleteReply", replyDto);
			sqlSession.update("feed.updateReplyCancel", replyDto);
		} 
		// 하위 댓글을 가지고 있지 않으면 DB 완전 삭제
		else if((int)sqlSession.selectOne("feed.selectCheckSubReply", replyDto) == 0) {
			sqlSession.delete("feed.deleteReply", replyDto);
			sqlSession.update("feed.updateReplyCancel", replyDto);
		} else {	// 하위 댓글을 가지고 있으면 내용만 삭제
			sqlSession.update("feed.deleteReplyContent", replyDto);
		}
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
	
	@Override
	public int selectToTalPostCount(Map<String, Object> countMap) throws Exception {
		return sqlSession.selectOne("feed.selectToTalPostCount", countMap);
	}

}
