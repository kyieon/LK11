package com.lk11.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewController {

	private static final Logger log = LoggerFactory.getLogger(ViewController.class);
	
	@RequestMapping
	public String showView(Authentication authentication) {
		log.info(">> showView");
		if(!isLogin(authentication)) {
			return "redirect:/login";
		}
		return "redirect:/home";
	}
	
	private boolean isLogin(Authentication authentication) {
		if(null == authentication)
			return false;
		return true;
	}

	@RequestMapping(path = "/login")
	public String showLoginView(Authentication authentication) {
		log.info(">> showLoginView");
		return "login";
	}
	
	@RequestMapping(path = "/home")
	public String showHomeView() {
		log.info(">> showHomeView");
		return "home";
	}
	
	
	/**
	 * 시스템
	 */
	
	//환경 설정
	@RequestMapping(path = "/system/configuration")
	public String showConfigurationView() {
		log.info(">> showConfigurationView");
		return "/system/configuration";
	}
	
//	@RequestMapping(path = "/index")
//	public String showIndexView() {
//		log.info(">> showIndexView");
//		return "index";
//	}
//	
//	@RequestMapping(path = "/datatableEx")
//	public String showDataTablesExView() {
//		log.info(">> showDataTablesExView");
//		return "datatableEx";
//	}
	
	
	/**
	 * 소프트웨어 이력
	 * @return
	 */
	@RequestMapping(path = "/history/softwarehistory")
	public String showSoftwareHistory() {
		log.info(">> softwarehistory");
		return "/history/softwarehistory";
	}
	
	
	/**
	 * 이더넷 이력
	 * @return
	 */
	@RequestMapping(path = "/history/ethernethistory")
	public String showEthernetHistory() {
		log.info(">> ethernethistory");
		return "/history/ethernethistory";
	}
	
	
	/**
	 * 이더넷 스위치 상태
	 * @return
	 */
	@RequestMapping(path = "/history/ethernetswitchstate")
	public String showEthernetSwitchState() {
		log.info(">> ethernetswitchstate");
		return "/history/ethernetswitchstate";
	}
	
	
	
	/**
	 * IED 61850 연결 상태
	 * @return
	 */
	@RequestMapping(path = "/history/iedconnectionstate")
	public String showIedConnectionState() {
		log.info(">> iedconnectionstate");
		return "/history/iedconnectionstate";
	}
	
	
	
	
	
	/**
	 * GOOSE 실시간이력
	 * @return
	 */
	@RequestMapping(path = "/goose/realtimehistory")
	public String showRealTimeHistory() {
		log.info(">>goose realtimehistory");
		return "/goose/realtimehistory";
	}
	
	
	/**
	 * GOOSE 상태
	 * @return
	 */
	@RequestMapping(path = "/goose/goosestate")
	public String showGooseState() {
		log.info(">> goosestate");
		return "/goose/goosestate";
	}
	
	
	
	
	/**
	 * MMS 실시간이력
	 * @return
	 */
	@RequestMapping(path = "/mms/realtimehistory")
	public String showMmsRealTimeHistory() {
		log.info(">>mms realtimehistory");
		return "/mms/realtimehistory";
	}
	
	/**
	 * REPORT 상태
	 * @return
	 */
	@RequestMapping(path = "/mms/reportstate")
	public String showReportState() {
		log.info(">> reportstate");
		return "/mms/reportstate";
	}
	
	
	
	
}
