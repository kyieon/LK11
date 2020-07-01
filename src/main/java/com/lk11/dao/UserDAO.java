package com.lk11.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.lk11.vo.UserVO;

@Mapper
public interface UserDAO {
	public List<UserVO> selectList();
	public UserVO selectOne(String id);
}
