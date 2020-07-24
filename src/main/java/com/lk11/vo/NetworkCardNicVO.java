package com.lk11.vo;

import com.lk11.common.file.Column;
import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.lk11.common.file.CSVFile;

@CSVFile
@JsonIgnoreProperties(ignoreUnknown = true)
public class NetworkCardNicVO {
	
	@Column(name = "아이디", index = 0)
	@JsonAlias("NicId")
	private String nicId;
	
	@Column(name = "이름", index = 1)
	@JsonAlias("NicName")
	private String nicName;
	
	@Column(name = "설명", index = 2)
	@JsonAlias("NicDesc")
	private String nicDesc;
	
	@Column(name = "인터페이스 종류", index = 3)
	@JsonAlias("NicNetworkInterfaceType")
	private String nicNetworkInterfaceType;
	
	@Column(name = "IP", index = 4)
	@JsonAlias("NicIp")
	private String nicIp;
	
	@Column(name = "MAC", index = 5)
	@JsonAlias("NicMac")
	private String nicMac;
	
	@Column(name = "캡쳐", index = 6)
	@JsonAlias("NicIsCapture")
	private String nicIsCapture;
	
	@Column(name = "업데이트날짜", index = 7)
	@JsonAlias("NicUpdatetime")
	private String nicUpdatetime;

	public String getNicId() {
		return nicId;
	}

	public void setNicId(String nicId) {
		this.nicId = nicId;
	}

	public String getNicName() {
		return nicName;
	}

	public void setNicName(String nicName) {
		this.nicName = nicName;
	}

	public String getNicDesc() {
		return nicDesc;
	}

	public void setNicDesc(String nicDesc) {
		this.nicDesc = nicDesc;
	}

	public String getNicNetworkInterfaceType() {
		return nicNetworkInterfaceType;
	}

	public void setNicNetworkInterfaceType(String nicNetworkInterfaceType) {
		this.nicNetworkInterfaceType = nicNetworkInterfaceType;
	}

	public String getNicIp() {
		return nicIp;
	}

	public void setNicIp(String nicIp) {
		this.nicIp = nicIp;
	}

	public String getNicMac() {
		return nicMac;
	}

	public void setNicMac(String nicMac) {
		this.nicMac = nicMac;
	}

	public String getNicIsCapture() {
		return nicIsCapture;
	}

	public void setNicIsCapture(String nicIsCapture) {
		this.nicIsCapture = nicIsCapture;
	}

	public String getNicUpdatetime() {
		return nicUpdatetime;
	}

	public void setNicUpdatetime(String nicUpdatetime) {
		this.nicUpdatetime = nicUpdatetime;
	}

	@Override
	public String toString() {
		return "NetworkCardNicVO [nicId=" + nicId + ", nicName=" + nicName + ", nicDesc=" + nicDesc
				+ ", nicNetworkInterfaceType=" + nicNetworkInterfaceType + ", nicIp=" + nicIp + ", nicMac=" + nicMac
				+ ", nicIsCapture=" + nicIsCapture + ", nicUpdatetime=" + nicUpdatetime + "]";
	}
	
	

}
