package com.spring.bms;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainHomeController {
	
	@GetMapping("/main")
	public String mainHome() {
		return "/mainHome";
	}
	
	@GetMapping("/blog")
	public String blog() {
		return "/blog";
	}
	
	@GetMapping("/login")
	public String login() {
		return "/login";
	}
	
	@GetMapping("/register")
	public String register() {
		return "/register";
	}
}
