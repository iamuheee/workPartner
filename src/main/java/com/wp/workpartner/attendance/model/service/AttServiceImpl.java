package com.wp.workpartner.attendance.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.attendance.model.dao.AttDao;
import com.wp.workpartner.attendance.model.vo.Attendance;
import com.wp.workpartner.attendance.model.vo.Department;
import com.wp.workpartner.attendance.model.vo.Holiday;
import com.wp.workpartner.attendance.model.vo.Position;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.duty.model.vo.Duty;

@Service
public class AttServiceImpl implements AttService{

	@Autowired
	private AttDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 전사원근태현황조회
	
	  // 전체리스트개수
	@Override
	public int selectSearchCount(String date1, String date2, String condition, String keyword) {
		return aDao.selectSearchCount(date1, date2, condition, keyword, sqlSession);
	}
      // 전체리스트조회 
	@Override
	public ArrayList<Attendance> selectSearchList(String date1, String date2, String condition, String keyword, PageInfo pi ) {
		return (ArrayList)aDao.selectSearchList(date1, date2, condition, keyword, pi, sqlSession);
	}
	  // 상태별개수 조회
	@Override
	public int statusCount(String a, String date1, String date2, String condition, String keyword) {
		return aDao.statusCount(a, date1, date2, condition, keyword, sqlSession);
	}
	  // 부서조회
	@Override
	public ArrayList<Department> departmentList() {
		return aDao.departmentList(sqlSession);
	}
	
	// 직무조회	
	@Override
	public ArrayList<Position> positionList() {
		return aDao.positionList(sqlSession);
	}
	// 직무등록
	@Override
	public int insertPosition(String positionCode, String positionName) {
		return aDao.insertPosition(positionCode, positionName, sqlSession);
	}
	
	// 부서등록
	@Override
	public int insertDepartment(String departmentCode, String departmentName) {
		return aDao.insertDepartment(departmentCode, departmentName, sqlSession);
	}
	
	// 직위 수정
	@Override
	public int updatePosition(String positionCode1, String positionName1, String positionCode2, String positionName2) {
		return aDao.updatePosition(positionCode1, positionName1, positionCode2, positionName2, sqlSession);
	}
	
	// 직위 삭제
	@Override
	public int deletePosition(String positionCode1, String positionName1) {
		return aDao.deletePosition(positionCode1, positionName1, sqlSession);
	}
	
	// 부서 수정
	@Override
	public int updateDepartment(String departmentCode1, String departmentName1, String departmentCode2,
			String departmentName2) {
		return aDao.updateDepartment(departmentCode1, departmentName1, departmentCode2, departmentName2, sqlSession);
	}
	
	// 부서 삭제
	@Override
	public int deleteDepartment(String departmentCode1, String departmentName1) {
		return aDao.deleteDepartment(departmentCode1, departmentName1, sqlSession);
	}
	
	// 공휴일 조회
	@Override
	public ArrayList<Holiday> holidayList() {
		return aDao.holidayList(sqlSession);
	}
	
	// 공휴일 등록
	@Override
	public int insertHoliday(String holidayCode, String holidayName) {
		return aDao.insertHoliday(holidayCode, holidayName, sqlSession);
	}
	
	// 공휴일 수정
	@Override
	public int updateHoliday(String holidayCode1, String holidayName1, String holidayCode2, String holidayName2) {
		return aDao.updateHoliday(holidayCode1, holidayName1, holidayCode2, holidayName2, sqlSession);
	}
	
	// 공휴일 삭제
	@Override
	public int deleteHoliday(String holidayCode1, String holidayName1) {
		return aDao.deleteHoliday(holidayCode1, holidayName1, sqlSession);
	}

}
