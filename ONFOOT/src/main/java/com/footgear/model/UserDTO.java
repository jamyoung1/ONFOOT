package com.footgear.model;

import lombok.Data;
import lombok.ToString;



@Data
@ToString
public class UserDTO {


	private String userid;
	private String passwd;
	private String name;
	private String addr;
	private String phone;
	private String email;
}
