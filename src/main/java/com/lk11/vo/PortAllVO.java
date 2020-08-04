package com.lk11.vo;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class PortAllVO  {

	@JsonAlias("DevType")
	private String devType;
	
	@JsonAlias("DevIdx")
	private String devIdx;
	
	@JsonAlias("DevName")
	private String devName;
	
	@JsonAlias("DevIp")
	private String devIp;
	
	@JsonAlias("PortList")
	private List<PortVO> portList;

	
	
	
	
	
	//연결 포트 관련
	
	@JsonAlias("DevConnectable")
	private List<PortAllVO> devConnectableList;
	
	@JsonAlias("ConnectablePortString")
	private String connectablePortString;
	
	@JsonAlias("ConnectablePorts")
	private List<String> connectablePorts;
	
	
	
	
	
	public String getDevType() {
		return devType;
	}

	public void setDevType(String devType) {
		this.devType = devType;
	}

	public String getDevIdx() {
		return devIdx;
	}

	public void setDevIdx(String devIdx) {
		this.devIdx = devIdx;
	}

	public String getDevName() {
		return devName;
	}

	public void setDevName(String devName) {
		this.devName = devName;
	}

	public String getDevIp() {
		return devIp;
	}

	public void setDevIp(String devIp) {
		this.devIp = devIp;
	}

	public List<PortVO> getPortList() {
		return portList;
	}

	public void setPortList(List<PortVO> portList) {
		this.portList = portList;
	}

	public String getConnectablePortString() {
		return connectablePortString;
	}

	public void setConnectablePortString(String connectablePortString) {
		this.connectablePortString = connectablePortString;
	}

	public List<String> getConnectablePorts() {
		return connectablePorts;
	}

	public void setConnectablePorts(List<String> connectablePorts) {
		this.connectablePorts = connectablePorts;
	}

	public List<PortAllVO> getDevConnectableList() {
		return devConnectableList;
	}

	public void setDevConnectableList(List<PortAllVO> devConnectableList) {
		this.devConnectableList = devConnectableList;
	}

	@Override
	public String toString() {
		return "PortAllVO [devType=" + devType + ", devIdx=" + devIdx + ", devName=" + devName + ", devIp=" + devIp
				+ ", portList=" + portList + ", devConnectableList=" + devConnectableList + ", connectablePortString="
				+ connectablePortString + ", connectablePorts=" + connectablePorts + "]";
	}

	
	
	
	

}
