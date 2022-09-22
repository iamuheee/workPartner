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
		
//		for (int i = 0; i < array.length; i++) 
//	 	{   
//		 System.out.println(array[i]);    
//	 	}
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.myAttendanceList", map, rowBounds);
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


}
