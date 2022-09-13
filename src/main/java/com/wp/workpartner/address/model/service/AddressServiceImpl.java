package com.wp.workpartner.address.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.address.model.dao.AddressDao;
import com.wp.workpartner.address.model.vo.Department;
import com.wp.workpartner.address.model.vo.MyAddress;
import com.wp.workpartner.address.model.vo.MyGroup;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.employee.model.vo.Employee;

@Service 
public class AddressServiceImpl implements AddressService {
	
	@Autowired
	private AddressDao adDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 부서목록
	@Override
	public ArrayList<Department> selectDepList() {
		return adDao.selectDepList(sqlSession);
	}

	// 내연락처 그룹목록
	@Override
	public ArrayList<MyGroup> selectGpList(String empNo) {
		return adDao.selectGpList(sqlSession, empNo);
	}
	
	// 1_1부서별 직원 목록
	@Override
	public ArrayList<Employee> selectEmpAdList(int depCd, PageInfo pi) {
		return adDao.selectEmpAdList(sqlSession, depCd, pi);
	}

	// 1_2 부서별 직원 목록
	@Override
	public int selectEmpAdListCount(int depCd) {
		return adDao.selectEmpAdListCount(sqlSession, depCd);
	}

	// 2_1 내연락처 테이블
	@Override
	public int selectMyAddCount(int groupNo) {
		return adDao.selectMyAddCount(sqlSession, groupNo);
	}
	// 2_2 내연락처 테이블
	@Override
	public ArrayList<MyAddress> selectMyAddList(int groupNo, PageInfo pi) {
		return adDao.selectMyAddList(sqlSession, groupNo, pi);
	}
	
	// 3_1 별표연락처 테이블
	@Override
	public int selectStarAdCount(String empNo) {
		return adDao.selectStarAdCount(sqlSession, empNo);
	}
	
	// 3_2 별표연락처 테이블
	@Override
	public ArrayList<MyAddress> selectStarList(String empNo, PageInfo pi) {
		return adDao.selectStarList(sqlSession, empNo, pi);
	}

	
	/** 테이블 선택시 회사 내 직원 상세정보	 
	 */
	@Override
	public ArrayList<Employee> selectDetailEmp(String empNo) {
		return adDao.selectDetailEmp(sqlSession, empNo);
	}
	

}
