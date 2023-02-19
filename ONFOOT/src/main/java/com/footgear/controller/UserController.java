package com.footgear.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.footgear.model.UserDTO;
import com.footgear.service.UserService;

@Controller
@RequestMapping("user/*")
public class UserController {
	
	@Autowired
	private UserService userservice;
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	
	
	/* GET */
	@GetMapping("/login")
	public String loginPage() {
		return "/user/loginpage";
	}
	
	@GetMapping("/join")
	public String joinPage() {
		return "/user/joinpage";
	}
	
	@GetMapping("/mypage")
	public String myPage() {
		return "/user/mypage";
	}
	
	
	
	
	/* 회원가입 */
	@PostMapping("/join")
	public String joinPost(UserDTO dto) throws Exception {
		
		String rawpw = "";			// 인코딩 전 비밀번호 
		String encodepw = ""; 		// 인코딩 후 비밀번호
		
		rawpw = dto.getPasswd();				// 비밀번호 데이터
		encodepw = encoder.encode(rawpw);; 		// 비밀번호 인코딩
		dto.setPasswd(encodepw);				// 인코딩 비밀번호 member 객체에 저장
		
		userservice.userJoin(dto);
		
		return "redirect:/";
	}
	
	/* 아이디 일치 여부 */
	@PostMapping("/useridChk")
	@ResponseBody
	public String useridChk(String userid) throws Exception {
			// System.out.println("memberidChk");
			
			int result = userservice.idCheck(userid);
			
			System.out.println("result : " + result);
			
			if(result != 0) {
				return "fail";
			}else {
				return "success";
			}
			
	}
	
	/* 로그인 */
	@PostMapping("/login")
	public String loginPost(HttpSession session,HttpServletRequest req, UserDTO dto, RedirectAttributes rttr) throws Exception {
		
//		System.out.println("login");
//		System.out.println(dto);

		session = req.getSession();
		String rawpw = "";
		String encodepw = "";
		
		UserDTO userdto = userservice.userLogin(dto);
		
		if(userdto!=null) {  // 아이디 일치
			rawpw = dto.getPasswd();         // 사용자 비밀번호
			encodepw = userdto.getPasswd();  // DB에 저장한 인코딩 비밀번호
			
			if(encoder.matches(rawpw, encodepw) == true) { // 비밀번호 일치 여부
				userdto.setPasswd("");			   // 인코딩 된 비밀번호 삭제
				session.setAttribute("user", userdto);	// session에 저장
				return "redirect:/";
			}else{
					rttr.addFlashAttribute("result", 0);
					return "redirect:/user/login";
			}
			 
		}else {			// 아이디 불일치
			rttr.addFlashAttribute("result", 0 ); // POST, 휘발성
			return "redirect:/user/login";
		}
	}
	
	/* 로그아웃 */
	@GetMapping("/logout")
	public String userLogout(HttpServletRequest req, HttpSession session) throws Exception {
		session = req.getSession();
		
		// session.removeAttribute();
		session.invalidate(); // 세션 무효화
		
		return "redirect:/";
	}
}
