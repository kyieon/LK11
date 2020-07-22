package com.lk11.common.enums;

public enum DevType {
	Unknown(""),
	Oper("devOper"),
	Switch("devSwitch"),
	SNTP("devSNTP"),
	IED("devIED"),
	;
	
	private String value;

	private DevType(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
	
	public static DevType getEnum(String value) {
		for (DevType devType : values()) {
			if(devType.getValue().equalsIgnoreCase(value))
				return devType;
		}
		return Unknown;
	}
}
