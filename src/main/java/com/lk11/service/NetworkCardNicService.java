package com.lk11.service;

import java.util.Collections;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lk11.common.response.ResponseBody;
import com.lk11.vo.NetworkCardNicVO;

@Service
public class NetworkCardNicService {

	private static final Logger log = LoggerFactory.getLogger(NetworkCardNicService.class);

	@Autowired
	private RestTemplate restTemplate;

	@Autowired
	private ObjectMapper objectMapper;

	public ResponseBody<List<NetworkCardNicVO>> getNetworkCardNics() throws JsonMappingException, JsonProcessingException {
		ResponseEntity<String> responseEntity = restTemplate.exchange("/nics", HttpMethod.GET, HttpEntity.EMPTY,
				String.class);
		log.debug(responseEntity.toString());
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<List<NetworkCardNicVO>>>() {
		});
	}

	public ResponseBody<NetworkCardNicVO> setCapture(NetworkCardNicVO networkCardNicVO) throws JsonMappingException, JsonProcessingException {
		MultiValueMap<String, String> headers = new HttpHeaders();
		headers.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.APPLICATION_FORM_URLENCODED_VALUE));
		HttpEntity<?> httpEntity = new HttpEntity<>(headers);
		ResponseEntity<String> responseEntity = restTemplate.exchange("/nics/nic?id={nicId}&iscap={nicIsCapture}", HttpMethod.PUT,
				httpEntity, String.class, networkCardNicVO.getNicId(), networkCardNicVO.getNicIsCapture());
		log.debug(responseEntity.toString());
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<NetworkCardNicVO>>() { });
	}
}
