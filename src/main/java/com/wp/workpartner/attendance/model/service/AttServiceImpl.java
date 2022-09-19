package com.wp.workpartner.attendance.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.attendance.model.dao.AttDao;
import com.wp.workpartner.attendance.model.vo.Attendance;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.duty.model.vo.Duty;

@Service
public class AttServiceImpl implements AttService{

	@Autowired
	private AttDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 전사원근태현황조회
	
	@Override
	public int selectSearchCount(String date1, String date2, String condition, String keyword) {
		return aDao.selectSearchCount(date1, date2, condition, keyword, sqlSession);
	}

	@Override
	public ArrayList<Attendance> selectSearchList(String date1, String date2, String condition, String keyword, PageInfo pi) {
		return (ArrayList)aDao.selectSearchList(date1, date2, condition, keyword, pi, sqlSession);
	}
	
}
