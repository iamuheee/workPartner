package com.wp.workpartner.duty.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.common.model.vo.Comment;
import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.duty.model.dao.DutyDao;
import com.wp.workpartner.duty.model.vo.Duty;
import com.wp.workpartner.duty.model.vo.DutyCharge;

@Service
public class DutyServiceImpl implements DutyService {
	
	@Autowired
	private DutyDao dDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	// bean 등록 root-context.xml에서 했음

	
	// ====================================
	// 아래부터 Override된 메소드

	
	@Override
	public int insertDuty(Duty d) {
		return dDao.insertDuty(sqlSession, d);
	}
	
	@Override
	public int insertFile(File f) {
		return dDao.insertFile(sqlSession, f);
	}
	
	@Override
	public int selectDutyListCount() {
		return dDao.selectDutyListCount(sqlSession);
	}

	@Override
	public ArrayList<Duty> selectDutyList(PageInfo pi, String empNo) {
		return dDao.selectDutyList(sqlSession, pi, empNo);
	}
	
	@Override
	public ArrayList<DutyCharge> selectDutyChargeList(PageInfo pi, String empNo) {
		return dDao.selectDutyChargeList(sqlSession, pi, empNo);
	}

	@Override
	public Duty selectDuty(int dutyNo) {
		return dDao.selectDuty(sqlSession, dutyNo);
	}

	@Override
	public int updateDuty(Duty d) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteDuty(int dutyNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertDutyComment(Comment c) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateDutyComment(Comment c) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteDutyComment(int comNo) {
		// TODO Auto-generated method stub
		return 0;
	}


}
