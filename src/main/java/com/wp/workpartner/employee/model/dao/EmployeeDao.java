package com.wp.workpartner.employee.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.employee.model.vo.Employee;

@Repository
public class EmployeeDao {

	public Employee loginEmployee(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.selectOne("employeeMapper.loginEmployee", e);
	}
	
	public int insertEmployee(SqlSessionTemplate sqlSession, Employee e) {
		
		return sqlSession.insert("employeeMapper.insertEmployee", e);
	}
}
