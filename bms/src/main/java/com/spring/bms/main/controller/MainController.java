package com.spring.bms.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bms.main.service.MainService;

@Controller
public class MainController {
	@Autowired
	private MainService mainService;
	
	@GetMapping("/")
	public ModelAndView mainHome(HttpServletRequest request) throws Exception {
		// 로그인 한 상태라면 즐겨찾는 회원 글 최신 기준 두세 개씩 가져와서 띄우기
		// 로그인 안 한 상태면 랜덤 게시글 세 개 가져와서 띄우기 
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		
		if((String)session.getAttribute("memberId") != null) {
			List<Map<String, Object>> list = mainService.getFavoriteList((String)session.getAttribute("memberId"));
			
			for (Map<String, Object> map : list) {
				String content = map.get("content").toString().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
				map.put("content", content);
			}
			
			mv.addObject("postList", list);	
		}
		
		mv.setViewName("/mainHome");
		
		return mv;
	}
	
	@GetMapping("/search")
	public ModelAndView search(@RequestParam("searchKeyword") String searchKeyword,
								@RequestParam("searchWord") String searchWord,
								@RequestParam(name = "sort", required = false) String sort) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchKeyword", searchKeyword);
		searchMap.put("searchWord", searchWord);
		
		if(sort != null) {
			searchMap.put("sort", sort);
			mv.addObject("sort", sort);
		}
		
		List<Map<String, Object>> list = mainService.getSearchList(searchMap);
		
		if(searchKeyword.equals("post")) {
			for (Map<String, Object> map : list) {
				String content = map.get("content").toString().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");

				map.put("content", content);
			}
		}
		
		mv.addObject("searchList", list);
		mv.addObject("searchWord", searchWord);
		mv.addObject("searchKeyword", searchKeyword);
		mv.setViewName("/search");
		
		return mv;
	}
	
}
