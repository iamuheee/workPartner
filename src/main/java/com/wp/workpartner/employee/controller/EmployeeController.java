package com.wp.workpartner.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wp.workpartner.employee.model.service.EmployeeServiceImpl;
import com.wp.workpartner.employee.model.vo.Employee;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeServiceImpl eService; 

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
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 13.
	 * @method	: 로그인 요청 처리
	 * @param	: Employee e (empId, empPwd)
	 * @return	: ModelAndView
	 */
	@RequestMapping("login.em")
	public ModelAndView loginEmployee(Employee e, HttpSession session, ModelAndView mv) {
		
//		System.out.println("ID : " + e.getEmpId());
//		System.out.println("pwd : " + e.getEmpPwd());
		
		Employee loginUser = eService.loginEmployee(e);
		
//		System.out.println(loginUser);
		
		if(loginUser == null) {	// 로그인 실패
			mv.addObject("errorMsg", "로그인 실패");
			mv.setViewName("common/error");
		}else {	// 로그인 성공
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 로그아웃 요청 처리
	 * @return	: String "employee/loginForm"
	 */
	@RequestMapping("logout.em")
	public String logoutEmployee(HttpSession session) {
		session.invalidate();	// 세션 만료
		return "employee/loginForm";
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 아이디 찾기 페이지 이동 요청 처리 메소드
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
