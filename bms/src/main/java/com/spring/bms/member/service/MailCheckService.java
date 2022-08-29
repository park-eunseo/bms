package com.spring.bms.member.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component // 이메일 빈 자동 등록 위해
public class MailCheckService {
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber;
	
	public void randNum() { 
		Random r = new Random();
		authNumber = r.nextInt(888888) + 111111;
		System.out.println("인증번호:" + authNumber);
	}
	
	public String sendMail(String email) throws MessagingException {
		randNum();
		System.out.println("email:" + email);
		String setFrom = "qkrmstj78@gmail.com";
		String toMail = email;
		String title = "심플로그 회원가입 이메일 인증 번호입니다.";
		String content = "<p>심플로그를 방문해 주셔서 감사합니다</p>"
						+ "<p>심플로그 인증 번호: " + authNumber + "<p>"
						+ "<p>해당 인증 번호를 확인란에 입력 후 확인 버튼을 눌러주세요.</p>";
		
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		// true를 전달하면 multipart 형식의 메세지 전달 및 인코딩 설정 가능
		
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
		helper.setFrom(setFrom);
		helper.setTo(toMail);
		helper.setSubject(title);
		helper.setText(content, true);
		// true 전달 시 html 형식으로 전송
		mailSender.send(mimeMessage);
		
		return Integer.toString(authNumber);
		
	}
}
