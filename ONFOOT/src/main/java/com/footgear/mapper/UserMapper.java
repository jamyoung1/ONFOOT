package com.footgear.mapper;

import com.footgear.model.UserDTO;

public interface UserMapper {
	
	/* ȸ������ */
	public void userJoin(UserDTO dto);
	
	/* ���̵� �ߺ� */
	public int idCheck(String userid);
	
	/* �α��� */
	public UserDTO userLogin(UserDTO dto);
}
