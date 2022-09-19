package com.wp.workpartner.attendance.model.service;

import java.util.ArrayList;

import com.wp.workpartner.attendance.model.vo.Attendance;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.duty.model.vo.Duty;

public interface AttService {

	// 전사원근태현황조회
	int selectSearchCount(String date1, String date2, String condition, String keyword); // 여러가지 필터에 대한 리스트 개수도 이 메소드를 통해 할 것임
	ArrayList<Attendance> selectSearchList(String date1, String date2, String condition, String keyword, PageInfo pi, Sql);
	
}
