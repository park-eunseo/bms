package com.spring.bms.post.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/post")
public class PostController {

	@GetMapping("/write")
	public String writePost() {
		return "/writePost";
	}
	
	@PostMapping("/write")
	public ResponseEntity<Object> writePost(HttpServletRequest request) {
		
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	    
	    String jsScript = "";
	    
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@PostMapping("fileUpload") // 에디터에서 파일을 올렸을 때
	public void fileUpload(HttpServletRequest request, HttpServletResponse reponse, MultipartHttpServletRequest multipartRequest,
				@RequestParam MultipartFile multipartFile) {
		
	}
}
