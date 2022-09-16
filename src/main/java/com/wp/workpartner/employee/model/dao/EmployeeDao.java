package com.wp.workpartner.employee.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.employee.model.vo.Employee;

@Repository
public class EmployeeDao {

	public Employee loginEmployee(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.selectOne("employeeMapper.loginEmployee", e);
	}
	
	public int insertEmployee(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.insert("employeeMapper.insertEmployee", e);
	}
	
	public int idCheck(SqlSessionTemplate sqlSession, String empId) {
		return sqlSession.selectOne("employeeMapper.idCheck", empId);
	}
	
	public int selectEmpListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("employeeMapper.selectEmpListCount");
	}
	
	public ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("employeeMapper.selectEmpList", null, rowBounds);
	}
	
	public int selectSearchCount(SqlSessionTemplate sqlSession, String condition, String keyword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
				
		return sqlSession.selectOne("employeeMapper.selectSearchCount", map);
	}
	
	public ArrayList selectSearchList(SqlSessionTemplate sqlSession, String condition, String keyword, PageInfo pi) {
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("employeeMapper.selectSearch", map, rowBounds);
	}
	
	public Employee selectEmployee(SqlSessionTemplate sqlSession, String empId) {
		return sqlSession.selectOne("employeeMapper.selectEmployee", empId);
	}
	
	public ArrayList selectDepartment(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("employeeMapper.selectDepartment");
	}
	
	public ArrayList selectPosition(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("employeeMapper.selectPosition");
	}
	
	public int updateEmployee(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.updateEmployee", e);
	}
	
	public int updateAccStatus(SqlSessionTemplate sqlSession, String empId, String accStatus) {
		HashMap<String, String> map = new HashMap<>();
		map.put("empId", empId);
		map.put("accStatus", accStatus);
		
		return sqlSession.update("employeeMapper.updateAccStatus", map);
	}
}
