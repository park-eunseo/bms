package com.spring.bms.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CommonController {
	
	@GetMapping("/")
	public String mainHome() throws Exception {
		return "/mainHome";
	}
}
