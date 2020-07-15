package com.lk11.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lk11.common.auth.UserAuthService;
import com.lk11.common.auth.UserNotFoundException;
import com.lk11.common.response.ResponseBody;
import com.lk11.vo.UserVO;

@Service
public class AuthService implements UserAuthService {

	@Autowired
	private RestTemplate restTemplate;
	
	@Autowired
	private ObjectMapper objectMapper;
	
	@Override
	public UserDetails loadUser(String id, String pwd) throws Exception {
		ResponseBody<UserVO> responseBody = authenticate(id, pwd);
		if(null == responseBody) {
			throw new UserNotFoundException("'" + id + "'" + "User Not found. ");
		}

		if(!responseBody.isSuccess()) {
			throw new UserNotFoundException(responseBody.getMessage());
		}
		
		UserVO userVO = responseBody.getData();
		return new User(id, pwd, Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + userVO.getType())));
	}

	private ResponseBody<UserVO> authenticate(String id, String pwd) throws JsonMappingException, JsonProcessingException {
		ResponseEntity<String> responseEntity = restTemplate.exchange("/users/login?id={id}&pwd={pwd}", HttpMethod.GET, HttpEntity.EMPTY, String.class, id, pwd);
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<UserVO>>() {});
	}
}
