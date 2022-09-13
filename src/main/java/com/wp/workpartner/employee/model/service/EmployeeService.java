package com.wp.workpartner.employee.model.service;

import com.wp.workpartner.employee.model.vo.Employee;

public interface EmployeeService {
	
	// 로그인 서비스 (select)
	Employee loginEmployee(Employee e);
	
	// 아이디 찾기 / 비밀번호 찾기
	// 이름, 사번, 외부이메일 일치하는 사원 정보 넘겨서 이메일로 발송
	// ==> 이메일 조회 (select)
	Employee selectExemail(Employee e);
	
	// 구성원 등록 서비스 (insert)
	int insertEmployee(Employee e);
	
	// 개인정보 수정 서비스 (update)
	int updateEmployee(Employee e);
	
	// 계정 비활성화 서비스 (update)
	int deleteEmployee(Employee e);
	
	// 아이디 중복체크 서비스 (select) -- ajax
	int idCheck(String userId);
	
	// 이메일 체크 서비스 (select) -- ajax
	// ==> 이메일 유효성 검사 + 등록된 외부 이메일인지 확인
	// ==> 등록된 외부 이메일이 맞는지 확인이 필요한가? (고민)
	int exemailCheck(Employee e);
	
	// 프로필 이미지 변경 서비스 (update) -- ajax
	int updateProfile(Employee e);

}