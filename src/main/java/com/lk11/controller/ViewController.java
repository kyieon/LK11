package com.lk11.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

	private static final Logger log = LoggerFactory.getLogger(ViewController.class);
	
	@RequestMapping
	public String showMainView() {
		log.info(">> showMainView");
		return "main";
	}
}
