package com.wp.workpartner.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.wp.workpartner.employee.model.vo.Employee;

public interface NoticeService {
	
	// [공지사항 관리자 설정]
	// 1. 관리자 조회
	ArrayList<Employee> selectNtAdminY();
	
	// 2. 관리자변경 Y => N
	int upDateAdminN(String empNo);
	
	// 3. 관리자변경 Y
	int updateAdminY(HashMap<String, Object> map);
	
	
	
}
