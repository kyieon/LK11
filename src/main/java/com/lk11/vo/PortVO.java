package com.lk11.vo;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class PortVO  {
	
	@JsonAlias("DevIdx")
	private String devIdx;
	
	@JsonAlias("DevPort")
	private String devPort;

	@JsonAlias("PortNum")
	private String portNum;
	
	@JsonAlias("PortStatus")
	private String portStatus;
	
	@JsonAlias("TargetIdx")
	private String targetIdx;
	
	@JsonAlias("TargetPort")
	private String targetPort;
	
	@JsonAlias("TargetName")
	private String targetName;
	
	@JsonAlias("TargetIp")
	private String targetIp;
	
	
	
	
	
	public String getDevIdx() {
		return devIdx;
	}

	public void setDevIdx(String devIdx) {
		this.devIdx = devIdx;
	}

	public String getDevPort() {
		return devPort;
	}

	public void setDevPort(String devPort) {
		this.devPort = devPort;
	}

	//연결 포트 정보 
	public String getPortNum() {
		return portNum;
	}

	public void setPortNum(String portNum) {
		this.portNum = portNum;
	}

	public String getPortStatus() {
		return portStatus;
	}

	public void setPortStatus(String portStatus) {
		this.portStatus = portStatus;
	}

	public String getTargetIdx() {
		return targetIdx;
	}

	public void setTargetIdx(String targetIdx) {
		this.targetIdx = targetIdx;
	}

	public String getTargetPort() {
		return targetPort;
	}

	public void setTargetPort(String targetPort) {
		this.targetPort = targetPort;
	}

	public String getTargetName() {
		return targetName;
	}

	public void setTargetName(String targetName) {
		this.targetName = targetName;
	}

	public String getTargetIp() {
		return targetIp;
	}

	public void setTargetIp(String targetIp) {
		this.targetIp = targetIp;
	}

	@Override
	public String toString() {
		return "PortVO [devIdx=" + devIdx + ", devPort=" + devPort + ", portNum=" + portNum + ", portStatus="
				+ portStatus + ", targetIdx=" + targetIdx + ", targetPort=" + targetPort + ", targetName=" + targetName
				+ ", targetIp=" + targetIp + "]";
	}

	
	
	
	
	

}
