package com.spring.bms.post.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.aspectj.util.FileUtil;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;


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
