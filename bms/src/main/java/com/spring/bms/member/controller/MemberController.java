package com.spring.bms.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.bms.member.dto.MemberDto;
import com.spring.bms.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/login")
	public String login() {
		return "/login";
	}
	
	@GetMapping("/register")
	public String register() {
		return "member/register";
	}
	
	@PostMapping("/register")
	public ResponseEntity<Object> register(MemberDto memberDto, HttpServletRequest request) throws Exception {
		memberService.addMember(memberDto);
		
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	    
		String jsScript = "<script>";
			   jsScript += "alert('가입이 완료되었습니다.');";
			   jsScript += "location.href='"+ request.getContextPath()+"/main'";
			   jsScript += "</script>";
	
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/registerIdCheck")
	public ResponseEntity<String> registerIdCheck(@RequestParam(name = "id") String id) throws Exception {	
		return new ResponseEntity<String>(memberService.registerIdCheck(id), HttpStatus.OK);
	}
}
