package com.lk11.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.lk11.common.response.ResponseBuilder;
import com.lk11.common.response.ResponseI;
import com.lk11.service.SystemConfigurationService;
import com.lk11.vo.SystemConfigVO;
import com.lk11.vo.UserVO;

@RestController
@RequestMapping("/api/v1/configuration")
public class SystemConfigurationController {

	private Logger log = LoggerFactory.getLogger(SystemConfigurationController.class);

	@Autowired
	private SystemConfigurationService systemConfigurationService;
	
	@RequestMapping(method = RequestMethod.GET)
	public ResponseI<List<SystemConfigVO>> getData() {
		try {
			log.info(">> Input Request");
			return systemConfigurationService.getData();
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<List<SystemConfigVO>>build().setSuccess(false).setMessage(e.getMessage());
		}
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseI<?> postData(@RequestBody List<SystemConfigVO> systemConfigVOs) {
		try {
			log.info(">> Input Request >> @RequestBody :: " + systemConfigVOs);
			return systemConfigurationService.putData(systemConfigVOs);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.build().setSuccess(false).setMessage(e.getMessage());
		}
	}
	
	@RequestMapping(path = "/upload/iet", method = RequestMethod.POST)
	public ResponseI<String> postUploadIETFile(@RequestParam("ietFile") MultipartFile multipartFile) {
		try {
			log.info(">> Input Request >> MultipartFile :: " + multipartFile.getName() + "[" + multipartFile.getSize() + "]");
			return systemConfigurationService.putFile("iet", multipartFile);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<String>build().setSuccess(false).setMessage(e.getMessage());
		}
	}
	
	@RequestMapping(path = "/upload/scl", method = RequestMethod.POST)
	public ResponseI<String> postUploadSCLFile(@RequestParam("sclFile") MultipartFile multipartFile) {
		try {
			log.info(">> Input Request >> MultipartFile :: " + multipartFile.getName() + "[" + multipartFile.getSize() + "]");
			return systemConfigurationService.putFile("scl", multipartFile);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<String>build().setSuccess(false).setMessage(e.getMessage());
		}
	}
	
}
