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
import com.lk11.common.convert.MultiValueMapConverter;
import com.lk11.common.response.ResponseBody;
import com.lk11.vo.PortAllVO;
import com.lk11.vo.PortVO;

@Service
public class SystemPortService {

	private Logger log = LoggerFactory.getLogger(FileService.class);

	@Autowired
	private RestTemplate restTemplate;

	@Autowired
	private ObjectMapper objectMapper;


	@Autowired
	private MultiValueMapConverter multiValueMapConverter;
	

	public ResponseBody<List<PortAllVO>> getPorts() throws JsonMappingException, JsonProcessingException {
		ResponseEntity<String> responseEntity = restTemplate.exchange("/devs/ports", HttpMethod.GET, HttpEntity.EMPTY,
				String.class);
		//log.debug(responseEntity.toString());
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<List<PortAllVO>>>() {
		});
	}
	

	public ResponseBody<List<PortAllVO>> getConnectionPort(String devidx) throws JsonMappingException, JsonProcessingException {
		ResponseEntity<String> responseEntity = restTemplate.exchange("/devs/port/connectable?devidx={devidx}", HttpMethod.GET, HttpEntity.EMPTY,String.class ,devidx);
		log.debug(responseEntity.toString());
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<List<PortAllVO>>>() {
		});
	}
	
	
	public ResponseBody<PortVO> postConnectionPort(PortVO portVO) throws JsonMappingException, JsonProcessingException {
		MultiValueMap<String, String> headers = new HttpHeaders();
		headers.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.APPLICATION_FORM_URLENCODED_VALUE));
		HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<MultiValueMap<String, String>>(
				multiValueMapConverter.convert(portVO), headers);
		ResponseEntity<String> responseEntity = restTemplate.exchange("/devs/ports/devSwitch?devidx=" + portVO.getDevIdx()+"&devport="+ portVO.getDevPort()
		+"&taridx="+ portVO.getTargetIdx()+"&tarport="+ portVO.getTargetPort() , HttpMethod.POST,httpEntity, String.class);
		log.debug(responseEntity.toString());
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<PortVO>>() {
		});
	}
	
	
	public ResponseBody<PortVO> deleteConnectionPort(String devIdx, String devPort)
			throws JsonMappingException, JsonProcessingException {
		ResponseEntity<String> responseEntity = restTemplate.exchange("/devs/port?swtidx={devIdx}&swtport={devPort}", HttpMethod.DELETE,
				HttpEntity.EMPTY, String.class, devIdx, devPort);
		log.debug(responseEntity.toString());
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<PortVO>>() {
		});
	}
	
}
