package com.lk11.vo;

import com.fasterxml.jackson.annotation.JsonAlias;

public class SystemConfigVO {
	
	@JsonAlias("SysGroup")
	private String sysGroup;
	
	@JsonAlias("SysItemId")
	private String sysItemId;

	@JsonAlias("SysItemDesc")
	private String sysItemDesc;

	@JsonAlias("SysItemValue")
	private String sysItemValue;

	public String getSysGroup() {
		return sysGroup;
	}

	public void setSysGroup(String sysGroup) {
		this.sysGroup = sysGroup;
	}

	public String getSysItemId() {
		return sysItemId;
	}

	public void setSysItemId(String sysItemId) {
		this.sysItemId = sysItemId;
	}

	public String getSysItemDesc() {
		return sysItemDesc;
	}

	public void setSysItemDesc(String sysItemDesc) {
		this.sysItemDesc = sysItemDesc;
	}

	public String getSysItemValue() {
		return sysItemValue;
	}

	public void setSysItemValue(String sysItemValue) {
		this.sysItemValue = sysItemValue;
	}

	@Override
	public String toString() {
		return "SystemConfigVO [sysGroup=" + sysGroup + ", sysItemId=" + sysItemId + ", sysItemDesc=" + sysItemDesc
				+ ", sysItemValue=" + sysItemValue + "]";
	}
}
