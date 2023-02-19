package com.footgear.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.footgear.mapper.UserMapper;
import com.footgear.model.UserDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserMapperTest {
	
	@Autowired
	private UserMapper userMapper;
	
/* 	@Test
	public void userJoin() throws Exception {
		MemberDTO dto = new MemberDTO();
		
		dto.setUserid("admin");
		dto.setPasswd("1234");
		dto.setName("admin");
		dto.setAddr("admin");
		dto.setEmail("admin@admin.com");
		dto.setPhone("000-0000-0000");
		
		
		memberMapper.userJoin(dto);
	} */
	
/*	@Test
	public void useridChk() throws Exception {
		String id = "min11600";
		String id2 = "tes";
		
		memberMapper.idCheck(id);
		memberMapper.idCheck(id2);
	} */
	
	@Test
	public void userLogin() throws Exception {
		
		UserDTO dto = new UserDTO();
		
		dto.setUserid("admin");
		dto.setPasswd("1234");
		
		userMapper.userLogin(dto);
		
		System.out.println(userMapper.userLogin(dto));
	}

}
