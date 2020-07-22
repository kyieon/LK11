package com.lk11.common.enums;

public enum SNMPVer {
	Unknown(""),
	v1("snmpV1"),
	v2("snmpV2"),
	v3("snmpV3"), 
	;
	
	private String value;

	private SNMPVer(String value) {
		this.value = value;
	}
	
	public String getValue() {
		return value;
	}

	public static SNMPVer getEnum(String value) {
		for (SNMPVer snmpVer : values()) {
			if(snmpVer.getValue().equalsIgnoreCase(value))
				return snmpVer;
		}
		return Unknown;
	}
}
