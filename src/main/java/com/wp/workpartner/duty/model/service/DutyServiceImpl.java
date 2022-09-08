package com.wp.workpartner.duty.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.common.model.vo.Comment;
import com.wp.workpartner.duty.model.dao.DutyDao;
import com.wp.workpartner.duty.model.vo.Duty;

@Service
public class DutyServiceImpl implements DutyService {
	
	@Autowired
	private DutyDao dDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	// bean 등록 root-context.xml에서 했음

	// 아래부터 Override된 메소드

	@Override
	public int insertDuty(Duty d) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Duty> selectDutyList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectDutyListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Duty selectDuty(int dutyNo) {
		// TODO Auto-generated method stub
		return null;
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
