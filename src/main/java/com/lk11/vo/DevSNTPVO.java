package com.lk11.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class DevSNTPVO extends DeviceVO {

	@Override
	public String toString() {
		return "DevSNTPVO [toString()=" + super.toString() + "]";
	}

}
