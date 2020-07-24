package com.lk11.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.lk11.common.response.ResponseBuilder;
import com.lk11.common.response.ResponseI;
import com.lk11.service.NetworkCardNicService;
import com.lk11.vo.NetworkCardNicVO;

@RestController
@RequestMapping("/api/v1/networkcardnic")
public class NetworkCardNicController {

	private static final Logger log = LoggerFactory.getLogger(NetworkCardNicController.class);

	@Autowired
	private NetworkCardNicService systemService;


	@RequestMapping(method = RequestMethod.GET)
	public ResponseI<List<NetworkCardNicVO>> getDatas() {
		try {
			log.info("INPUT NETWORK CARD NIC");
			return systemService.getNetworkCardNics();
		} catch (Exception e) {
			log.error("", e);
			return ResponseBuilder.<List<NetworkCardNicVO>>build().setSuccess(false).setMessage(e.getMessage());
		}
	}
}
