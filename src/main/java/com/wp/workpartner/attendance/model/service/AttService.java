package com.wp.workpartner.attendance.model.service;

import java.util.ArrayList;

import com.wp.workpartner.attendance.model.vo.Attendance;
import com.wp.workpartner.attendance.model.vo.Department;
import com.wp.workpartner.attendance.model.vo.Holiday;
import com.wp.workpartner.attendance.model.vo.Position;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.duty.model.vo.Duty;

public interface AttService {

	// 전사원근태현황조회
	int selectSearchCount(String date1, String date2, String condition, String keyword); // 여러가지 필터에 대한 리스트 개수도 이 메소드를 통해 할 것임
	ArrayList<Attendance> selectSearchList(String date1, String date2, String condition, String keyword, PageInfo pi);
	int statusCount(String a, String date1, String date2, String condition, String keyword);
	
	// 부서데이터가져오기
	ArrayList<Department> departmentList();
	
	// 직위데이터가져오기
	ArrayList<Position> positionList();
	
	// 직위등록하기
	int insertPosition(String positionCode, String positionName);
	
	// 부서등록하기
	int insertDepartment(String departmentCode, String departmentName);
	
	// 직위 수정
	int updatePosition(String positionCode1, String positionName1, String positionCode2, String positionName2);
	
	// 직위 삭제
	int deletePosition(String positionCode1, String positionName1);
	
	// 부서 수정
	int updateDepartment(String departmentCode1, String departmentName1, String departmentCode2,
			String departmentName2);
	
	// 부서 삭제
	int deleteDepartment(String departmentCode1, String departmentName1);
	
	// 공휴일데이터가져오기
	ArrayList<Holiday> holidayList();
	
	// 공휴일 등록
	int insertHoliday(String holidayCode, String holidayName);
	
	// 공휴일 수정
	int updateHoliday(String holidayCode1, String holidayName1, String holidayCode2, String holidayName2);
	
	// 공휴일 삭제
	int deleteHoliday(String holidayCode1, String holidayName1);
	
	// 내 근태 내역 조회
	int myAttendanceCount(String date1, String date2, String[] array, String id);
	ArrayList<Attendance> myAttendanceList(String date1, String date2, String[] array, PageInfo pi, String id);
	
	// 달력 띄우기
	ArrayList<Attendance> badWorkList(String empNo);
	ArrayList<Attendance> goodWorkList(String empNo);
	ArrayList<Attendance> vacationWorkList(String empNo);
	ArrayList<Attendance> bad2WorkList(String empNo);
	
	//메인 페이지 시간 띄우기
	ArrayList<Attendance> timeSelect(String empNo);
	
	
	
	
}

