package com.spring.bms;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BlogController {
	
	@GetMapping("/")
	public String mainHome() {
		return "/mainHome";
	}
	
	@GetMapping("/blog")
	public String blog() {
		return "/blogHome";
	}
	
}
