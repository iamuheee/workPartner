package com.wp.workpartner.duty.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.duty.model.dao.DutyDao;
import com.wp.workpartner.duty.model.vo.Duty;
import com.wp.workpartner.duty.model.vo.DutyCharge;
import com.wp.workpartner.employee.model.vo.Employee;

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
	public int insertDutyWithFile(Duty d, File f) {
		// TB_DUTY, TB_DUTY_CHARGE, TB_FILE에 각각 INSERT문 실행
		// 단, TB_DUTY_CHARGE, TB_FILE에는 DUTY_NO가 필요하므로 TB_DUTY를 먼저 변화시켜야 외래키로 쓸 수 있음
		
		// TB_DUTY 		  : Duty d 필요 (1)
		// TB_DUTY_CHARGE : DutyCharge dc 필요 <- 그런데, EMP_NAME을 알기 위해서는 DB에서 조회해야함
		// TB_FILE 		  : File f 필요
		
		int result1 = dDao.insertDuty(sqlSession, d);
		
		int result2 = 1;
		ArrayList<DutyCharge> dclist = new ArrayList<>();
		String[] empICNos = d.getEmpICNo().split(",");
		String[] empICNames = d.getEmpICName().split(",");
		
		for(int i=0; i<empICNos.length; i++) {
			DutyCharge dc = new DutyCharge();
			dc.setEmpICNo(empICNos[i]);
			dc.setEmpICName(empICNames[i]);
			dclist.add(dc);
		}
		for(DutyCharge dc : dclist) {
			result2 *= dDao.insertDutyCharge(sqlSession, dc);
		}
		
		int result3 = dDao.insertFile(sqlSession, f);
		
		return result1 * result2 * result3;
	}
	
	
	@Override
	public int insertDutyWithoutFile(Duty d) {
		int result1 = dDao.insertDuty(sqlSession, d);
		
		int result2 = 1;
		ArrayList<DutyCharge> dclist = new ArrayList<>();
		String[] empICNos = d.getEmpICNo().split(",");
		String[] empICNames = d.getEmpICName().split(",");
		
		for(int i=0; i<empICNos.length; i++) {
			DutyCharge dc = new DutyCharge();
			dc.setEmpICNo(empICNos[i]);
			dc.setEmpICName(empICNames[i]);
			dclist.add(dc);
		}
		
		for(DutyCharge dc : dclist) {
			result2 *= dDao.insertDutyCharge(sqlSession, dc);
		}
		return result1 * result2;
	}
	
	@Override
	public int selectDutyListCount(Duty d) {
		return dDao.selectDutyListCount(sqlSession, d);
	}

	@Override
	public ArrayList<Duty> selectDutyList(PageInfo pi, String empNo) {
		// 업무 리스트도 조회하고
		// 업무별 담당자 리스트도 조회해야 함 (조회 후 같은 업무별 담당자 이름끼리 묶기)
		
		ArrayList<Duty> dlist = dDao.selectDutyList(sqlSession, pi, empNo);
		for(Duty d : dlist) {
			d.setEmpIC( dDao.selectDutyChargeList(sqlSession, pi, d.getDutyNo()) );
		}
		return dlist;
	}
	
	@Override
	public int selectIncompleteListCount(Duty d) {
		return dDao.selectIncompleteListCount(sqlSession, d);
	}

	@Override
	public ArrayList<Duty> selectIncompleteList(Duty d, PageInfo pi){
		ArrayList<Duty> notDoneList = dDao.selectMyList(sqlSession, pi, d);
		for(Duty dt : notDoneList) {
			dt.setEmpIC( dDao.selectDutyChargeList(sqlSession, pi, dt.getDutyNo()) );
		}
		return notDoneList;
	}
	
	@Override
	public ArrayList<Duty> selectMyList(PageInfo pi, Duty d) {
		ArrayList<Duty> mylist = dDao.selectMyList(sqlSession, pi, d);
		for(Duty my : mylist) {
			my.setEmpIC(dDao.selectDutyChargeList(sqlSession, pi, my.getDutyNo()));
		}
		return mylist;
	}
	

	@Override
	public Duty selectDuty(String dutyNo) {
		Duty d = dDao.selectDuty(sqlSession, dutyNo);
		d.setEmpIC( dDao.selectDutyCharge(sqlSession, dutyNo) );
		return d;
	}

	@Override
	public int updateDuty(Duty d) {
		int result1 = dDao.updateDuty(sqlSession, d);
		
		ArrayList<DutyCharge> dclist = new ArrayList<>();
		String[] empICNos = d.getEmpICNo().split(",");
		String[] empICNames = d.getEmpICName().split(",");
		
		for(int i=0; i<empICNos.length; i++) {
			DutyCharge dc = new DutyCharge();
			dc.setDutyNo(Integer.parseInt(d.getDutyNo()));
			dc.setEmpICNo(empICNos[i]);
			dc.setEmpICName(empICNames[i]);
			dclist.add(dc);
		}
		
		int result2 = dDao.deleteDutyCharge(sqlSession, dclist.get(0));
		for(DutyCharge dc : dclist) {
			result2 += dDao.updateDutyCharge(sqlSession, dc);
		}
		System.out.println("result2 : " + result2);
		return result1 * result2;
	}
	
	@Override
	public int updateDutyFile(File f) {
		return dDao.updateDutyFile(sqlSession, f);
	}
	
	@Override
	public int insertDutyFile(File f) {
		return dDao.insertDutyFile(sqlSession, f);
	}


	@Override
	public int deleteDuty(String dutyNo) {
		
		// 해당 업무의 댓글 삭제
		int result1 = dDao.deleteDutyComment(sqlSession, dutyNo);
		
		// 해당 업무에 파일 있으면 status를 NULL으로
		int result2 = dDao.deleteDutyFile(sqlSession, dutyNo);
		
		// 해당 업무 status를 NULL으로
		int result3 = dDao.deleteDuty(sqlSession, dutyNo);
		
		return result1 + result2 + result3; // 성공이라면 최소 1은 되어야 함
	}



}
