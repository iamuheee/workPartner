package com.wp.workpartner.employee.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.address.model.vo.Department;
import com.wp.workpartner.address.model.vo.Position;
import com.wp.workpartner.common.model.vo.PageInfo;
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
		return eDao.updateEmployee(sqlSession, e);
	}

	@Override
	public int deleteEmployee(Employee e) {
		return 0;
	}

	@Override
	public int idCheck(String empId) {
		return eDao.idCheck(sqlSession, empId);
	}

	@Override
	public int exemailCheck(Employee e) {
		return 0;
	}

	@Override
	public int updateProfile(Employee e) {
		return 0;
	}


	@Override
	public int selectEmpListCount() {
		return eDao.selectEmpListCount(sqlSession);
	}

	@Override
	public ArrayList<Employee> selectEmpList(PageInfo pi) {
		return eDao.selectEmpList(sqlSession, pi);
	}

	@Override
	public int selectSearchCount(String condition, String keyword) {
		return eDao.selectSearchCount(sqlSession, condition, keyword);
	}

	@Override
	public ArrayList<Employee> selectSearchList(String condition, String keyword, PageInfo pi) {
		return eDao.selectSearchList(sqlSession, condition, keyword, pi);
	}

	@Override
	public Employee selectEmployee(String empId) {
		return eDao.selectEmployee(sqlSession, empId);
	}

	@Override
	public ArrayList<Department> selectDepartment() {
		return eDao.selectDepartment(sqlSession);
	}

	@Override
	public ArrayList<Position> selectPosition() {
		return eDao.selectPosition(sqlSession);
	}
	
	

}
