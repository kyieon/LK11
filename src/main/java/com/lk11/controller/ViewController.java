package com.lk11.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

	private static final Logger log = LoggerFactory.getLogger(ViewController.class);

	/**
	 * 최초
	 * @return
	 */
	@RequestMapping
	public String showView(Authentication authentication) {
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
	
	/**
	 * 로그인
	 * @return
	 */
	@RequestMapping(path = "/login")
	public String showLoginView(Authentication authentication) {
		return "login";
	}
	
	/**
	 * 홈
	 * @return
	 */
	@RequestMapping(path = "/home")
	public String showHomeView() {
		return "home";
	}
	
	/**
	 * 소프트웨어 이력
	 * @return
	 */
	@RequestMapping(path = "/history/softwarehistory")
	public String showSoftwareHistory() {
		return "/history/softwarehistory";
	}
	
	/**
	 * 이더넷 이력
	 * @return
	 */
	@RequestMapping(path = "/history/ethernethistory")
	public String showEthernetHistory() {
		return "/history/ethernethistory";
	}
	
	/**
	 * 이더넷 스위치 상태
	 * @return
	 */
	@RequestMapping(path = "/history/ethernetswitchstate")
	public String showEthernetSwitchState() {
		return "/history/ethernetswitchstate";
	}
	
	/**
	 * IED 61850 연결 상태
	 * @return
	 */
	@RequestMapping(path = "/history/iedconnectionstate")
	public String showIedConnectionState() {
		return "/history/iedconnectionstate";
	}
	
	/**
	 * GOOSE 실시간이력
	 * @return
	 */
	@RequestMapping(path = "/goose/realtimehistory")
	public String showRealTimeHistory() {
		return "/goose/realtimehistory";
	}
	
	/**
	 * GOOSE 상태
	 * @return
	 */
	@RequestMapping(path = "/goose/goosestate")
	public String showGooseState() {
		return "/goose/goosestate";
	}
	
	/**
	 * MMS 실시간이력
	 * @return
	 */
	@RequestMapping(path = "/mms/realtimehistory")
	public String showMmsRealTimeHistory() {
		return "/mms/realtimehistory";
	}
	
	/**
	 * REPORT 상태
	 * @return
	 */
	@RequestMapping(path = "/mms/reportstate")
	public String showReportState() {
		return "/mms/reportstate";
	}
	
	/**
	 * 네트워크 패킷
	 * @return
	 */
	@RequestMapping(path = "/network/networkpacket")
	public String showNetworkPacket() {
		return "/network/networkpacket";
	}
	
	/**
	 * 시스템 - 시스템 장치
	 * @return
	 */
	@RequestMapping(path = "/system/systemequip")
	public String showSystemEquip() {
		return "/system/systemequip";
	}

	/**
	 * 시스템 - 포트 설정
	 */
	@RequestMapping(path = "/system/port")
	public String showSystemPortView() {
		return "/system/port";
	}
	
	/**
	 * 시스템 - 네트워크 카드 (NIC)
	 */
	@RequestMapping(path = "/system/networkcardnic")
	public String showSystemNetworkCardNicView() {
		return "/system/networkcardnic";
	}

	/**
	 * 시스템 - 패킷처리 제외
	 */
	@RequestMapping(path = "/system/packetignore")
	public String showSystemPacketIgnoreView() {
		return "/system/packetignore";
	}
	
	/**
	 * 시스템 - 사용자 계정
	 */
	@RequestMapping(path = "/system/usermanagement")
	public String showSystemUserManagementView() {
		return "/system/usermanagement";
	}
	
	/**
	 * 시스템 - 환경 설정
	 */
	@RequestMapping(path = "/system/configuration")
	public String showConfigurationView() {
		return "/system/configuration";
	}

	/**
	 * 유효성 검사 - 운영기준 검사
	 */
	@RequestMapping(path = "/validity/operatingstandardsexam")
	public String shoOperatingStandardsExam() {
		return "/validity/operatingstandardsexam";
	}
	
	/**
	 * 유효성 검사 - IET 검사
	 */
	@RequestMapping(path = "/validity/ietexam")
	public String showIetExam() {
		return "/validity/ietexam";
	}
}
