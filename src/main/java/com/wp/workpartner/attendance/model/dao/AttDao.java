package com.wp.workpartner.attendance.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.attendance.model.vo.Attendance;
import com.wp.workpartner.attendance.model.vo.Department;
import com.wp.workpartner.attendance.model.vo.Holiday;
import com.wp.workpartner.attendance.model.vo.Position;
import com.wp.workpartner.attendance.model.vo.Vacation;
import com.wp.workpartner.common.model.vo.PageInfo;

@Repository
public class AttDao {
	
	public int selectSearchCount(String date1, String date2, String condition, String keyword, SqlSessionTemplate sqlSession) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("date1", date1);
		map.put("date2", date2);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("attendanceMapper.selectSearchCount", map);
	}

	public ArrayList<Attendance> selectSearchList(String date1, String date2, String condition, String keyword,
			PageInfo pi, SqlSessionTemplate sqlSession) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("date1", date1);
		map.put("date2", date2);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit); 
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectSearchList", map, rowBounds);
	}

	public int statusCount(String a, String date1, String date2, String condition, String keyword, SqlSessionTemplate sqlSession) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("date1", date1);
		map.put("date2", date2);
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("a", a);
		
		return sqlSession.selectOne("attendanceMapper.statusCount", map);
	}

	public ArrayList<Department> departmentList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.departmentList");
	}

	public ArrayList<Position> positionList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.positionList");
	}

	public int insertPosition(String positionCode, String positionName, SqlSessionTemplate sqlSession) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("positionCode", positionCode);
		map.put("positionName", positionName);
		
		return sqlSession.insert("attendanceMapper.insertPosition", map);
	}

	public int insertDepartment(String departmentCode, String departmentName, SqlSessionTemplate sqlSession) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("departmentCode", departmentCode);
		map.put("departmentName", departmentName);
		
		return sqlSession.insert("attendanceMapper.insertDepartment", map);
		
	}

	public int updatePosition(String positionCode1, String positionName1, String positionCode2, String positionName2,
			SqlSessionTemplate sqlSession) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("positionCode1", positionCode1);
		map.put("positionName1", positionName1);
		map.put("positionCode2", positionCode2);
		map.put("positionName2", positionName2);
		
		return sqlSession.update("attendanceMapper.updatePosition", map);
	}

	public int deletePosition(String positionCode1, String positionName1, SqlSessionTemplate sqlSession) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("positionCode1", positionCode1);
		map.put("positionName1", positionName1);
		
		return sqlSession.delete("attendanceMapper.deletePosition", map);
	
	}

	public int updateDepartment(String departmentCode1, String departmentName1, String departmentCode2,
			String departmentName2, SqlSessionTemplate sqlSession) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("departmentCode1", departmentCode1);
		map.put("departmentName1", departmentName1);
		map.put("departmentCode2", departmentCode2);
		map.put("departmentName2", departmentName2);
		
		return sqlSession.update("attendanceMapper.updateDepartment", map);
		
	}

	public int deleteDepartment(String departmentCode1, String departmentName1, SqlSessionTemplate sqlSession) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("departmentCode1", departmentCode1);
		map.put("departmentName1", departmentName1);
		
		return sqlSession.delete("attendanceMapper.deleteDepartment", map);
	}

	public ArrayList<Holiday> holidayList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.holidayList");
	}
	
	
	public int insertHoliday(String holidayCode, String holidayName, SqlSessionTemplate sqlSession) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("holidayCode", holidayCode);
		map.put("holidayName", holidayName);
		
		return sqlSession.insert("attendanceMapper.insertHoliday", map);
	}
	
	public int updateHoliday(String holidayCode1, String holidayName1, String holidayCode2, String holidayName2,
			SqlSessionTemplate sqlSession) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("holidayCode1", holidayCode1);
		map.put("holidayName1", holidayName1);
		map.put("holidayCode2", holidayCode2);
		map.put("holidayName2", holidayName2);
		
		return sqlSession.update("attendanceMapper.updateHoliday", map);
	}

	public int deleteHoliday(String holidayCode1, String holidayName1, SqlSessionTemplate sqlSession) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("holidayCode1", holidayCode1);
		map.put("holidayName1", holidayName1);
		
		return sqlSession.delete("attendanceMapper.deleteHoliday", map);
	
	}

	public int myAttendanceCount(String date1, String date2, String[] array, SqlSessionTemplate sqlSession, String id) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("date1", date1);
		map.put("date2", date2);
		map.put("id", id);
		map.put("array", array);
		
		return sqlSession.selectOne("attendanceMapper.myAttendanceCount", map);
	}

	public ArrayList<Attendance> myAttendanceList(String date1, String date2, String[] array,
			SqlSessionTemplate sqlSession, PageInfo pi, String id) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("date1", date1);
		map.put("date2", date2);
		map.put("array", array);
		map.put("id", id);
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.myAttendanceList", map, rowBounds);
	}
	
	public int myAttendanceCount(String date1, String date2, SqlSessionTemplate sqlSession, String id) {
			
		HashMap<String, Object> map = new HashMap<>();
		map.put("date1", date1);
		map.put("date2", date2);
		map.put("id", id);
		
		return sqlSession.selectOne("attendanceMapper.myAttendanceCount2", map);
	}

	public ArrayList<Attendance> myAttendanceList(String date1, String date2,
			SqlSessionTemplate sqlSession, PageInfo pi, String id) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("date1", date1);
		map.put("date2", date2);
		map.put("id", id);
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.myAttendanceList2", map, rowBounds);
	}

	
	public ArrayList<Attendance> badWorkList(String empNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.badWorkList", empNo);
	}

	public ArrayList<Attendance> goodWorkList(String empNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.goodWorkList", empNo);
	}

	public ArrayList<Attendance> vacationWorkList(String empNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.vacationWorkList", empNo);
	}
	public ArrayList<Attendance> bad2WorkList(String empNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.bad2WorkList", empNo);
	}

	public ArrayList<Attendance> timeSelect(String empNo, SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("attendanceMapper.timeSelect", empNo);
		
	}

	public ArrayList<Attendance> checkHoliday(String empNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.checkHoliday", empNo);
	}

	public int goWorkCheck(String empNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("attendanceMapper.goWorkCheck", empNo);
	}

	public int outWorkCheck(String empNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("attendanceMapper.outWorkCheck", empNo);
	}

	public ArrayList<Attendance> checkMonth(String empNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.checkMonth", empNo);
	}

	public String checkWorkYears(String empNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("attendanceMapper.checkWorkYears", empNo);
	}

	public ArrayList<Attendance> checkWorkStatus(String empNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.checkWorkStatus", empNo);
	}

	public int giveVacation0(String empNo, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("attendanceMapper.giveVacation0", empNo);
	}
	
	public int giveVacation00(String empNo, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("attendanceMapper.giveVacation00", empNo);
	}

	public int giveVacation1(String empNo, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("attendanceMapper.giveVacation1", empNo);
	}

	public int plusVacation0(String empNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("attendanceMapper.plusVacation0", empNo);
	}

	public int plusVacation1(String empNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("attendanceMapper.plusVacation1", empNo);
	}

	public int vacationCount(String condition, String keyword, SqlSessionTemplate sqlSession) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("attendanceMapper.vacationCount", map);
	}

	public ArrayList<Attendance> vacationList(String condition, String keyword, PageInfo pi,
			SqlSessionTemplate sqlSession) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.vacationList", map, rowBounds);
	}

	public ArrayList<Attendance> myAttendanceList2(String id, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.myAttendanceList3",id);
	}

	public int myVacationCount(String empNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("attendanceMapper.myVacationCount",empNo);
	}

	public ArrayList<Vacation> myVacationList(String empNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.myVacationList", empNo);
	}

	public ArrayList<Vacation> myVacationList2(String empNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.myVacationList2", empNo);
	}

	public ArrayList<Vacation> myVacationList3(String empNo, PageInfo pi, SqlSessionTemplate sqlSession) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.myVacationList3", empNo, rowBounds);
	}

	public int resetVacation(String empNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("attendanceMapper.resetVacation", empNo);
	}

	public ArrayList<Vacation> changeAttendanceTime(String empNo, String time, SqlSessionTemplate sqlSession) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("time", time);
		map.put("empNo", empNo);
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.changeAttendanceTime", map);
	}

	public int changeAttendanceTime2(String empNo, String text1, String text2, String text3, String text4, String text5,
			String text6, SqlSessionTemplate sqlSession) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("text1", text1);
		map.put("text2", text2);
		map.put("text3", text3);
		map.put("text4", text4);
		map.put("text5", text5);
		map.put("text6", text6);
		
		return sqlSession.insert("attendanceMapper.changeAttendanceTime2", map);
	}

	public int changeAttendanceTime3(String empNo, String text11, String text44, String text55, String text66,
			SqlSessionTemplate sqlSession) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("text11", text11);
		map.put("text44", text44);
		map.put("text55", text55);
		map.put("text66", text66);
		
		return sqlSession.insert("attendanceMapper.changeAttendanceTime3", map);
	}

	public ArrayList<Vacation> adminAttAdjust(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.adminAttAdjust");
	}
	
	public ArrayList<Vacation> adminAttAdjust2(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.adminAttAdjust2");
	}
	
	public int agreeModify(String aatNo, String empName, String date, SqlSessionTemplate sqlSession) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("empName", empName);
		map.put("aatNo", aatNo);
		map.put("date", date);
		
		return sqlSession.update("attendanceMapper.agreeModify", map);
	}

	public int paperModify(String aatNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("attendanceMapper.paperModify", aatNo);
	}
	
	public int paperModify2(String aatNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("attendanceMapper.paperModify2", aatNo);
	}
	
	public int paperModify3(String aatNo, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("attendanceMapper.paperModify3", aatNo);
	}

	public ArrayList<Vacation> adminAttAdjust(SqlSessionTemplate sqlSession, String empNo) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.adminAttAdjust", empNo);
	}

	public ArrayList<Vacation> adminAttAdjust2(SqlSessionTemplate sqlSession, String empNo) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.adminAttAdjust2", empNo);
	}

	public int cancelModify(SqlSessionTemplate sqlSession, String aatNo) {
		return sqlSession.delete("attendanceMapper.cancelModify", aatNo);
	}

	public ArrayList<Vacation> detail(SqlSessionTemplate sqlSession, String aatNo) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.detail", aatNo);
	}


}
