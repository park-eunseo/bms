package com.spring.bms.notice.service;

import java.util.List;

import com.spring.bms.notice.dto.NoticeDto;

public interface NoticeService {

	public void addNotice(NoticeDto noticeDto) throws Exception;
	public List<NoticeDto> getNoticeList(String id) throws Exception;

}
