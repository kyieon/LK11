package com.lk11.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.lk11.common.response.ResponseBuilder;
import com.lk11.common.response.ResponseI;
import com.lk11.service.UserService;
import com.lk11.vo.UserVO;

@RestController
@RequestMapping("/api/v1/user")
public class UserController {

	private static final Logger log = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;
	
	@RequestMapping(method = RequestMethod.GET)
	public ResponseI<List<UserVO>> getDatas() {
		log.info(">> Input Request");
		return ResponseBuilder.<List<UserVO>>build().setData(userService.getUsers());
	}
	
	@RequestMapping(path = "/{id}", method = RequestMethod.GET)
	public ResponseI<UserVO> getData(@PathVariable("id") String id) {
		log.info(">> Input Request >> param :: " + id);
		return ResponseBuilder.<UserVO>build().setData(userService.getUser(id));
	}
	
	@RequestMapping(path = "/export", method = RequestMethod.GET)
	public ResponseEntity<?> export() throws Exception {
		log.info(">> Input Request");
		return userService.export();
	}
}
