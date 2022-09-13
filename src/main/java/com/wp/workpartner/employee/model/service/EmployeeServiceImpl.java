package com.wp.workpartner.employee.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.employee.model.dao.EmployeeDao;
import com.wp.workpartner.employee.model.vo.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private EmployeeDao eDao;
	
	@Override
	public Employee loginEmployee(Employee e) {
		return eDao.loginEmployee(sqlSession, e);
	}

	@Override
	public Employee selectExemail(Employee e) {
		return null;
	}

	@Override
	public int insertEmployee(Employee e) {
		return eDao.insertEmployee(sqlSession, e);
	}

	@Override
	public int updateEmployee(Employee e) {
		return 0;
	}

	@Override
	public int deleteEmployee(Employee e) {
		return 0;
	}

	@Override
	public int idCheck(String userId) {
		return 0;
	}

	@Override
	public int exemailCheck(Employee e) {
		return 0;
	}

	@Override
	public int updateProfile(Employee e) {
		return 0;
	}

}
