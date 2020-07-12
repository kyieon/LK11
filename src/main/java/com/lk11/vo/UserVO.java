package com.lk11.vo;

import com.lk11.common.file.Column;
import com.lk11.common.file.CSVFile;

@CSVFile
public class UserVO {
	
	@Column(name = "아이디", index = 0)
	private String id;
	
	@Column(name = "암호", index = 1)
	private String password;
	
	@Column(name = "이름", index = 2)
	private String name;
	
	@Column(name = "권한", index = 3)
	private String role;
	
	private boolean isActive;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword() {
		return password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + ", name=" + name + ", role=" + role + ", isActive="
				+ isActive + "]";
	}
}
