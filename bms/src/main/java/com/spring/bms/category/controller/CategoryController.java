package com.spring.bms.category.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bms.category.dto.CategoryDto;
import com.spring.bms.category.service.CategoryService;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/setCategory")
	public ModelAndView getCategory(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("categoryList", categoryService.getCategoryList((String) session.getAttribute("memberId")));
		mv.setViewName("/setCategory");
		
		return mv;
	}
	
	@GetMapping("/addCategory")
	public ResponseEntity<Object> addCategory(HttpServletRequest request, CategoryDto categoryDto) throws Exception{
		boolean isCheck = categoryService.addCategory(categoryDto);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		String jsScript = "";
		
		if(isCheck) {
			jsScript = "<script>" + "alert('새 카테고리가 등록되었습니다.');" 
					+ "location.href='" + request.getContextPath() + "/setCategory';"
					+ "</script>";
		} else {
			jsScript = "<script>" + "alert('중복된 카테고리명입니다.');" 
					+ "history.go(-1);"
					+ "</script>";
		}

		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("resetCategory")
	public ResponseEntity<Object> resetCategory(HttpServletRequest request, CategoryDto categoryDto, 
															@RequestParam("action") String action) throws Exception{
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		String jsScript = "";
		
		if(action.equals("modify")) {
			if(categoryService.modifyCategory(categoryDto)) { // 기존 카테고리명과 중복된 게 없다면 true
				jsScript = "<script>" + "alert('카테고리명이 수정되었습니다.');" 
							+ "location.href='" + request.getContextPath() + "/setCategory';"
							+ "</script>";
			} else {
					jsScript = "<script>" + "alert('중복된 카테고리명입니다.');" 
						+ "history.go(-1);"
						+ "</script>";
			}
		} else {
			categoryService.deleteCategory(categoryDto);
			
			jsScript = "<script>" + "alert('카테고리가 삭제되었습니다.');" 
					+ "location.href='" + request.getContextPath() + "/setCategory';"
					+ "</script>";
		}

		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}

}
