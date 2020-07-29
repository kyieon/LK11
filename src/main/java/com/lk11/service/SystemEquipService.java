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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lk11.common.enums.AuthProtocol;
import com.lk11.common.enums.DevType;
import com.lk11.common.enums.EncProtocol;
import com.lk11.common.enums.SNMPVer;
import com.lk11.common.response.ResponseBody;
import com.lk11.common.response.ResponseI;
import com.lk11.vo.DevIEDVO;
import com.lk11.vo.DevSNTPVO;
import com.lk11.vo.DevSwitchVO;
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
		case Switch:
			return _postDeviceSwitch(deviceVO);
		case SNTP:
			return _postDeviceSNTP(deviceVO);
		case IED:
			return _postDeviceIED(deviceVO);
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

	private ResponseBody<DeviceVO> _postDeviceSwitch(DeviceVO deviceVO) throws Exception {
		if(!(deviceVO instanceof DevSwitchVO)) {
			throw new Exception("Parameter is not DevSwitchVO.class");
		}
		
		DevSwitchVO devSwitchVO = (DevSwitchVO) deviceVO;
		MultiValueMap<String, String> headers = new HttpHeaders();
		headers.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.APPLICATION_FORM_URLENCODED_VALUE));
		MultiValueMap<String, ?> body = makeFormBody(devSwitchVO);
		HttpEntity<?> httpEntity = new HttpEntity<>(body, headers);
		ResponseEntity<String> responseEntity = restTemplate.exchange(
				"/devs/devSwitch?name={name}&desc={desc}&ip={ip}&ports={ports}", HttpMethod.POST, httpEntity,
				String.class, deviceVO.getName(), deviceVO.getDesc(), deviceVO.getIp(), deviceVO.getPorts());
		log.debug(responseEntity.toString());
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<DeviceVO>>() {
		});
	}
	
	private MultiValueMap<String, ?> makeFormBody(DevSwitchVO devSwitchVO) {
		MultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
		Map<String, Object> map = new HashMap<>();
		map.put("scan", 5000L);
		map.put("ver", SNMPVer.getEnum(devSwitchVO.getSnmpVersion()).getValue());
		map.put("comm", devSwitchVO.getCommunity());
		map.put("auth", AuthProtocol.getEnum(devSwitchVO.getAuthProtocol()).getValue());
		map.put("enc", EncProtocol.getEnum(devSwitchVO.getEncProtocol()).getValue());
		map.put("enckey", devSwitchVO.getEncKey());
		map.put("username", devSwitchVO.getUserName());
		map.put("isview", devSwitchVO.getIsView());
		params.setAll(map);
		return params;
	}

	private ResponseBody<DeviceVO> _postDeviceSNTP(DeviceVO deviceVO) throws Exception {
		if(!(deviceVO instanceof DevSNTPVO)) {
			throw new Exception("Parameter is not DevSNTPVO.class");
		}
		
		DevSNTPVO devSNTPVO = (DevSNTPVO) deviceVO;
		MultiValueMap<String, String> headers = new HttpHeaders();
		headers.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.APPLICATION_FORM_URLENCODED_VALUE));
		MultiValueMap<String, ?> body = makeFormBody(devSNTPVO);
		HttpEntity<?> httpEntity = new HttpEntity<>(body, headers);
		ResponseEntity<String> responseEntity = restTemplate.exchange(
				"/devs/devSNTP?name={name}&desc={desc}&ip={ip}&ports={ports}", HttpMethod.POST, httpEntity,
				String.class, deviceVO.getName(), deviceVO.getDesc(), deviceVO.getIp(), deviceVO.getPorts());
		log.debug(responseEntity.toString());
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<DeviceVO>>() {
		});
	}
	
	private MultiValueMap<String, ?> makeFormBody(DevSNTPVO devSNTPVO) {
		MultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
		Map<String, Object> map = new HashMap<>();

		map.put("portnum", devSNTPVO.getPortNum());
		map.put("enable", true);
		
		params.setAll(map);
		return params;
	}
	
	private ResponseBody<DeviceVO> _postDeviceIED(DeviceVO deviceVO) throws Exception {
		if(!(deviceVO instanceof DevIEDVO)) {
			throw new Exception("Parameter is not DevIEDVO.class");
		}
		
		DevIEDVO devIEDVO = (DevIEDVO) deviceVO;
		MultiValueMap<String, String> headers = new HttpHeaders();
		headers.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.MULTIPART_FORM_DATA_VALUE));
		MultiValueMap<String, ?> body = makeFormBody(devIEDVO);
		HttpEntity<?> httpEntity = new HttpEntity<>(body, headers);
		ResponseEntity<String> responseEntity = restTemplate.exchange(
				"/devs/devIED?name={name}&desc={desc}&ip={ip}&ports={ports}", HttpMethod.POST, httpEntity,
				String.class, deviceVO.getName(), deviceVO.getDesc(), deviceVO.getIp(), deviceVO.getPorts());
		log.debug(responseEntity.toString());
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<DeviceVO>>() {
		});
	}
	
	private MultiValueMap<String, ?> makeFormBody(DevIEDVO devIEDVO) {
		MultiValueMap<String, Object> params = new LinkedMultiValueMap<>();
		Map<String, Object> map = new HashMap<>();
		
		map.put("scl", devIEDVO.getSclFile().getResource());
		map.put("iet", devIEDVO.getIetFile().getResource());
		
		params.setAll(map);
		return params;
	}

	public ResponseI<DeviceVO> deleteDevice(String devType, String ip)
			throws JsonMappingException, JsonProcessingException {
		ResponseEntity<String> responseEntity = restTemplate.exchange("/devs/{devType}?ip={ip}", HttpMethod.DELETE,
				HttpEntity.EMPTY, String.class, devType, ip);
		log.debug(responseEntity.toString());
		return objectMapper.readValue(responseEntity.getBody(), new TypeReference<ResponseBody<DeviceVO>>() {
		});
	}

}
