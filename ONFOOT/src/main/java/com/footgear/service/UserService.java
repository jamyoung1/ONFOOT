package com.footgear.service;

import com.footgear.model.UserDTO;



public interface UserService {
	
	/* 회원가입 */
	public void userJoin(UserDTO dto) throws Exception;
	
	/* 아이디 중복*/
	public int idCheck(String userid) throws Exception;
	
	/* 로그인 */
	public UserDTO userLogin(UserDTO user) throws Exception;

}
