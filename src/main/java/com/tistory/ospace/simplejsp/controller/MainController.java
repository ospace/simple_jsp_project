package com.tistory.ospace.simplejsp.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	private static Logger logger = LoggerFactory.getLogger(MainController.class);
	
	//@Value("${foo}") 
	private String foo;
	 	
	@Autowired
	private MessageSource messageSource;
	
	@RequestMapping("/")
	public String index() {
		logger.info("foo[{}] foo[{}]", foo, messageSource.getMessage("foo", null, Locale.KOREA));
		return "admin:/index";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "none:/login";
	}
}
