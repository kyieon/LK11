package com.lk11.vo;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class DevSNTPVO extends DeviceVO {

	@JsonAlias("PortNum")
	private Integer portNum;

	@JsonAlias("Enabled")
	private Boolean enable;

	public Integer getPortNum() {
		return portNum;
	}

	public void setPortNum(Integer portNum) {
		this.portNum = portNum;
	}

	public Boolean getEnable() {
		return enable;
	}

	public void setEnable(Boolean enable) {
		this.enable = enable;
	}

	@Override
	public String toString() {
		return "DevSNTPVO [portNum=" + portNum + ", enable=" + enable + ", toString()=" + super.toString() + "]";
	}
}
