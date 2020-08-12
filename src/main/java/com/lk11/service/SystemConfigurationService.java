package com.lk11.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lk11.common.response.ResponseBody;
import com.lk11.vo.SystemConfigVO;

@Service
public class SystemConfigurationService {

	private Logger log = LoggerFactory.getLogger(SystemConfigurationService.class);

	@Autowired
	private RestTemplate restTemplate;

	@Autowired
	private ObjectMapper objectMapper;
	
	public ResponseBody<List<SystemConfigVO>> getData() throws JsonMappingException, JsonProcessingException {
		ResponseEntity<String> responseEntity = restTemplate.exchange("/sys", HttpMethod.GET, HttpEntity.EMPTY,
				String.class);
		log.debug(responseEntity.toString());
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<List<SystemConfigVO>>>() {
		});
	}

	public ResponseBody<?> putData(List<SystemConfigVO> systemConfigVOs) throws JsonMappingException, JsonProcessingException {
		MultiValueMap<String, String> headers = new HttpHeaders();
		headers.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.APPLICATION_FORM_URLENCODED_VALUE));
		MultiValueMap<String, ?> body = makeFormBody(systemConfigVOs);
		HttpEntity<?> httpEntity = new HttpEntity<>(body, headers);
		ResponseEntity<String> responseEntity = restTemplate.exchange("/sys", HttpMethod.PUT, httpEntity, String.class);
		log.debug(responseEntity.toString());
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<?>>() {
		});
	}
	
	private MultiValueMap<String, ?> makeFormBody(List<SystemConfigVO> systemConfigVOs) {
		MultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
		Map<String, Object> map = new HashMap<>();
		
		for (SystemConfigVO systemConfigVO : systemConfigVOs) {
			String key = convertKey(systemConfigVO.getSysItemId());
			map.put(key, systemConfigVO.getSysItemValue());
		}
		
		params.setAll(map);
		return params;
	}
	
	private String convertKey(String sysItemId) {
		switch (sysItemId) {
		case "syshddsaveper":
			return "hddsaveper";
		case "syshdddeleteper":
			return "hdddeleteper";
		case "sysrealsyncsec":
			return "realsyncsec";
		}
		return sysItemId;
	}

	public ResponseBody<String> putFile(String key, MultipartFile multipartFile) throws JsonMappingException, JsonProcessingException {
		MultiValueMap<String, String> headers = new HttpHeaders();
		headers.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.MULTIPART_FORM_DATA_VALUE));
		MultiValueMap<String, ?> body = makeFormBody(key, multipartFile);
		HttpEntity<?> httpEntity = new HttpEntity<>(body, headers);
		ResponseEntity<String> responseEntity = restTemplate.exchange("/sys/file", HttpMethod.PUT, httpEntity, String.class);
		log.debug(responseEntity.toString());
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<String>>() {
		});
	}

	private MultiValueMap<String, ?> makeFormBody(String key, MultipartFile multipartFile) {
		MultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
		Map<String, Object> map = new HashMap<>();
		
		map.put(key, multipartFile.getResource());
		
		params.setAll(map);
		return params;
	}
}
