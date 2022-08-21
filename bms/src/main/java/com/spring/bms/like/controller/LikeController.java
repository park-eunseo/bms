package com.spring.bms.like.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.bms.like.dto.LikePostDto;
import com.spring.bms.like.service.LikePostService;

@Controller
public class LikeController {
	@Autowired
	private LikePostService likePostService;
	
	@GetMapping("/likeList")
	public String likeList() {
		return "/likeList";
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
	
}
