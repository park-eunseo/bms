package com.spring.bms.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bms.admin.service.AdminService;
import com.spring.bms.feed.dto.PostDto;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@GetMapping("")
	public ModelAndView admin(HttpServletRequest request, 
							@RequestParam(name="searchWord", defaultValue = "") String searchWord,
							@RequestParam(name="currentPage", defaultValue = "1") int currentPage) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int viewMemberCount = 10;
		int startIndex = (currentPage - 1) * viewMemberCount;
		
		Map<String, Object> memberMap = new HashMap<>();
		memberMap.put("searchWord", searchWord);
		memberMap.put("startIndex", startIndex);
		memberMap.put("viewMemberCount", viewMemberCount);
		
		int totalMemberCount = adminService.getTotalMemberCount(searchWord);
		int addPage = totalMemberCount % viewMemberCount == 0 ? 0 : 1;
		int totalPageBlock = totalMemberCount / viewMemberCount + addPage;
		
		int startPageBlock = 1;
		
		if(currentPage % 5 == 0) startPageBlock = (currentPage / 5 - 1) * 5 + 1; // 시작 블록 번호
		else startPageBlock = (currentPage / 5) * 5 + 1;
		
		int endPageBlock = startPageBlock + 5 - 1; // 마지막 블록 번호
		
		if(endPageBlock > totalPageBlock) endPageBlock = totalPageBlock; 
		
		if(viewMemberCount > totalMemberCount) {
			startPageBlock = 1;
			endPageBlock = 0;
		}	
		
		mv.addObject("memberList", adminService.getMemberList(memberMap));
		mv.addObject("startPageBlock", startPageBlock);
		mv.addObject("endPageBlock", endPageBlock);		
		mv.addObject("totalPageBlock", totalPageBlock);		
		mv.addObject("totalMemberCount", totalMemberCount);	  	
		mv.addObject("currentPage", currentPage);	
		mv.setViewName("/adminHome");
		
		return mv;
	}
	
	@GetMapping("/postList")
	public ModelAndView postList(HttpServletRequest request, 
			@RequestParam(name="currentPage", defaultValue = "1") int currentPage,
			@RequestParam("id") String memberId) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int viewPostCount = 10;
		int startIndex = (currentPage - 1) * viewPostCount;
		
		Map<String, Object> postMap = new HashMap<>();
		postMap.put("memberId", memberId);
		postMap.put("startIndex", startIndex);
		postMap.put("viewPostCount", viewPostCount);
		
		int totalPostCount = adminService.getTotalPostCount(memberId);
		int addPage = totalPostCount % viewPostCount == 0 ? 0 : 1;
		int totalPageBlock = totalPostCount / viewPostCount + addPage;
		
		int startPageBlock = 1;
		
		if(currentPage % 5 == 0) startPageBlock = (currentPage / 5 - 1) * 5 + 1; // 시작 블록 번호
		else startPageBlock = (currentPage / 5) * 5 + 1;
		
		int endPageBlock = startPageBlock + 5 - 1; // 마지막 블록 번호
		
		if(endPageBlock > totalPageBlock) endPageBlock = totalPageBlock; 
		
		if(viewPostCount > totalPostCount) {
			startPageBlock = 1;
			endPageBlock = 0;
		}	
		
		List<PostDto> postList = adminService.getPostList(postMap);
		
		for (PostDto postDto : postList) {
			String content = postDto.getContent().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
			postDto.setContent(content);
		}
		
		mv.addObject("postList", postList);
		mv.addObject("memberId", memberId);
		mv.addObject("startPageBlock", startPageBlock);
		mv.addObject("endPageBlock", endPageBlock);		
		mv.addObject("totalPageBlock", totalPageBlock);		
		mv.addObject("totalPostCount", totalPostCount);	  	
		mv.addObject("currentPage", currentPage);	
		mv.setViewName("admin/postList");
		
		return mv;
	}
	
	@GetMapping("/deleteMember") // 관리자의 회원 삭제
	public ResponseEntity<Object> deleteMember(@RequestParam("id") String memberId) throws Exception{
		adminService.deleteMember(memberId);
		return new ResponseEntity<Object>(HttpStatus.OK);	
	}
	
	@GetMapping("/deletePost")	// 관리자의 게시글 삭제
	public ResponseEntity<Object> deletePost(@RequestParam("postId") String postId) throws Exception{
		adminService.deletePost(postId);
		return new ResponseEntity<Object>(HttpStatus.OK);	
	}
}
