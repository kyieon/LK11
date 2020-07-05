package com.lk11.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewController {

	private static final Logger log = LoggerFactory.getLogger(ViewController.class);
	
	@RequestMapping
	public String showView(Authentication authentication) {
		log.info(">> showView");
		if(!isLogin(authentication)) {
			return "redirect:/login";
		}
		return "redirect:/index";
	}
	
	private boolean isLogin(Authentication authentication) {
		if(null == authentication)
			return false;
		return true;
	}

	@RequestMapping(path = "/login")
	public String showLoginView(Authentication authentication) {
		log.info(">> showLoginView");
		return "login";
	}
	
	@RequestMapping(path = "/index")
	public String showIndexView() {
		log.info(">> showIndexView");
		return "index";
	}
	
	@RequestMapping(path = "/datatableEx")
	public String showDataTablesExView() {
		log.info(">> showDataTablesExView");
		return "datatableEx";
	}
}
