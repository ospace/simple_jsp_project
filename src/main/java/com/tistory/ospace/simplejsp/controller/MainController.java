package com.tistory.ospace.simplejsp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tistory.ospace.simplejsp.dto.Pagination;

@Controller
public class MainController {
	private static Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MessageSource messageSource;
	
	@RequestMapping("/")
	public String index(Model model) {
		logger.info("index begin: locale[{}]", LocaleContextHolder.getLocale().toLanguageTag());
		
		Pagination pagination = new Pagination();
		pagination.setPageNo(1);
		pagination.setTotal(200);
		
		model.addAttribute("pagination", pagination);
		Integer.parseInt("10");
		String greeting = messageSource.getMessage("greeting", null, LocaleContextHolder.getLocale());
		logger.info("index end: greeting[{}]", greeting);
		
		return "normal:/index";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "none:/login";
	}
}
