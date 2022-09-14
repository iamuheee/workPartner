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
	public int insertDutyWithFile(Duty d, String empIC, File f) {
		// TB_DUTY, TB_DUTY_CHARGE, TB_FILE에 각각 INSERT문 실행
		// 단, TB_DUTY_CHARGE, TB_FILE에는 DUTY_NO가 필요하므로 TB_DUTY를 먼저 변화시켜야 외래키로 쓸 수 있음
		
		// TB_DUTY 		  : Duty d 필요 (1)
		// TB_DUTY_CHARGE : DutyCharge dc 필요 <- 그런데, EMP_NAME을 알기 위해서는 DB에서 조회해야함
		// TB_FILE 		  : File f 필요
		
		int result1 = dDao.insertDuty(sqlSession, d);
		
		ArrayList<DutyCharge> list = dDao.selectDutyCharge(sqlSession, empIC);
		int result2 = 0;
		for(DutyCharge dc : list) {
			result2 *= dDao.insertDutyCharge(sqlSession, dc);
		}
		
		int result3 = dDao.insertFile(sqlSession, f);
		
		return result1 * result2 * result3;
	}
	
	
	@Override
	public int insertDutyWithoutFile(Duty d, String empIC) {
		int result1 = dDao.insertDuty(sqlSession, d);
		
		ArrayList<DutyCharge> list = dDao.selectDutyCharge(sqlSession, empIC);
		int result2 = 0;
		for(DutyCharge dc : list) {
			result2 *= dDao.insertDutyCharge(sqlSession, dc);
		}
		return result1 * result2;
	}
	
	@Override
	public int selectDutyListCount() {
		return dDao.selectDutyListCount(sqlSession);
	}

	@Override
	public ArrayList<Duty> selectDutyList(PageInfo pi, String empNo) {
		// 업무 리스트도 조회하고
		// 업무별 담당자 리스트도 조회해야 함 (조회 후 같은 업무별 담당자 이름끼리 묶기)
		// To do 리스트 조회에서처럼 Duty 객체 안에 String[] 또는 ArrayList<TodoCharge>에 담당자 객체를 담아보기
		return dDao.selectDutyList(sqlSession, pi, empNo);
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
