package com.spring.bms.like.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bms.like.dto.LikePostDto;

@Repository
public class LikePostDaoImpl implements LikePostDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertLikePost(LikePostDto likePostDto) throws Exception {
		sqlSession.insert("like.insertLikePost", likePostDto);
	}

	@Override
	public boolean selectLikePost(LikePostDto likePostDto) throws Exception {
		boolean isLike = false;
		
		if(sqlSession.selectOne("like.selectLikePost", likePostDto) != null) { // 결과값이 있으면 좋아요 버튼을 누른 것
			isLike = true;
		}

		return isLike;
	}

	@Override
	public void deleteLikePost(LikePostDto likePostDto) throws Exception {
		sqlSession.delete("like.deleteLikePost", likePostDto);
	}

}
