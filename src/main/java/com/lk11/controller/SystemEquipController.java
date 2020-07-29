package com.lk11.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lk11.common.response.ResponseBuilder;
import com.lk11.common.response.ResponseI;
import com.lk11.service.SystemEquipService;
import com.lk11.vo.DevIEDVO;
import com.lk11.vo.DevSNTPVO;
import com.lk11.vo.DevSwitchVO;
import com.lk11.vo.DeviceVO;

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
	@RequestMapping(path = "/{devType}", method = RequestMethod.GET)
	public ResponseI<DeviceVO> getData(@PathVariable("devType") String devType, @RequestParam("ip") String ip) {
		try {
			log.info(">> Input Request :: " + devType + " :: " + ip);
			return systemEquipService.getDevice(devType, ip);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<DeviceVO>build().setSuccess(false).setMessage(e.getMessage());
		}
	}

	@RequestMapping(path = "/create/devOper", method = RequestMethod.POST)
	public ResponseI<DeviceVO> postCreateDataDevOper(DeviceVO deviceVO) {
		try {
			log.info(">> Input Request >> DeviceVO :: " + deviceVO);
			return systemEquipService.postCreateDevice(deviceVO);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<DeviceVO>build().setSuccess(false).setMessage(e.getMessage());
		}
	}

	@RequestMapping(path = "/create/devSwitch", method = RequestMethod.POST)
	public ResponseI<DeviceVO> postCreateDataDevSwitch(DevSwitchVO devSwitchVO) {
		try {
			log.info(">> Input Request >> DevSwitchVO :: " + devSwitchVO);
			return systemEquipService.postCreateDevice(devSwitchVO);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<DeviceVO>build().setSuccess(false).setMessage(e.getMessage());
		}
	}

	@RequestMapping(path = "/create/devSNTP", method = RequestMethod.POST)
	public ResponseI<DeviceVO> postCreateDataDevSNTP(DevSNTPVO devSNTPVO) {
		try {
			log.info(">> Input Request >> DevSNTPVO :: " + devSNTPVO);
			return systemEquipService.postCreateDevice(devSNTPVO);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<DeviceVO>build().setSuccess(false).setMessage(e.getMessage());
		}
	}
	
	@RequestMapping(path = "/create/devIED", method = RequestMethod.POST)
	public ResponseI<DeviceVO> postCreateDataDevIED(DevIEDVO devIEDVO) {
		try {
			log.info(">> Input Request >> DevIEDVO :: " + devIEDVO);
			return systemEquipService.postCreateDevice(devIEDVO);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<DeviceVO>build().setSuccess(false).setMessage(e.getMessage());
		}
	}
	
	@RequestMapping(path = "/modify/devOper", method = RequestMethod.POST)
	public ResponseI<DeviceVO> postModifyDataDevOper(DeviceVO deviceVO) {
		try {
			log.info(">> Input Request >> DeviceVO :: " + deviceVO);
			return systemEquipService.postModifyDevice(deviceVO);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<DeviceVO>build().setSuccess(false).setMessage(e.getMessage());
		}
	}

	@RequestMapping(path = "/modify/devSwitch", method = RequestMethod.POST)
	public ResponseI<DeviceVO> postModifyDataDevSwitch(DevSwitchVO devSwitchVO) {
		try {
			log.info(">> Input Request >> DevSwitchVO :: " + devSwitchVO);
			return systemEquipService.postModifyDevice(devSwitchVO);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<DeviceVO>build().setSuccess(false).setMessage(e.getMessage());
		}
	}

	@RequestMapping(path = "/modify/devSNTP", method = RequestMethod.POST)
	public ResponseI<DeviceVO> postModifyDataDevSNTP(DevSNTPVO devSNTPVO) {
		try {
			log.info(">> Input Request >> DevSNTPVO :: " + devSNTPVO);
			return systemEquipService.postModifyDevice(devSNTPVO);
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<DeviceVO>build().setSuccess(false).setMessage(e.getMessage());
		}
	}
	
	@RequestMapping(path = "/modify/devIED", method = RequestMethod.POST)
	public ResponseI<DeviceVO> postModifyDataDevIED(DevIEDVO devIEDVO) {
		try {
			log.info(">> Input Request >> DevIEDVO :: " + devIEDVO);
			return systemEquipService.postModifyDevice(devIEDVO);
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
