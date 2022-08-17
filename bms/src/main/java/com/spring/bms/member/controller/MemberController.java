package com.spring.bms.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

import net.coobird.thumbnailator.Thumbnails;

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
	public ResponseEntity<Object> register(HttpServletRequest request, MultipartHttpServletRequest multipartRequest) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		
		MemberDto memberDto = new MemberDto();
		memberDto.setId(multipartRequest.getParameter("id"));
		memberDto.setPassword(pwEncoder.encode(multipartRequest.getParameter("password")));
		memberDto.setName(multipartRequest.getParameter("name"));
		memberDto.setTel(multipartRequest.getParameter("tel"));
		memberDto.setEmail(multipartRequest.getParameter("email"));
		memberDto.setBirth(multipartRequest.getParameter("birth"));
		memberDto.setGender(multipartRequest.getParameter("gender"));
		
		Iterator<String> file = multipartRequest.getFileNames();
		String filePath = "C:\\profile\\";
		
		if(file.hasNext()) { // 파일을 읽어올 요소가 있는지 확인
			MultipartFile multipartFile = multipartRequest.getFile(file.next()); // 그 요소를 가져온다
			
			if(!multipartFile.getOriginalFilename().isEmpty()) {
				String fileName = UUID.randomUUID() + "_" + multipartFile.getOriginalFilename(); // 이미지 이름이 중복되지 않도록 고유 식별 사용 
				File f = new File(filePath + fileName);
				
				multipartFile.transferTo(f);
				
				memberDto.setProfileName(fileName);
			} 
		} else { // 파일 요소가 없으면 기본 프로필 사용
			memberDto.setProfileName("basicImg.png");
		}
		
		// 들어오는 값이 없을 때 공백 또는 null은 NaN으로 취급되어 저장될 필드가 없어 400 에러 일어남
		if(multipartRequest.getParameter("blogName").equals("")) memberDto.setBlogName(memberDto.getId());
		else memberDto.setBlogName(multipartRequest.getParameter("blogName"));
		
		if(multipartRequest.getParameter("nickname").equals("")) memberDto.setNickname(memberDto.getId());
		else memberDto.setNickname(multipartRequest.getParameter("nickname"));
		
		if(multipartRequest.getParameter("intro").equals("")) memberDto.setIntro("");
		else memberDto.setIntro(multipartRequest.getParameter("intro"));
		
		memberService.addMember(memberDto);
		
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8"); // 한글 변환
	    
		String jsScript = "<script>";
			   jsScript += "alert('회원가입이 완료되었습니다.');";
			   jsScript += "location.href='"+ request.getContextPath()+"/'";
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
				session.setAttribute("memberProfile", loginMember.getProfileName());
				session.setAttribute("role", "client"); // 관리자인지 회원인지 구분하기 위해
				
			    jsScript = "<script>"
				    	+ "location.href='"+ request.getContextPath()+"/';"
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
						+ "location.href = '" + request.getContextPath() + "/';"
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
	public ResponseEntity<Object> modify(HttpServletRequest request, MultipartHttpServletRequest multipartRequest) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		MemberDto memberDto = new MemberDto();
		memberDto.setId(multipartRequest.getParameter("id"));
		memberDto.setPassword(pwEncoder.encode(multipartRequest.getParameter("password")));
		memberDto.setTel(multipartRequest.getParameter("tel"));
		memberDto.setEmail(multipartRequest.getParameter("email"));
		
		Iterator<String> file = multipartRequest.getFileNames();
		String filePath = "C:\\profile\\";
		
		if(file.hasNext()) {
			MultipartFile multipartFile = multipartRequest.getFile(file.next());
			
			if(!multipartFile.getOriginalFilename().isEmpty()) { // 파일이 비어있으면 true, !true
				String fileName = UUID.randomUUID() + "_" + multipartFile.getOriginalFilename();
				File f = new File(filePath + fileName);
				
				multipartFile.transferTo(f);		
				memberDto.setProfileName(fileName);		
				
				new File(filePath + session.getAttribute("memberProfile")).delete(); // 프로필 파일 수정 전 파일 삭제
			} else { // 파일이 비어있으면(프로필 수정을 안 한 것이므로 그대로)
				memberDto.setProfileName((String) session.getAttribute("memberProfile"));		
			}
		} else {
			memberDto.setProfileName("basicImg.png");
		}
	
		
		// 들어오는 값이 없을 때 공백 또는 null은 NaN으로 취급되어 저장될 필드가 없어 400 에러 일어남
		if(multipartRequest.getParameter("blogName").equals("")) memberDto.setBlogName(memberDto.getId());
		else memberDto.setBlogName(multipartRequest.getParameter("blogName"));
		
		if(multipartRequest.getParameter("nickname").equals("")) memberDto.setNickname(memberDto.getId());
		else memberDto.setNickname(multipartRequest.getParameter("nickname"));
		
		if(multipartRequest.getParameter("intro").equals("")) memberDto.setIntro("");
		else memberDto.setIntro(multipartRequest.getParameter("intro"));
		
		memberService.updateMember(memberDto);	
		
		session.setAttribute("memberNickname", memberDto.getNickname());
		session.setAttribute("memberBlogName", memberDto.getBlogName());
		session.setAttribute("memberIntro", memberDto.getIntro());	
		session.setAttribute("memberProfile", memberDto.getProfileName());
		
		String jsScript = "<script>"
						+ "alert('수정이 완료되었습니다.');"
						+ "location.href = '" + request.getContextPath() + "/';"
						+ "</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	    
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/thumbnails")
	public void thumbnails(@RequestParam("profileName") String profileName, HttpServletResponse response) throws IOException {
		OutputStream out = response.getOutputStream();	 // 데이터를 출력할 메서드
		String filePath = "C:\\profile\\" + profileName;
		
		File file = new File(filePath);
		if(file.exists()) { // 받아온 파일이 존재한다면
			Thumbnails.of(file).size(800, 800).outputFormat("png").toOutputStream(out);
		} else {
			System.out.println("파일없음");
		}
		
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer); // 파일을 바이트 단위로 출력
		out.close();
	}
	
	@GetMapping("/forgotPassword")
	public String forgotPassword() {
		return "member/forgotPassword";
	}
	
	
}
