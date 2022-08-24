package com.spring.bms.manage.controller;

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
	public ModelAndView manageList(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		
		List<PostDto> likePostList = manageService.getLikePostList((String)session.getAttribute("memberId"));
		
		for (PostDto postDto : likePostList) {
			String title = postDto.getTitle();
			
			if(title.length() > 15) { postDto.setTitle(title.substring(0, 15) + "..."); }
			
			String content = postDto.getContent().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
			content = content.replaceAll("&lt(;)?(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?&gt(;)?", "");

			if (content.length() > 20) { content = content.substring(0, 20) + "..."; }
			
			postDto.setContent(content);
		}
		
		List<Map<String, String>> replyList = manageService.getMyReplyList((String)session.getAttribute("memberId"));
		
		for (Map<String, String> reply : replyList) {	
			if(reply.get("title").length() > 15) { reply.put("title", reply.get("title").substring(0, 15) + "..."); }
			if(reply.get("reply").length() > 20) { reply.put("reply", reply.get("reply").substring(0, 20) + "..."); }		
		}
		
		mv.addObject("likePostList", likePostList);
		mv.addObject("likeMemberList", manageService.getLikeMemberList((String)session.getAttribute("memberId")));
		mv.addObject("myReplyList",  replyList);
		mv.setViewName("/manageList");
		
		return mv;
	}
	
	@GetMapping("/likePost")
	public ResponseEntity<Object> likePost(LikePostDto likePostDto) throws Exception {
		manageService.addLikePost(likePostDto);

		return new ResponseEntity<Object>(HttpStatus.OK);
	}
	
	@GetMapping("/notLikePost")
	public ResponseEntity<Object> notLikePost(HttpServletRequest request, LikePostDto likePostDto) throws Exception {
		manageService.notLikePost(likePostDto);
		
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
	
	@GetMapping("/likeMember")
	public ResponseEntity<Object> likeMember(LikeMemberDto likeMemberDto) throws Exception {
		manageService.addLikeMember(likeMemberDto);

		return new ResponseEntity<Object>(HttpStatus.OK);
	}
	
	@GetMapping("/notLikeMember")
	public ResponseEntity<Object> notLikeMember(LikeMemberDto likeMemberDto) throws Exception {
		manageService.notLikeMember(likeMemberDto);
		
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
}
