package com.lk11.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.lk11.common.file.FileContent;
import com.lk11.dao.UserDAO;
import com.lk11.vo.UserVO;

@Service
public class UserService {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private FileService fileService; 
	
	public List<UserVO> getUsers() {
		return userDAO.selectList();
	}
	
	public UserVO getUser(String id) {
		return userDAO.selectOne(id);
	}
	
	public ResponseEntity<?> export() throws Exception {
		byte[] content = FileContent.INSTANCE.convert(getUsers(), UserVO.class);
		return fileService.downloadFile(content, "유저리스트.csv");
	}
}
