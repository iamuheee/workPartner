package com.wp.workpartner.employee.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.wp.workpartner.address.model.vo.Department;
import com.wp.workpartner.address.model.vo.Position;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.common.template.FileUpload;
import com.wp.workpartner.common.template.Pagination;
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
				
//		System.out.println(loginUser);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(e.getEmpPwd(), loginUser.getEmpPwd())) {	// 로그인 성공
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("common/mainPage");
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
	
	@RequestMapping("main")
	public String mainPage() {
		return "common/mainPage";
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
	 * @date	: 2022. 9. 14.
	 * @method	: 사용자 등록 요청 처리
	 * @param	: Employee e, upfile(프로필 사진 파일)
	 * @return	: String "redirect:list.em" 
	 */
	@RequestMapping("insert.em")
	public String insertEmployee(Employee e, MultipartFile upfile, HttpSession session, Model model) {

		// 비밀번호 암호화
		String encPwd = bcryptPasswordEncoder.encode(e.getEmpPwd());
//		System.out.println("암호화된 비밀번호 : " + encPwd);
		e.setEmpPwd(encPwd);
					
		// 프로필 사진을 등록한 경우
		if(!upfile.getOriginalFilename().equals("")) {
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/profile_images/");
			e.setEmpProfile(saveFilePath);
		}
				
		int result = eService.insertEmployee(e);
		
		if(result > 0) {	// 사용자 등록 성공
			session.setAttribute("alertMsg", "사용자 등록에 성공했습니다.");
			return "redirect:list.em";	// 사용자 조회 페이지 url 재요청
			
		}else {	// 사용자 등록
			model.addAttribute("errorMsg", "사용자 등록 실패");
			return "common/error";
		}
	}
	
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 14.
	 * @method	: 아이디 중복 체크 요청 처리 (ajax)
	 * @param	: String checkId
	 * @return	: 중복 시 "NNNNN", 아닐 시 "NNNNY"
	 */
	@ResponseBody	// 리턴하는 문자열이 응답view가 아닌 데이터임을 선언하는 어노테이션
	@RequestMapping("idCheck.em")
	public String ajaxIdCheck(String checkId) {
		int count = eService.idCheck(checkId);
		return (count > 0) ? "NNNNN" : "NNNNY";
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
	 * @date	: 2022. 9. 14.
	 * @method	: 사용자 조회/수정 페이지 이동 요청 처리
	 * @return	: String "employee/employeeListView.jsp"
	 */
	@RequestMapping("list.em")
	public String selectList() {
		return "employee/employeeListView";
	}
	
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 14.
	 * @method	: (ajax) 사용자 조회 요청 처리 
	 * @return	: list(사용자 리스트), pi(페이징처리)
	 */
	@ResponseBody
	@RequestMapping(value="listSelect.em", produces="application/json; charset=UTF-8")
	public String ajaxSelectEmpList(@RequestParam(value="cpage", defaultValue="1") int currentPage, @RequestParam(value="sort", defaultValue="10") int boardLimit) {
		
		int listCount = eService.selectEmpListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, boardLimit);
		ArrayList<Employee> list = eService.selectEmpList(pi);
		
//		System.out.println(list);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pi", pi);
		
		return new Gson().toJson(map);
	}
	
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 15.
	 * @method	: (ajax) 사용자 검색 결과 목록 조회 요청 처리
	 * @param	: condition(검색조건), keyword(검색어), currentPage, boardLimit(셀렉트 옵션으로 받아옴)
	 * @return	: list, pi
	 */
	@ResponseBody
	@RequestMapping(value="search.em", produces="application/json; charset=UTF-8")
	public String ajaxSelectSearchList(String condition, @RequestParam(defaultValue="none") String keyword, @RequestParam(value="cpage", defaultValue="1") int currentPage, @RequestParam(value="sort", defaultValue="10") int boardLimit) {
		
		// 검색 결과에 맞는 페이징 처리 필요
		int searchCount = eService.selectSearchCount(condition, keyword);
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 5, boardLimit);
		
		ArrayList<Employee> searchList = eService.selectSearchList(condition, keyword, pi);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", searchList);
		map.put("pi", pi);
		
		return new Gson().toJson(map);
	}
	
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 15.
	 * @method	: (ajax) 사용자 간편 등록 요청 처리
	 * @param	: Employee e
	 * @return	: Employee e (새로 추가된 사용자에 대한 정보)
	 */
	@ResponseBody
	@RequestMapping(value="insertSimply.em", produces="application/json; charset=UTF-8")
	public String ajaxInsertEmployeeSimply(Employee e) {
				
		// 비밀번호 암호화
		String encPwd = bcryptPasswordEncoder.encode(e.getEmpPwd());
		e.setEmpPwd(encPwd);
//		System.out.println(e);
		
		int result = eService.insertEmployee(e);
//		System.out.println(result);
		
		HashMap<String, Object> map = new HashMap<>();
		
		if(result > 0) {	// 성공 시 새로 추가된 사용자 정보를 리턴
			Employee newEmp = eService.selectEmployee(e.getEmpId());
			map.put("e", newEmp);
		}
		return new Gson().toJson(map);
	}
	
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 15.
	 * @method	: (ajax) 개별 사용자 정보 조회 요청 처리 
	 * @param	: empId
	 * @return	: Employee e, Department d, Position p
	 */
	@ResponseBody
	@RequestMapping(value="select.em", produces="application/json; charset=UTF-8")
	public String ajaxSelectEmployee(String empId) {
//		System.out.println(empId);
		Employee e = eService.selectEmployee(empId);
		
		ArrayList<Department> d = eService.selectDepartment();
		ArrayList<Position> p = eService.selectPosition();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("e", e);
		map.put("d", d);
		map.put("p", p);
		
		return new Gson().toJson(map);
	}
	
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 16.
	 * @method	: (ajax) 관리자의 사용자 정보 수정 요청 처리
	 * @param	: Employee e
	 * @return	: String result
	 */
	@ResponseBody
	@RequestMapping("update.em")
	public String ajaxUpdateEmployee(Employee e) {
//		System.out.println(e);
		
		int result = eService.updateEmployee(e);
		
		return (result > 0) ? "success" : "fail";
	}
	
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 16.
	 * @method	: (ajax) 사용자 계정 상태 변경 요청 처리 
	 * @param	: empId, accStatus(현재 계정 상태 - "정상" || "휴면)
	 * @return	: String result
	 */
	@ResponseBody
	@RequestMapping("updateAcc.em")
	public String ajaxUpdateAccStatus(String empId, String accStatus) {
		System.out.println("empId : " + empId);
		System.out.println("accStatus : " + accStatus);
		
		int result = eService.updateAccStatus(empId, accStatus);
		return (result > 0) ? "success" : "fail";
	}
	
}
