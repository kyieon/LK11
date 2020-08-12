package com.lk11.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.lk11.common.response.ResponseBuilder;
import com.lk11.common.response.ResponseI;
import com.lk11.service.HomeService;
import com.lk11.vo.PortAllVO;

@RestController
@RequestMapping("/api/v1/home")
public class HomeController {

	private static final Logger log = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private HomeService homeService;
	
	@RequestMapping(path = "/switch", method = RequestMethod.GET)
	public ResponseI<List<PortAllVO>> getDatas() {
		try {
			log.debug("GET Switchs");
			return homeService.getSwitch();
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<List<PortAllVO>>build().setSuccess(false).setMessage(e.getMessage());
		}
	}
	
}
