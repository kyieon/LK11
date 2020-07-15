package com.lk11.common.auth;

import org.springframework.security.core.userdetails.UserDetails;

public interface UserAuthService {
	public UserDetails loadUser(String id, String pwd) throws Exception;
}
