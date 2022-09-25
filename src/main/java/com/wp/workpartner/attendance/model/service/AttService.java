package com.wp.workpartner.attendance.model.service;

import java.util.ArrayList;

import com.wp.workpartner.attendance.model.vo.Attendance;
import com.wp.workpartner.attendance.model.vo.Department;
import com.wp.workpartner.attendance.model.vo.Holiday;
import com.wp.workpartner.attendance.model.vo.Position;
import com.wp.workpartner.attendance.model.vo.Vacation;
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
	
	//오늘인 쉬는날인지 체크
	ArrayList<Attendance> checkHoliday(String empNo);
	
	//출석체크
	int goWorkCheck(String empNo);
	
	// 내 근무 이력 (조건없을떄)
	int myAttendanceCount(String date1, String date2, String id);
	ArrayList<Attendance> myAttendanceList(String date1, String date2, PageInfo pi, String id);
	
	// 퇴근하기
	int outWorkCheck(String empNo);
	
	// 월말인지 구하기
	ArrayList<Attendance> checkMonth(String empNo);
	
	// 근무연수 구하기
	String checkWorkYears(String empNo);
	
	// 결근 있는지 구하기
	ArrayList<Attendance> checkWorkStatus(String empNo);
	
	// 0연차 연차 지급
	int giveVacation0(String empNo);
	
	// 0연차 연차 지급
		int giveVacation00(String empNo);  //연말

	
	// 1년차 이상 지급
	int giveVacation1(String empNo);
	
	// 0연차 연차 지급 employee테이블 업데이트
	int plusVacation0(String empNo);
	
	
	// 1연차 연차 지급 employee테이블 업데이트
	int plusVacation1(String empNo);
	
	// 전체 회원 휴가 조회 수 
	int vacationCount(String condition, String keyword);
	
	// 전체 회원 휴가 조회
	ArrayList<Attendance> vacationList(String condition, String keyword, PageInfo pi);
	
	// 내 근태이력 시간 계산
	ArrayList<Attendance> myAttendanceList2(String id);
	
	// 내 휴가 
	int myVacationCount(String empNo);
	ArrayList<Vacation> myVacationList(String empNo);
	ArrayList<Vacation> myVacationList2(String empNo);
	ArrayList<Vacation> myVacationList3(String empNo, PageInfo pi);
	
	// 연차 정보 지우기
	int resetVacation(String empNo);
	
	// 출퇴근시간변경
	ArrayList<Vacation> changeAttendanceTime(String empNo, String time);
	int changeAttendanceTime2(String empNo, String text1, String text2, String text3, String text4, String text5, String text6);
	int changeAttendanceTime3(String empNo, String text11, String text44, String text55, String text66);
	
	// 전사원 근태조정내역
	ArrayList<Vacation> adminAttAdjust();
	ArrayList<Vacation> adminAttAdjust2();
	int agreeModify(String aatNo, String empName);
	

	
	
	
	
}

