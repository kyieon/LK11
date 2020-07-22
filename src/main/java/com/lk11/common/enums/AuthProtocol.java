package com.lk11.common.enums;

public enum AuthProtocol {
	None(""),
	MD5("aptMD5"),
	SHA("aptSHA"),
	;
	
	private String value;

	private AuthProtocol(String value) {
		this.value = value;
	}
	
	public String getValue() {
		return value;
	}
	
	public static AuthProtocol getEnum(String value) {
		for (AuthProtocol authProtocol : values()) {
			if(authProtocol.getValue().equalsIgnoreCase(value))
				return authProtocol;
		}
		return None;
	}
}
