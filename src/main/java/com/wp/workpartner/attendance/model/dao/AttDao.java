package com.wp.workpartner.attendance.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.attendance.model.vo.Attendance;
import com.wp.workpartner.attendance.model.vo.Department;
import com.wp.workpartner.attendance.model.vo.Position;
import com.wp.workpartner.common.model.vo.PageInfo;

@Repository
public class AttDao {
	
	// 전사원근태현황조회
	
	public int selectSearchCount(String date1, String date2, String condition, String keyword, SqlSessionTemplate sqlSession) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("date1", date1);
		map.put("date2", date2);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		System.out.println(map);
		
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


}
