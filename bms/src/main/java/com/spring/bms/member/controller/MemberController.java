package com.spring.bms.member.controller;

import java.io.File;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.DefaultNamingPolicy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bms.member.dto.MemberDto;
import com.spring.bms.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;  // 회원 비밀번호 암호화
	
	@GetMapping("/register")
	public String register() {
		return "member/register";
	}
	
	@PostMapping("/register")
	public ResponseEntity<Object> register(MemberDto memberDto, HttpServletRequest request, MultipartHttpServletRequest mpRequest) throws Exception {
		memberDto.setPassword(pwEncoder.encode(memberDto.getPassword()));
		
		// 들어오는 값이 없을 때 공백 또는 null은 NaN으로 취급되어 저장될 필드가 없어 400 에러 일어남
		if(memberDto.getBlogName().equals("")) memberDto.setBlogName(memberDto.getId());
		if(memberDto.getNickname().equals("")) memberDto.setNickname(memberDto.getId());
		if(memberDto.getIntro().equals("")) memberDto.setIntro("");
		
		
		// 프로필 사진 파일
		memberDto.setProfileName(profileUpdate(mpRequest));
		
		System.out.println(profileUpdate(mpRequest));
		
		memberService.addMember(memberDto);
		
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8"); // 한글 변환
	    
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
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("/login")
	public ResponseEntity<Object> login(MemberDto memberDto, HttpServletRequest request) throws Exception {
		String jsScript = "";
		
		MemberDto loginMember = memberService.selectMember(memberDto);
		
		if(loginMember != null) { // 해당 ID가 존재하다면
			if(pwEncoder.matches(memberDto.getPassword(), loginMember.getPassword())) {
				// matches 메서드를 사용해 회원에게 받은 암호화 전 패스워드와 암호화된 패스워드를 비교해 true 또는 false로 반환
				
				HttpSession session = request.getSession(); // 세션 객체 생성
				session.setAttribute("memberId", loginMember.getId());
				session.setAttribute("memberNickname", loginMember.getNickname());
				session.setAttribute("memberIntro", loginMember.getIntro());
				session.setAttribute("role", "client"); // 관리자인지 회원인지 구분하기 위해
				
			    jsScript = "<script>"
				    	+ "location.href='"+ request.getContextPath()+"/main';"
				    	+ "</script>";
			} 
		}
		
		if(jsScript.equals("")) {
			jsScript = "<script>"
					 + "alert('아이디 또는 패스워드를 다시 입력해 주세요.');"
					 + "history.go(-1);"
					 + "</script>";
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		   
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/logout")
	public ResponseEntity<Object> logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		
		String jsScript = "<script>"
						+ "alert('로그아웃되었습니다.');"
						+ "location.href = '" + request.getContextPath() + "/main';"
						+ "</script>";			

		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	    
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/modify") // 정보 수정
	public ModelAndView modifyInfo(String id) throws Exception {
		MemberDto memberDto = memberService.selectOneMember(id); // id를 통해 
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberDto", memberDto);
		mv.setViewName("member/modify");
		
		return mv;
	}
	
	@PostMapping("/modify")
	public ResponseEntity<Object> modify(MemberDto memberDto, HttpServletRequest request) throws Exception {
		memberDto.setPassword(pwEncoder.encode(memberDto.getPassword()));
		
		memberService.updateMember(memberDto);
		
		HttpSession session = request.getSession();
		session.setAttribute("memberNickname", memberDto.getNickname());
		session.setAttribute("memberBlogName", memberDto.getBlogName());
		session.setAttribute("memberIntro", memberDto.getIntro());	
		
		String jsScript = "<script>"
						+ "alert('수정이 완료되었습니다.');"
						+ "location.href = '" + request.getContextPath() + "/main';"
						+ "</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	    
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	public String profileUpdate(MultipartHttpServletRequest mpRequest) throws Exception {	
		mpRequest.setCharacterEncoding("utf-8"); // 한글명을 처리한다.
		
		Iterator<String> file = mpRequest.getFileNames();
		
		String filePath = "C:\\Users\\Park\\git\\bms\\bms\\src\\main\\webapp\\resources\\bootstrap\\img\\profile\\";
		String fileName = "";
		
		if(file.hasNext()) { // file element가 있으면
			MultipartFile mpFile = mpRequest.getFile(file.next()); // 파일 저장
			
			if(!mpFile.getOriginalFilename().isEmpty()) {
				// UUID: 파일명 중복되지 않게 고유 식별자 기능 사용
				fileName = UUID.randomUUID() + "_" + mpFile.getOriginalFilename();
				
				File f = new File(filePath + fileName);
				mpFile.transferTo(f);
			} 
		}
		
		if(fileName == "") fileName = "basicImg.png";
		
		return fileName;
	}
}
