package com.spring.bms.main.service;

import java.util.List;
import java.util.Map;

import com.spring.bms.admin.dto.ManagerNoticeDto;
import com.spring.bms.feed.dto.PostDto;

public interface MainService {

	public List<Map<String, Object>> getFavoriteList(Map<String, Object> postMap) throws Exception;
	public List<Map<String, Object>> getSearchList(Map<String, Object> searchMap) throws Exception;
	public int getSearchResultCount(Map<String, Object> countMap) throws Exception;
	public int getTotalPostCount(String id) throws Exception;
	public List<Map<String, Object>> getRandomPost(String id) throws Exception;
	public List<ManagerNoticeDto> getNoticeList() throws Exception;
	public ManagerNoticeDto getOneNotice(String noticeId) throws Exception;

}
