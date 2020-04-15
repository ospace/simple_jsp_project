package com.tistory.ospace.simplejsp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/account")
public class AccountController {

	@RequestMapping("/list")
	public String list() {
		return "none:/hello";
	}
}
