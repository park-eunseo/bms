package com.spring.bms.main.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
