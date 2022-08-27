package com.spring.bms.manage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.manage.dto.LikeMemberDto;
import com.spring.bms.manage.dto.LikePostDto;
import com.spring.bms.manage.service.ManageService;

@Controller
@RequestMapping("/manage")
public class ManageController {
	@Autowired
	private ManageService manageService;
	
	@GetMapping("/manageList")
	public ModelAndView manageList(HttpServletRequest request,
									@RequestParam(name="manage", defaultValue = "member") String manage,
									@RequestParam(name="currentPage", defaultValue = "1") int currentPage) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		String id = (String)session.getAttribute("memberId");
		
		int viewRowCount = 10;
		int startIndex = (currentPage - 1) * viewRowCount;
		
		Map<String, Object> manageMap = new HashMap<>();
		manageMap.put("id", id);
		manageMap.put("manage", manage);
		manageMap.put("viewRowCount", viewRowCount);
		manageMap.put("startIndex", startIndex);
		
		Map<String, Object> countMap = new HashMap<>();
		countMap.put("id", id);
		countMap.put("manage", manage);
		
		int totalRowCount = manageService.getTotalRowCount(countMap);
		int addPage = totalRowCount % viewRowCount == 0 ? 0 : 1;
		int totalPageBlock = totalRowCount / viewRowCount + addPage;
		
		int startPageBlock = 1;
		
		if(currentPage % 5 == 0) startPageBlock = (currentPage / 5 - 1) * 5 + 1; // 시작 블록 번호
		else startPageBlock = (currentPage / 5) * 5 + 1;
		
		int endPageBlock = startPageBlock + 5 - 1; // 마지막 블록 번호
		
		if(endPageBlock > totalPageBlock) endPageBlock = totalPageBlock; 
		
		if(viewRowCount > totalRowCount) {
			startPageBlock = 1;
			endPageBlock = 0;
		}	
		
		List<Map<String, Object>> manageList = manageService.getManageList(manageMap);
		
		if(manage.equals("post")) {
			for (Map<String, Object> map : manageList) {
				String content = map.get("content").toString().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");	
				map.put("content", content);
			}	
		}
		
		mv.addObject("manageList", manageList);
		mv.addObject("manage", manage);
		mv.addObject("startPageBlock", startPageBlock);
		mv.addObject("endPageBlock", endPageBlock);		
		mv.addObject("totalPageBlock", totalPageBlock);		
		mv.addObject("totalRowCount", totalRowCount);	  	
		mv.addObject("currentPage", currentPage);	
		mv.setViewName("/manageList");
		
		return mv;
	}
	
	@GetMapping("/likePost") // 좋아요 버튼 눌렀을 때 값 insert
	public ResponseEntity<Object> likePost(LikePostDto likePostDto) throws Exception {
		manageService.addLikePost(likePostDto);

		return new ResponseEntity<Object>(HttpStatus.OK);
	}
	
	
	@GetMapping("/notLikePost")  // 좋아요 버튼 취소했을 때 값 delete
	public ResponseEntity<Object> notLikePost(HttpServletRequest request, LikePostDto likePostDto) throws Exception {
		manageService.notLikePost(likePostDto);
		
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
	
	@GetMapping("/likeMember")	 // 회원 즐겨찾기 버튼 눌렀을 때 값 insert
	public ResponseEntity<Object> likeMember(LikeMemberDto likeMemberDto) throws Exception {
		manageService.addLikeMember(likeMemberDto);

		return new ResponseEntity<Object>(HttpStatus.OK);
	}
	
	@GetMapping("/notLikeMember")	// 회원 즐겨찾기 버튼 눌렀을 때 값 delete
	public ResponseEntity<Object> notLikeMember(LikeMemberDto likeMemberDto) throws Exception {
		manageService.notLikeMember(likeMemberDto);
		
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
}
