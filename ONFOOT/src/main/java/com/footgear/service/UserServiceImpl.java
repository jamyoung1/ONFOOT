package com.footgear.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.footgear.mapper.UserMapper;
import com.footgear.model.UserDTO;


@Service
public class UserServiceImpl implements UserService{

	
	@Autowired
	private UserMapper userMapper;
	
	/* 회원가입 */
	@Override
	public void userJoin(UserDTO dto) throws Exception {
		userMapper.userJoin(dto);
	}

	@Override
	public int idCheck(String userid) throws Exception {
		
		return userMapper.idCheck(userid);
	}

	@Override
	public UserDTO userLogin(UserDTO dto) throws Exception {
		return userMapper.userLogin(dto);
	}

}
