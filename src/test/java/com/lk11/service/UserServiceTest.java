//package com.lk11.service;
//
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
//
//import com.fasterxml.jackson.core.JsonProcessingException;
//import com.fasterxml.jackson.databind.JsonMappingException;
//import com.lk11.common.response.ResponseBody;
//import com.lk11.vo.UserVO;
//
//@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
//class UserServiceTest {
//
//	@Autowired
//	private UserService userService;
//	
//	@Test
//	void testPostUser() throws JsonMappingException, JsonProcessingException {
//		UserVO userVO = new UserVO();
//		
//		userVO.setId("cc");
//		userVO.setName("ccName");
//		userVO.setDesc("ccDesc");
//		userVO.setPwd("cc");
//		userVO.setType("utAdmin");
//		userVO.setEnable(true);
//		
//		ResponseBody<UserVO> res = userService.postUser(userVO);
//		System.out.println(res);
//	}
//	
//	@Test
//	void testPutUser() throws JsonMappingException, JsonProcessingException {
//		UserVO userVO = new UserVO();
//		
//		userVO.setId("cc");
//		userVO.setName("ccName");
//		userVO.setDesc("ccDesc");
//		userVO.setPwd("cc");
//		userVO.setType("utAdmin");
//		userVO.setEnable(false);
//		
//		ResponseBody<UserVO> res = userService.putUser(userVO);
//		System.out.println(res);
//	}
//}
//
