package com.wp.workpartner.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmployeeController {

	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 로그인 페이지로 이동하는 요청 처리 메소드
	 * @return	: String "common/loginForm"
	 */
	@RequestMapping("loginForm.em") 
	public String loginForm() {
		return "common/loginForm";
	}
	
	/**
	 * jsp 연결 위해 임시로 작성
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 로그아웃 요청 처리 메소드
	 * @return	: String
	 */
	@RequestMapping("logout.em")
	public String logoutEmployee() {
		return "common/loginForm";
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 아이디 찾기 페이지로 이동하는 요청 처리 메소드
	 * @return	: String
	 */
	@RequestMapping("idSelectForm.em")
	public String idSelectForm() {
		return "common/idSelectForm";
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 임시 비밀번호 발급 페이지로 이동하는 요청 처리 메소드
	 * @return	: String
	 */
	@RequestMapping("pwdUpdateForm.em")
	public String pwdUpdateForm() {
		return "common/pwdUpdateForm";
	}
	
	
	
	
}
