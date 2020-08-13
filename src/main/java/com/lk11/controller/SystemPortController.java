package com.lk11.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.lk11.common.response.ResponseBody;
import com.lk11.common.response.ResponseBuilder;
import com.lk11.common.response.ResponseI;
import com.lk11.service.SystemPortService;
import com.lk11.vo.DeviceVO;
import com.lk11.vo.PortAllVO;
import com.lk11.vo.PortVO;

@RestController
@RequestMapping("/api/v1/port")
public class SystemPortController {

	private static final Logger log = LoggerFactory.getLogger(SystemPortController.class);

	@Autowired
	private SystemPortService systemPortService;
	


	@RequestMapping(method = RequestMethod.GET)
	public ResponseI<List<PortAllVO>> getDatas() {
		try {
			log.debug("INPUT PORTS ");
			return systemPortService.getPorts();
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<List<PortAllVO>>build().setSuccess(false).setMessage(e.getMessage());
		}
	}
	
	
	@RequestMapping(path = "/devs/port/connectable", method = RequestMethod.GET)
	public ResponseI<List<PortAllVO>> getConnectionPort( @RequestParam("devidx") String devidx) {
		try {
			log.info(">> Input Request :: " + devidx );
			return systemPortService.getConnectionPort(devidx);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<List<PortAllVO>>build().setSuccess(false).setMessage(e.getMessage());
		}
	}
	
	
	
	
	@RequestMapping(path = "/devs/ports/devSwitch", method = RequestMethod.POST)
	public ResponseI<PortVO> postConnectionPort(PortVO portVO) {
		try {
			log.info(">> Input Request >> PortVO :: " + portVO);
			return systemPortService.postConnectionPort(portVO);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<PortVO>build().setSuccess(false).setMessage(e.getMessage());
		}
	}
	
	
	@RequestMapping( method = RequestMethod.DELETE)
	public ResponseI<PortVO> deleteConnectionPort(@RequestParam("devIdx") String devIdx ,@RequestParam("devPort") String devPort ) {
		try {
			log.info(">> Input Request >> @RequestParam(devIdx) :: " + devIdx + ", @RequestParam(devPort) :: " + devPort);
			return systemPortService.deleteConnectionPort(devIdx, devPort);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<PortVO>build().setSuccess(false).setMessage(e.getMessage());
		}
	}
	
	

	
}
