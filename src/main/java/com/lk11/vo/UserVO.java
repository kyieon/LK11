package com.lk11.vo;

import com.lk11.common.file.Column;
import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.lk11.common.file.CSVFile;

@CSVFile
@JsonIgnoreProperties(ignoreUnknown = true)
public class UserVO {
	
	@Column(name = "아이디", index = 0)
	@JsonAlias("UserId")
	private String id;
	
	@Column(name = "암호", index = 1)
	@JsonAlias("UserPassword")
	private String password;
	
	@Column(name = "이름", index = 2)
	@JsonAlias("UserName")
	private String name;
	
	@Column(name = "권한", index = 3)
	@JsonAlias("UserType")
	private String type;
	
	@Column(name = "설명", index = 4)
	@JsonAlias("UserDesc")
	private String desc;
	
	@Column(name = "등록시간", index = 5)
	@JsonAlias("UserRegistertime")
	private String createTime;
	
	@Column(name = "수정시간", index = 6)
	@JsonAlias("UserUpdatetime")
	private String updateTime;
	
	@JsonAlias("UserEnabled")
	private Boolean enabled;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + ", name=" + name + ", type=" + type + ", desc=" + desc
				+ ", createTime=" + createTime + ", updateTime=" + updateTime + ", enabled=" + enabled + "]";
	}

}
