package com.spring.bms.favorites.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FavoritesController {
	
	@GetMapping("/favorites")
	public String favorites() {
		return "/favorites";
	}
}
