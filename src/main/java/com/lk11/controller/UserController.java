package com.lk11.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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
		try {
			log.debug(">> Input Request");
			return userService.getUsers();
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<List<UserVO>>build().setSuccess(false).setMessage(e.getMessage());
		}
	}

	@RequestMapping(path = "/{id}", method = RequestMethod.GET)
	public ResponseI<UserVO> getData(@PathVariable("id") String id) {
		try {
			log.info(">> Input Request >> param :: " + id);
			return userService.getUser(id);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<UserVO>build().setSuccess(false).setMessage(e.getMessage());
		}
	}
	
	@RequestMapping(path = "/exist/{id}", method = RequestMethod.GET)
	public ResponseI<?> existData(@PathVariable("id") String id) {
		try {
			log.info(">> Input Request >> param :: " + id);
			return userService.existUser(id);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<UserVO>build().setSuccess(false).setMessage(e.getMessage());
		}
	}
	
	@RequestMapping(path = "/create", method = RequestMethod.POST)
	public ResponseI<UserVO> postData(UserVO userVO) {
		try {
			log.info(">> Input Request >> @RequestBody :: " + userVO);
			return userService.postUser(userVO);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<UserVO>build().setSuccess(false).setMessage(e.getMessage());
		}
	}
	
	@RequestMapping(path = "/modify", method = RequestMethod.POST)
	public ResponseI<UserVO> putData(UserVO userVO) {
		try {
			log.info(">> Input Request >> @RequestBody :: " + userVO); 
			return userService.putUser(userVO);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<UserVO>build().setSuccess(false).setMessage(e.getMessage());
		}
	}
	
	@RequestMapping(path = "/enable", method = RequestMethod.PUT)
	public ResponseI<UserVO> enableData(@RequestBody UserVO userVO) {
		try {
			log.info(">> Input Request >> @RequestBody :: " + userVO); 
			return userService.setEnableUser(userVO);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<UserVO>build().setSuccess(false).setMessage(e.getMessage());
		}
	}
	
	@RequestMapping(path = "/{id}", method = RequestMethod.DELETE)
	public ResponseI<UserVO> deleteData(@PathVariable("id") String id) {
		try {
			log.info(">> Input Request >> param :: " + id);
			return userService.deleteUser(id);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<UserVO>build().setSuccess(false).setMessage(e.getMessage());
		}
	}
	
	@RequestMapping(path = "/export", method = RequestMethod.GET)
	public ResponseEntity<?> export() throws Exception {
		log.debug(">> Input Request");
		return userService.export();
	}
}
