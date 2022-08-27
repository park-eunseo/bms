package com.spring.bms.manage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.manage.dto.LikeMemberDto;
import com.spring.bms.manage.dto.LikePostDto;
import com.spring.bms.member.dto.MemberDto;

@Repository
public class ManageDaoImpl implements ManageDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertLikePost(LikePostDto likePostDto) throws Exception { 		// 좋아하는 게시글 insert
		sqlSession.insert("manage.insertLikePost", likePostDto);
		sqlSession.update("manage.updateLikeAdd", likePostDto);
	}

	@Override
	public void deleteLikePost(LikePostDto likePostDto) throws Exception {		// 좋아요 한 게시글 취소 
		sqlSession.delete("manage.deleteLikePost", likePostDto);
		sqlSession.update("manage.updateLikeCancel", likePostDto);
	}

	@Override
	public void insertLikeMember(LikeMemberDto likeMemberDto) throws Exception { // 좋아하는 회원 insert
		sqlSession.insert("manage.insertLikeMember", likeMemberDto);
	}

	@Override
	public void deleteLikeMember(LikeMemberDto likeMemberDto) throws Exception { // 좋아하는 회원 delete
		sqlSession.delete("manage.deleteLikeMember", likeMemberDto);
	}

	@Override
	public int selectTotalRowCount(Map<String, Object> countMap) throws Exception {
		return sqlSession.selectOne("manage.selectTotalRowCount", countMap);
	}

	@Override
	public List<Map<String, Object>> selectManageList(Map<String, Object> manageMap) throws Exception {
		return sqlSession.selectList("manage.selectManageList", manageMap);
	}

}
