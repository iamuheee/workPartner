package com.wp.workpartner.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.notice.model.vo.Notice;

public interface NoticeService {
	
	// [공지사항 관리자 설정]
	// 1. 관리자 조회
	ArrayList<Employee> selectNtAdminY();
	
	// 2. 관리자변경 Y => N
	int upDateAdminN(String empNo);
	
	// 3. 관리자변경 Y
	int updateAdminY(HashMap<String, Object> map);
	
	
	// [공지사항 전체 리스트]
	// 공지사항 상단 조회
	// 1. listCount
	int selectTopNoticeCount(HashMap<String,Object> map);
	
	// 2. list
	ArrayList<Notice> selectTopNotice(HashMap<String, Object> map, PageInfo pi);
	
	// 공지사항 일반조회
	// 1. listCount
	int selectNormalNoticeCount(HashMap<String,Object> map);
	
	// 2. list
	ArrayList<Notice> selectNormalNotice(HashMap<String, Object> map, PageInfo pi);
	
	
	
}
