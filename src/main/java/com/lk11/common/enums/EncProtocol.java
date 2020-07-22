package com.lk11.common.enums;

public enum EncProtocol {
	None(""),
	DES("eptDES"),
	;
	
	private String value;

	private EncProtocol(String value) {
		this.value = value;
	}
	
	public String getValue() {
		return value;
	}
	
	public static EncProtocol getEnum(String value) {
		for (EncProtocol encProtocol : values()) {
			if(encProtocol.getValue().equalsIgnoreCase(value))
				return encProtocol;
		}
		return None;
	}
}

