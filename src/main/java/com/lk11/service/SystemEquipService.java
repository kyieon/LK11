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
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lk11.common.enums.DevType;
import com.lk11.common.response.ResponseBody;
import com.lk11.common.response.ResponseI;
import com.lk11.vo.DeviceVO;

@Service
public class SystemEquipService {

	private Logger log = LoggerFactory.getLogger(FileService.class);

	@Autowired
	private RestTemplate restTemplate;

	@Autowired
	private ObjectMapper objectMapper;

	@Autowired
	private FileService fileService;

	public ResponseBody<List<DeviceVO>> getDevices() throws JsonMappingException, JsonProcessingException {
		ResponseEntity<String> responseEntity = restTemplate.exchange("/devs", HttpMethod.GET, HttpEntity.EMPTY,
				String.class);
		log.debug(responseEntity.toString());
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<List<DeviceVO>>>() {
		});
	}

	public ResponseBody<DeviceVO> postDevice(DeviceVO deviceVO) throws Exception {

		switch (DevType.getEnum(deviceVO.getType())) {
		case Oper:
			return _postDeviceOper(deviceVO);
		default:
			throw new Exception("deviceVO.getType() : " + deviceVO.getType() + " is unknown type.");
		}
	}

	private ResponseBody<DeviceVO> _postDeviceOper(DeviceVO deviceVO)
			throws JsonMappingException, JsonProcessingException {
		MultiValueMap<String, String> headers = new HttpHeaders();
		headers.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.APPLICATION_FORM_URLENCODED_VALUE));
		HttpEntity<?> httpEntity = new HttpEntity<>(headers);
		ResponseEntity<String> responseEntity = restTemplate.exchange(
				"/devs/devOper?name={name}&desc={desc}&ip={ip}&ports={ports}", HttpMethod.POST, httpEntity,
				String.class, deviceVO.getName(), deviceVO.getDesc(), deviceVO.getIp(), deviceVO.getPorts());
		log.debug(responseEntity.toString());
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<DeviceVO>>() {
		});
	}

	public ResponseI<DeviceVO> deleteDevice(String devType, String ip)
			throws JsonMappingException, JsonProcessingException {
		ResponseEntity<String> responseEntity = restTemplate.exchange("/devs/{devType}?ip={ip}", HttpMethod.DELETE,
				HttpEntity.EMPTY, String.class, devType, ip);
		log.debug(responseEntity.toString());
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<DeviceVO>>() {
		});
	}

	private MultiValueMap<String, String> makeFormBody(DeviceVO deviceVO) {
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		return params;
	}

}
