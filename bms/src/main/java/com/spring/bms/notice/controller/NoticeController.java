package com.spring.bms.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bms.notice.dto.NoticeDto;
import com.spring.bms.notice.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@PostMapping("/addNotice")
	public void insertNotice(NoticeDto noticeDto) throws Exception {
		noticeService.addNotice(noticeDto);
	}
	
	@ResponseBody
	@GetMapping("/noticeList")
	public List<NoticeDto> selectNoticeList(String id) throws Exception {
		List<NoticeDto> noticeList = noticeService.getNoticeList(id);
		
		for (NoticeDto noticeDto : noticeList) {
			String content = noticeDto.getContent().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");	
			
			if(content.length() > 13) {
				noticeDto.setContent(content.substring(0, 13) + "...");
			}
		}
		return noticeList;
	}
	
	@ResponseBody
	@GetMapping("/noticeCount")
	public int getNoticeCount(String id) throws Exception {
		return noticeService.getNoticeCount(id);
	}
	
	@GetMapping("/deleteNotice")
	public void deleteNoticr(NoticeDto noticeDto) throws Exception {
		noticeService.deleteNotice(noticeDto);
	}
}
