package com.wp.workpartner.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.notice.model.dao.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao ntDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 추가 관리자인 사원들 조회
	@Override
	public ArrayList<Employee> selectNtAdminY() {
		return ntDao.selectNtAdminY(sqlSession);
	}
	
	// 관리자 => 일반사원
	@Override
	public int upDateAdminN(String empNo) {
		return ntDao.upDateAdminN(sqlSession, empNo);
	}

	// => 관리자
	@Override
	public int updateAdminY(HashMap<String, Object> map) {
		return ntDao.updateAdminY(sqlSession, map);
	}
	
	
	
	
	
	
	
}
