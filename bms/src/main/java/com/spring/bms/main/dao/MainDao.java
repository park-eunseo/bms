package com.spring.bms.main.dao;

import java.util.List;
import java.util.Map;

import com.spring.bms.feed.dto.PostDto;

public interface MainDao {

	public List<Map<String, Object>> selectSearchList(Map<String, Object> searchMap) throws Exception;
	public List<Map<String, Object>> selectFavoriteList(String id) throws Exception;
	public int selectSearchResultCount(Map<String, Object> countMap) throws Exception;

}
