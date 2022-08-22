package com.spring.bms.like.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.like.dto.LikePostDto;
import com.spring.bms.like.service.LikePostService;

@Controller
public class LikeController {
	@Autowired
	private LikePostService likePostService;
	
	@GetMapping("/likeList")
	public ModelAndView likeList(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		
		List<PostDto> likePostList = likePostService.getLikePostList((String)session.getAttribute("memberId"));
		
		for (PostDto postDto : likePostList) {
			String title = postDto.getTitle();
			
			if(title.length() > 15) {
				postDto.setTitle(title.substring(0, 15) + "...");
			}
			
			String content = postDto.getContent().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
			content = content.replaceAll("&lt(;)?(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?&gt(;)?", "");

			if (content.length() > 20)
				content = content.substring(0, 20) + "...";
				postDto.setContent(content);
		}
		
		mv.addObject("likePostList", likePostList);
		mv.setViewName("/likeList");
		
		return mv;
	}
	
	@GetMapping("/likePost")
	public ResponseEntity<Object> likePost(HttpServletRequest request, LikePostDto likePostDto) throws Exception {
		likePostService.addLikePost(likePostDto);

		return new ResponseEntity<Object>(HttpStatus.OK);
	}
	
	@GetMapping("/notLikePost")
	public ResponseEntity<Object> notLikePost(HttpServletRequest request, LikePostDto likePostDto) throws Exception {
		likePostService.notLikePost(likePostDto);
		
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
	
	@GetMapping("/getLikePost") // 해당 게시글에 회원이 좋아요를 눌렀는지 확인
	public ResponseEntity<Object> getLikePost(HttpServletRequest request, LikePostDto likePostDto) throws Exception {
		return new ResponseEntity<Object>(likePostService.getLikePost(likePostDto), HttpStatus.OK);
	}
	
	@GetMapping("/getLikeCount")
	public ResponseEntity<Object> getLikeCount(HttpServletRequest request, LikePostDto likePostDto) throws Exception {
		int likeCount = likePostService.getLikeCount(likePostDto);

		return new ResponseEntity<Object>(likeCount, HttpStatus.OK);
	}
}
