package com.footgear.service;

import com.footgear.model.UserDTO;



public interface UserService {
	
	/* ȸ������ */
	public void userJoin(UserDTO dto) throws Exception;
	
	/* ���̵� �ߺ�*/
	public int idCheck(String userid) throws Exception;
	
	/* �α��� */
	public UserDTO userLogin(UserDTO user) throws Exception;

}
