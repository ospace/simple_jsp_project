package com.tistory.ospace.simplejsp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tistory.ospace.simplejsp.dto.Pagination;

@Controller
public class MainController {
	private static Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping("/")
	public String index(Model model) {
		Pagination pagination = new Pagination();
		pagination.setPageNo(1);
		pagination.setTotal(200);
		
		model.addAttribute("pagination", pagination);
		Integer.parseInt("10");
		return "admin:/index";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "none:/login";
	}
}
