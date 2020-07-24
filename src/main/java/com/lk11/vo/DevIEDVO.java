package com.lk11.vo;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class DevIEDVO extends DeviceVO {

	@JsonIgnore
	private MultipartFile sclFile;
	
	@JsonIgnore
	private MultipartFile ietFile;
	
	public void setSclFile(MultipartFile sclFile) {
		this.sclFile = sclFile;
	}
	
	public MultipartFile getSclFile() {
		return sclFile;
	}
	
	public void setIetFile(MultipartFile ietFile) {
		this.ietFile = ietFile;
	}
	
	public MultipartFile getIetFile() {
		return ietFile;
	}

	@Override
	public String toString() {
		return "DevIED [sclFile=" + (sclFile != null ? sclFile.getSize() : -1) + ", ietFile=" + (ietFile != null ? ietFile.getSize() : -1) + "]";
	}
}
