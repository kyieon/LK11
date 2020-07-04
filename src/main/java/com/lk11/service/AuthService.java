package com.lk11.service;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.lk11.vo.UserVO;

@Service
public class AuthService implements UserDetailsService {

	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		UserVO userVO = userService.getUser(id);
		if(null == userVO) {
			throw new UsernameNotFoundException("'" + id + "'" + "User Not found. ");
		}
		return new User(id, bCryptPasswordEncoder.encode(userVO.getPassword()), Collections.singletonList(new SimpleGrantedAuthority("ROLE_ADMIN")));
	}

}
