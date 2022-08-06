package com.spring.bms;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/blog")
public class MainHomeController {
	
	@GetMapping("/main")
	public String mainHome() {
		return "/mainHome";
	}
}
