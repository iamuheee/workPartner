package com.wp.workpartner.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wp.workpartner.employee.model.service.EmployeeServiceImpl;
import com.wp.workpartner.employee.model.vo.Employee;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeServiceImpl eService; 
	
	@Autowired	
	private BCryptPasswordEncoder bcryptPasswordEncoder;	// 비밀번호 암호화
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 로그인 페이지 이동 요청 처리
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
		
		System.out.println(loginUser);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(e.getEmpPwd(), loginUser.getEmpPwd())) {	// 로그인 성공
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}else {	// 로그인 성공
			mv.addObject("errorMsg", "로그인 실패");
			mv.setViewName("common/error");
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
	 * @method	: 사용자 등록 페이지 이동 요청 처리
	 * @return	: String "employee/employeeInsertForm";
	 */
	@RequestMapping("enrollForm.em")
	public String enrollForm() {
		return "employee/employeeEnrollForm";
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 13.
	 * @method	: 사용자 등록 요청 처리
	 * @param	: Employee e
	 * @return	: String "redirect:list.em" 
	 */
	@RequestMapping("insert.em")
	public String insertEmployee(Employee e, HttpSession session, Model model) {
		String encPwd = bcryptPasswordEncoder.encode(e.getEmpPwd());
//		System.out.println("암호화된 비밀번호 : " + encPwd);
		
		e.setEmpPwd(encPwd);
		
		// 사번 생성을 위한 입사연도 끝 두 자리 추출
		String enrollYear = e.getEmpEnrollDate().substring(2, 4);
		
//		System.out.println(e);
//		System.out.println(enrollYear);
		
		e.setEmpEnrollYear(enrollYear);
				
		int result = eService.insertEmployee(e);
		
		if(result > 0) {	// 사용자 등록 성공
			session.setAttribute("alertMsg", "사용자 등록에 성공했습니다.");
			return "redirect:list.em";	// 사용자 조회 페이지 url 재요청
			
		}else {	// 사용자 등록
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/error";
		}
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
	 * @method	: 사용자 조회 요청 처리 메소드 
	 * @return	: String "employee/employeeListView"
	 */
	@RequestMapping("list.em")
	public String selectEmpList() {
		return "employee/employeeListView";
	}
	
}
