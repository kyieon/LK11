package com.lk11.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lk11.common.file.FileContent;
import com.lk11.common.response.ResponseBody;
import com.lk11.common.response.ResponseI;
import com.lk11.vo.UserVO;

@Service
public class UserService {

	private static final Logger log = LoggerFactory.getLogger(UserService.class);

	@Autowired
	private RestTemplate restTemplate;
	
	@Autowired
	private ObjectMapper objectMapper;
	
	@Autowired
	private FileService fileService; 
	
	public ResponseBody<List<UserVO>> getUsers() throws JsonMappingException, JsonProcessingException {
		ResponseEntity<String> responseEntity = restTemplate.exchange("/users", HttpMethod.GET, HttpEntity.EMPTY, String.class);
		log.debug(responseEntity.toString());
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<List<UserVO>>>() {});
	}
	
	public ResponseBody<UserVO> getUser(String id) throws JsonMappingException, JsonProcessingException {
		ResponseEntity<String> responseEntity = restTemplate.exchange("/users/" + id, HttpMethod.GET, HttpEntity.EMPTY, String.class);
		log.debug(responseEntity.toString());
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<UserVO>>() {});
	}
	
	public ResponseBody<UserVO> postUser(UserVO userVO) throws JsonMappingException, JsonProcessingException {
		userVO.setEnable(true);
		HttpEntity<UserVO> httpEntity = new HttpEntity<UserVO>(userVO);
		ResponseEntity<String> responseEntity = restTemplate.exchange("/users/" + userVO.getId(), HttpMethod.PUT, httpEntity, String.class);
		log.debug(responseEntity.toString());
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<UserVO>>() {});
	}
	
	public ResponseBody<UserVO> deleteUser(String id) throws JsonMappingException, JsonProcessingException {
		ResponseEntity<String> responseEntity = restTemplate.exchange("/users/" + id, HttpMethod.DELETE, HttpEntity.EMPTY, String.class);
		//<200,{"success":true,"message":"testid3 deleted","data":null},[Transfer-Encoding:"chunked", Content-Type:"application/json; charset=utf-8", Server:"Microsoft-HTTPAPI/2.0", Date:"Thu, 16 Jul 2020 09:09:19 GMT"]>
		log.debug(responseEntity.toString());
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<UserVO>>() {});
	}
	
	public ResponseEntity<?> export() throws Exception {
		byte[] content = FileContent.INSTANCE.convert(getUsers().getData(), UserVO.class);
		return fileService.downloadFile(content, "유저리스트.csv");
	}

}
