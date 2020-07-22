package com.lk11.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lk11.common.response.ResponseBuilder;
import com.lk11.common.response.ResponseI;
import com.lk11.service.SystemEquipService;
import com.lk11.service.UserService;
import com.lk11.vo.DeviceVO;
import com.lk11.vo.UserVO;

@RestController
@RequestMapping("/api/v1/device")
public class SystemEquipController {

	private static final Logger log = LoggerFactory.getLogger(SystemEquipController.class);

	@Autowired
	private SystemEquipService systemEquipService;

	@RequestMapping(method = RequestMethod.GET)
	public ResponseI<List<DeviceVO>> getDatas() {
		try {
			log.info(">> Input Request");
			return systemEquipService.getDevices();
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<List<DeviceVO>>build().setSuccess(false).setMessage(e.getMessage());
		}
	}

	@RequestMapping(path = "/create", method = RequestMethod.POST)
	public ResponseI<DeviceVO> postData(DeviceVO deviceVO) {
		try {
			log.info(">> Input Request >> DeviceVO :: " + deviceVO);
			return systemEquipService.postDevice(deviceVO);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<DeviceVO>build().setSuccess(false).setMessage(e.getMessage());
		}
	}
	
	@RequestMapping(method = RequestMethod.DELETE)
	public ResponseI<DeviceVO> deleteData(@RequestParam("type") String type, @RequestParam("ip") String ip) {
		try {
			log.info(">> Input Request >> @RequestParam(type) :: " + type + ", @RequestParam(id) :: " + ip);
			return systemEquipService.deleteDevice(type, ip);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<DeviceVO>build().setSuccess(false).setMessage(e.getMessage());
		}
	}
}
