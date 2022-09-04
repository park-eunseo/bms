package com.spring.bms.main.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bms.admin.dto.ManagerNoticeDto;
import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.main.dao.MainDao;

@Service
public class MainServiceImpl implements MainService {
	@Autowired
	private MainDao mainDao;
	
	@Override
	public List<Map<String, Object>> getSearchList(Map<String, Object> searchMap) throws Exception {
		return mainDao.selectSearchList(searchMap);
	}

	@Override
	public List<Map<String, Object>> getFavoriteList(Map<String, Object> postMap) throws Exception {
		return mainDao.selectFavoriteList(postMap);
	}

	@Override
	public int getSearchResultCount(Map<String, Object> countMap) throws Exception {
		return mainDao.selectSearchResultCount(countMap);
	}

	@Override
	public int getTotalPostCount(String id) throws Exception {
		return mainDao.selectTotalPostCount(id);
	}

	@Override
	public List<Map<String, Object>> getRandomPost(String id) throws Exception {
		return mainDao.selectRandomPost(id);
	}

	@Override
	public List<ManagerNoticeDto> getNoticeList() throws Exception {
		return mainDao.selectNoticeList();
	}

	@Override
	public ManagerNoticeDto getOneNotice(String noticeId) throws Exception {
		return mainDao.selectOneNotice(noticeId);
	}

}
