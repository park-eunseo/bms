package com.spring.bms.main.service;

import java.util.List;
import java.util.Map;

import com.spring.bms.feed.dto.PostDto;

public interface MainService {

	public List<Map<String, Object>> getFavoriteList(Map<String, Object> postMap) throws Exception;
	public List<Map<String, Object>> getSearchList(Map<String, Object> searchMap) throws Exception;
	public int getSearchResultCount(Map<String, Object> countMap) throws Exception;
	public int getTotalPostCount(String id) throws Exception;

}
