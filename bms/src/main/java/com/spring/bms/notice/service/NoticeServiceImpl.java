package com.spring.bms.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bms.notice.dao.NoticeDao;
import com.spring.bms.notice.dto.NoticeDto;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public void addNotice(NoticeDto noticeDto) throws Exception {
		noticeDao.insertNotice(noticeDto);
	}

	@Override
	public List<NoticeDto> getNoticeList(String id) throws Exception {
		return noticeDao.selectNoticeList(id);
	}

	@Override
	public int getNoticeCount(String id) throws Exception {
		return noticeDao.selectNoticeCount(id);
	}

}
