package com.spring.bms.post.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.spring.bms.post.dto.PostDto;
import com.spring.bms.post.service.PostService;


@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired
	private PostService postService;
	
	@GetMapping("/write")
	public String writePost() {
		return "/writePost";
	}
	
	@PostMapping("/write")
	public ResponseEntity<Object> writePost(HttpServletRequest request, PostDto postDto) throws Exception {
		postService.addPost(postDto);
		
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	    
	    String jsScript = "<script>"
	    				+ "alert('게시글이 등록되었습니다.');"
	    				+ "location.href = '" + request.getContextPath() + "/blog';"
	    				+ "</script>";
	    
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@RequestMapping(value="/fileUpload", produces = "application/json; charset=utf8") // 에디터에서 파일을 올렸을 때 저장하기
										// json 형태로 response
	@ResponseBody
	public String fileUpload(HttpServletRequest request, @RequestParam("file") MultipartFile multipartFile) throws IOException {
		
		JsonObject json = new JsonObject();
		
		String filePath = "C:\\postFile\\";
		String fileName = UUID.randomUUID() + "_" +multipartFile.getOriginalFilename();
		
		File file = new File(filePath + fileName);
		
		try {
			InputStream inputStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(inputStream, file);
			
			json.addProperty("url", "/imgUpload/" + fileName); // 이미지 url 전송
			json.addProperty("responseCode", "success");
		} catch (Exception e) {
			FileUtils.deleteQuietly(file); // 저장된 파일 삭제
			json.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return json.toString();
	}
	
}
