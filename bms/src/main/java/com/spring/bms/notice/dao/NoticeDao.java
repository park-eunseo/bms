package com.spring.bms.notice.dao;

import java.util.List;

import com.spring.bms.notice.dto.NoticeDto;

public interface NoticeDao {

	public void insertNotice(NoticeDto noticeDto) throws Exception;
	public List<NoticeDto> selectNoticeList(String id) throws Exception;
	public int selectNoticeCount(String id) throws Exception;
	public void deleteNotice(NoticeDto noticeDto) throws Exception;

}
