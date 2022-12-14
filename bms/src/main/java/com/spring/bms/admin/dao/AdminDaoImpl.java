package com.spring.bms.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.bms.admin.dto.ManagerNoticeDto;
import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.member.dto.MemberDto;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MemberDto> selectMemberList(Map<String, Object> memberMap) throws Exception {
		return sqlSession.selectList("admin.selectMemberList", memberMap);
	}

	@Override
	public int selectTotalMemberCount(String searchWord) throws Exception {
		return sqlSession.selectOne("admin.selectTotalMemberCount", searchWord);
	}

	@Override
	public int selectTotalPostCount(String memberId) throws Exception {
		return sqlSession.selectOne("admin.selectTotalPostCount", memberId);
	}

	@Override
	public List<PostDto> selectPostList(Map<String, Object> postMap) throws Exception {
		return sqlSession.selectList("admin.selectPostList", postMap);
	}

	@Override
	public void deleteMember(String memberId) throws Exception {
		sqlSession.delete("admin.deleteMember", memberId);
	}

	@Override
	public void deletePost(String postId) throws Exception {
		sqlSession.delete("admin.deletePost", postId);
	}

	@Override
	public void insertNotice(ManagerNoticeDto managerNoticeDto) throws Exception {
		sqlSession.insert("admin.insertNotice", managerNoticeDto);
	}
	
	@Override
	public void deleteNotice(String noticeId) throws Exception {
		sqlSession.delete("admin.deleteNotice", noticeId);
	}
	
	@Override
	public void updateNotice(ManagerNoticeDto managerNoticeDto) throws Exception {
		sqlSession.update("admin.updateNotice", managerNoticeDto);
	}

	@Override
	public int selectTotalNoticeCount() throws Exception {
		return sqlSession.selectOne("admin.selectTotalNoticeCount");
	}

	@Override
	public List<ManagerNoticeDto> selectNoticeList(Map<String, Object> noticeMap) throws Exception {
		return sqlSession.selectList("admin.selectNoticeList", noticeMap);
	}

	@Override
	public ManagerNoticeDto selectOneNotice(String noticeId) throws Exception {
		return sqlSession.selectOne("admin.selectOneNotice", noticeId);
	}
}
