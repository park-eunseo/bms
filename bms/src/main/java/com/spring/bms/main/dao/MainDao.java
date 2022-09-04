package com.spring.bms.main.dao;

import java.util.List;
import java.util.Map;

import com.spring.bms.admin.dto.ManagerNoticeDto;
import com.spring.bms.feed.dto.PostDto;

public interface MainDao {

	public List<Map<String, Object>> selectSearchList(Map<String, Object> searchMap) throws Exception;
	public List<Map<String, Object>> selectFavoriteList(Map<String, Object> postMap) throws Exception;
	public int selectSearchResultCount(Map<String, Object> countMap) throws Exception;
	public int selectTotalPostCount(String id) throws Exception;
	public List<Map<String, Object>> selectRandomPost(String id) throws Exception;
	public List<ManagerNoticeDto> selectNoticeList() throws Exception;
	public ManagerNoticeDto selectOneNotice(String noticeId) throws Exception;

}
