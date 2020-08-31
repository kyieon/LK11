package com.lk11.vo;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class HomeTopVO  {

	@JsonAlias("StatusType")
	private String statusType;
	
	@JsonAlias("StatusValue")
	private String statusValue;

	public String getStatusType() {
		return statusType;
	}

	public void setStatusType(String statusType) {
		this.statusType = statusType;
	}

	public String getStatusValue() {
		return statusValue;
	}

	public void setStatusValue(String statusValue) {
		this.statusValue = statusValue;
	}

	@Override
	public String toString() {
		return "HomeTopVO [statusType=" + statusType + ", statusValue=" + statusValue + "]";
	}
	

	
	
	
	
	
	
	
	

}
