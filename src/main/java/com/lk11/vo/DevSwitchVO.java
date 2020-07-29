package com.lk11.vo;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class DevSwitchVO extends DeviceVO {

	@JsonAlias("ScanPeriod")
	private Integer scanPeriod;
	
	@JsonAlias("SNMPVer")
	private String snmpVersion;
	
	@JsonAlias("Community")
	private String community;

	@JsonAlias("AuthProtocol")
	private String authProtocol;

	@JsonAlias("EncProtocol")
	private String encProtocol;

	@JsonAlias("EncKey")
	private String encKey;

	@JsonAlias("UserName")
	private String userName;

	@JsonAlias("IsView")
	private Boolean isView;

	public Integer getScanPeriod() {
		return scanPeriod;
	}

	public void setScanPeriod(Integer scanPeriod) {
		this.scanPeriod = scanPeriod;
	}

	public String getSnmpVersion() {
		return snmpVersion;
	}

	public void setSnmpVersion(String snmpVersion) {
		this.snmpVersion = snmpVersion;
	}

	public String getCommunity() {
		return community;
	}

	public void setCommunity(String community) {
		this.community = community;
	}

	public String getAuthProtocol() {
		return authProtocol;
	}

	public void setAuthProtocol(String authProtocol) {
		this.authProtocol = authProtocol;
	}

	public String getEncProtocol() {
		return encProtocol;
	}

	public void setEncProtocol(String encProtocol) {
		this.encProtocol = encProtocol;
	}

	public String getEncKey() {
		return encKey;
	}

	public void setEncKey(String encKey) {
		this.encKey = encKey;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Boolean getIsView() {
		return isView;
	}

	public void setIsView(Boolean isView) {
		this.isView = isView;
	}

	@Override
	public String toString() {
		return "DevSwitchVO [scanPeriod=" + scanPeriod + ", snmpVersion=" + snmpVersion + ", community=" + community
				+ ", authProtocol=" + authProtocol + ", encProtocol=" + encProtocol + ", encKey=" + encKey
				+ ", userName=" + userName + ", isView=" + isView + ", toString()=" + super.toString() + "]";
	}
}
