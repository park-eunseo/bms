package com.spring.bms.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public String mainHome() throws Exception {
		return "/mainHome";
	}
	
	@GetMapping("/search")
	public ModelAndView search(@RequestParam("searchKeyword") String searchKeyword,
								@RequestParam("searchWord") String searchWord) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchKeyword", searchKeyword);
		searchMap.put("searchWord", searchWord);
		
		List<Map<String, Object>> list = mainService.getSearchList(searchMap);
		for (Map<String, Object> map : list) {
			System.out.println(map.get("id"));
		}
		
		mv.addObject("searchList", list);

		if(searchKeyword.equals("member")) {
			mv.addObject("searchKeyword", "작성자");
		} else if(searchKeyword.equals("blogName")) {
			mv.addObject("searchKeyword", "블로그명");			
		} else {
			mv.addObject("searchKeyword", "게시글");	
		}
		
		mv.addObject("searchWord", searchWord);
		mv.setViewName("/search");
		
		return mv;
	}
}
