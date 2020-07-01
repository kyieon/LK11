package com.lk11.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lk11.dao.UserDAO;
import com.lk11.vo.UserVO;

@Service
public class UserService {

	@Autowired
	private UserDAO userDAO;

	public List<UserVO> getUsers() {
		return userDAO.selectList();
	}
	
	public UserVO getUser(String id) {
		return userDAO.selectOne(id);
	}
}
