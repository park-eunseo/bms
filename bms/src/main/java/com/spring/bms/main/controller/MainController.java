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
								@RequestParam(name = "sort", defaultValue = "") String sort,
								@RequestParam(name = "currentPage", defaultValue = "1") int currentPage) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int viewResultCount = 0;
		
		if(searchKeyword.equals("post")) {
			viewResultCount = 5; // 한 블록당 보여질 게시글 개수
		} else if(searchKeyword.equals("blogName")){
			viewResultCount = 10;
		} else {
			viewResultCount = 15;
		}
		
		int startIndex = (currentPage - 1) * viewResultCount; // 가져올 DB 시작 index
		
		Map<String, Object> listMap = new HashMap<>();
		listMap.put("searchKeyword", searchKeyword);
		listMap.put("searchWord", searchWord);
		listMap.put("startIndex", startIndex);
		listMap.put("viewResultCount", viewResultCount);
		
		if(sort != "") {
			listMap.put("sort", sort);
			mv.addObject("sort", sort);
		}
		
		Map<String, Object> countMap = new HashMap<>();
		countMap.put("searchKeyword", searchKeyword);
		countMap.put("searchWord", searchWord);
		
		int totalResultCount = mainService.getSearchResultCount(countMap); // 가져올 검색 결과 수 
		int addPage = totalResultCount % viewResultCount == 0 ? 0 : 1;
		int totalPageBlock = totalResultCount / viewResultCount + addPage; // 필요한 총 페이지 블럭 개수
		
		int startPageBlock = 1;
		
		if(currentPage % 5 == 0) startPageBlock = (currentPage / 5 - 1) * 5 + 1; // 시작 블록 번호
		else startPageBlock = (currentPage / 5) * 5 + 1;
		
		int endPageBlock = startPageBlock + 5 - 1; // 마지막 블록 번호
		
		if(endPageBlock > totalPageBlock) endPageBlock = totalPageBlock; // 끝 번호가 총 개수를 넘어간다면 끝 번호가 마지막
		
		if(viewResultCount > totalResultCount) { // 검색 결과 개수가 한 페이지에 보여질 결과 수보다 많으면 블록 하나만 필요
			startPageBlock = 1;
			endPageBlock = 0;
		}
		
		List<Map<String, Object>> list = mainService.getSearchList(listMap);
		
		if(searchKeyword.equals("post")) {
			for (Map<String, Object> map : list) {
				String content = map.get("content").toString().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
				map.put("content", content);
			}
		}
		
		mv.addObject("searchList", list);
		mv.addAllObjects(listMap);
		mv.addObject("startPageBlock", startPageBlock);
		mv.addObject("endPageBlock", endPageBlock);		
		mv.addObject("totalPageBlock", totalPageBlock);		
		mv.addObject("totalResultCount", totalResultCount);		
		mv.addObject("viewResultCount", viewResultCount);
		mv.addObject("currentPage", currentPage);
		mv.setViewName("/search");
		
		return mv;
	}
	
}
