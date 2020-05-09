package com.tistory.ospace.simplejsp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tistory.ospace.simplejsp.repository.AccountDto;
import com.tistory.ospace.simplejsp.repository.PaginationDto;

@Controller
public class MainController {
	private static Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MessageSource messageSource;
	
	@RequestMapping("/")
	public String index(Model model) {
		logger.info("index begin: locale[{}]", LocaleContextHolder.getLocale().toLanguageTag());
		
		PaginationDto pagination = new PaginationDto();
		pagination.setPageNo(1);
		pagination.setTotal(200);
		
		model.addAttribute("say", "Hi");
		model.addAttribute("pagination", pagination);
		model.addAttribute("account", new AccountDto("foo", "누구"));
		
		Integer.parseInt("10");
		String greeting = messageSource.getMessage("greeting", null, LocaleContextHolder.getLocale());
		logger.info("index end: greeting[{}]", greeting);
		
		return "normal:/index";
	}
	
	@RequestMapping("/none")
	public String none(Model model) {
		logger.info("none begin: locale[{}]", LocaleContextHolder.getLocale().toLanguageTag());
		
		PaginationDto pagination = new PaginationDto();
		pagination.setPageNo(1);
		pagination.setTotal(200);
		
		model.addAttribute("say", "Hi");
		model.addAttribute("pagination", pagination);
		model.addAttribute("account", new AccountDto("foo", "누구"));
		
		logger.info("none end:");
		
		return "none:/index";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "none:/login";
	}
}
