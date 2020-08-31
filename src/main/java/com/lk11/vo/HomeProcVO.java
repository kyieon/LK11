package com.lk11.vo;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class HomeProcVO {

	@JsonAlias("ProcType")
	private String procType;
	
	@JsonAlias("ProcState")
	private Boolean procState;

	public String getProcType() {
		return procType;
	}

	public void setProcType(String procType) {
		this.procType = procType;
	}

	public Boolean getProcState() {
		return procState;
	}

	public void setProcState(Boolean procState) {
		this.procState = procState;
	}

	@Override
	public String toString() {
		return "HomeProcVO [procType=" + procType + ", procState=" + procState + "]";
	}
}
