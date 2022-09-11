package com.wp.workpartner.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ten
 *
 */
@Controller
public class EmployeeController {

	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 로그인 페이지 이동 요청 처리 메소드
	 * @return	: String "common/loginForm"
	 */
	@RequestMapping("loginForm.em") 
	public String loginForm() {
		return "employee/loginForm";
	}
	
	/**
	 * jsp 연결 위해 임시로 작성
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 로그아웃 요청 처리 메소드
	 * @return	: String "employee/loginForm"
	 */
	@RequestMapping("logout.em")
	public String logoutEmployee() {
		return "employee/loginForm";
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 아이디 찾기 페이지 요청 처리 메소드
	 * @return	: String "employee/idSelectForm";
	 */
	@RequestMapping("idSelectForm.em")
	public String idSelectForm() {
		return "employee/idSelectForm";
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 임시 비밀번호 발급 페이지 요청 처리 메소드
	 * @return	: String "employee/pwdUpdateForm";
	 */
	@RequestMapping("pwdUpdateForm.em")
	public String pwdUpdateForm() {
		return "employee/pwdUpdateForm";
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 마이페이지 요청 처리 메소드
	 * @return	: String "employee/myPage";
	 */
	@RequestMapping("mypage.em")
	public String myPage() {
		return "employee/myPage";
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 사용자 등록 페이지 요청 처리 메소드
	 * @return	: String "employee/employeeInsertForm";
	 */
	@RequestMapping("insertForm.em")
	public String empInsertForm() {
		return "employee/employeeInsertForm";
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 사용자 조회 요청 처리 메소드 
	 * @return	: String "employee/employeeListView"
	 */
	@RequestMapping("list.em")
	public String selectEmpList() {
		return "employee/employeeListView";
	}
	
}
