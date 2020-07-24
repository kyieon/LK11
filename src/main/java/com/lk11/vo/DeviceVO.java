package com.lk11.vo;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class DeviceVO {

	@JsonAlias("DevIdx")
	private int idx;

	@JsonAlias("DevType")
	private String type;
	
	@JsonAlias("DevName")
	private String name;
	
	@JsonAlias("DevDesc")
	private String desc;
	
	@JsonAlias("DevIp")
	private String ip;
	
	@JsonAlias("DevPorts")
	private int ports;
	
	@JsonAlias("DevScl")
	private String scl;

	@JsonAlias("DevIet")
	private String iet;
	
	@JsonAlias("DevRegistertime")
	private String createTime;
	
	@JsonAlias("DevUpdatetime")
	private String updateTime;
	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getPorts() {
		return ports;
	}

	public void setPorts(int ports) {
		this.ports = ports;
	}

	public String getScl() {
		return scl;
	}

	public void setScl(String scl) {
		this.scl = scl;
	}

	public String getIet() {
		return iet;
	}

	public void setIet(String iet) {
		this.iet = iet;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	
	@Override
	public String toString() {
		return "DeviceVO [idx=" + idx + ", type=" + type + ", name=" + name + ", desc=" + desc + ", ip=" + ip
				+ ", ports=" + ports + ", scl=" + scl + ", iet=" + iet + ", createTime=" + createTime + ", updateTime="
				+ updateTime + "]";
	}
}
