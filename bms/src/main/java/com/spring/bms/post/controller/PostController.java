package com.spring.bms.post.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
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
	
	@RequestMapping("/fileUpload") // 에디터에서 파일을 올렸을 때 저장하기
	public void fileUpload(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multipartRequest,
				@RequestParam MultipartFile multipartFile) throws IOException {
		
		PrintWriter printWriter = null;
		OutputStream out = null;
		UUID uuid = UUID.randomUUID();
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String fileName = multipartFile.getOriginalFilename();
		byte[] bytes = multipartFile.getBytes();
		
		String filePath = "C:\\postFile\\";
		String uploadPath = filePath + uuid + "_" + fileName;
		
		out = new FileOutputStream(new File(uploadPath));
		out.write(bytes);
		out.flush(); // outStream에 저장된 데이터를 전송하고 초기화
		
		printWriter = response.getWriter();
		String fileUrl = "/post/fileGet?uuid=" + uuid + "&fileName=" + fileName; 
		
		// 업로드 시 메시지 출력
		printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
		printWriter.flush();
		
		out.close();
		printWriter.close();
	}
	
	@RequestMapping("/fileGet")
	public void fileGet(@RequestParam(value = "uuid") String uuid, @RequestParam(value = "fileName") String fileName, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String filePath = "C:\\postFile\\";
		String uploadPath = filePath + uuid + "_" + fileName;
		
		File file = new File(uploadPath);
		
		// 해당 파일이 존재하면
		if(file.isFile()) {
			byte[] bytes = new byte[1024]; 
			int readByte = 0;
			int length = 0;
			byte[] fileByte = null;
			
			FileInputStream fileInputStream = null;
			ByteArrayOutputStream arrayOutputStream = null;
			ServletOutputStream servletOutputStream = null;
			
			try {
				fileInputStream = new FileInputStream(file);
				arrayOutputStream = new ByteArrayOutputStream();
				servletOutputStream = response.getOutputStream();
				
				while((readByte = fileInputStream.read(bytes)) != -1) {
					arrayOutputStream.write(bytes, 0, readByte);
				}
				
				fileByte = arrayOutputStream.toByteArray();
				length = fileByte.length;
				servletOutputStream.write(fileByte, 0, length);
				servletOutputStream.flush();
				
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				arrayOutputStream.close();
				fileInputStream.close();
				servletOutputStream.close();
			}
		}
	}
}
