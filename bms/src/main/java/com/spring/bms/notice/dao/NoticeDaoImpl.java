package com.spring.bms.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.spring.bms.notice.dto.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertNotice(NoticeDto noticeDto) throws Exception {
		sqlSession.insert("notice.insertNotice", noticeDto);
	}

	@Override
	public List<NoticeDto> selectNoticeList(String id) throws Exception {
		return sqlSession.selectList("notice.selectNoticeList", id);
	}

}
