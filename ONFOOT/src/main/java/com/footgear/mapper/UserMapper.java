package com.footgear.mapper;

import com.footgear.model.UserDTO;

public interface UserMapper {
	
	/* 회원가입 */
	public void userJoin(UserDTO dto);
	
	/* 아이디 중복 */
	public int idCheck(String userid);
	
	/* 로그인 */
	public UserDTO userLogin(UserDTO dto);
}
