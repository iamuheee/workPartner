package com.wp.workpartner.sign.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.sign.model.dao.SignDao;
import com.wp.workpartner.sign.model.vo.Cooperation;
import com.wp.workpartner.sign.model.vo.Dtpaper;
import com.wp.workpartner.sign.model.vo.Otwork;
import com.wp.workpartner.sign.model.vo.ReSign;
import com.wp.workpartner.sign.model.vo.SelectCooperation;
import com.wp.workpartner.sign.model.vo.SelectOtwork;
import com.wp.workpartner.sign.model.vo.SelectReSign;
import com.wp.workpartner.sign.model.vo.SelectVacation;
import com.wp.workpartner.sign.model.vo.Sign;
import com.wp.workpartner.sign.model.vo.Vacation;

@Service
public class SignServiceImpl implements SignService {

	@Autowired
	private SignDao sDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

//	결재선
	@Override
	public int insertVaSign(ArrayList<Sign> signList) {
		return sDao.insertVaSign(sqlSession, signList);
	}
	@Override
	public int insertOwSign(ArrayList<Sign> signList) {
		return sDao.insertOwSign(sqlSession, signList);
	}
	@Override
	public int insertReSign(ArrayList<Sign> signList) {
		return sDao.insertReSign(sqlSession, signList);
	}
	@Override
	public int insertCoSign(ArrayList<Sign> signList) {
		return sDao.insertCoSign(sqlSession, signList);
	}

//  기안서 푸터
	@Override
	public int insertVacation(Vacation v) {
		return sDao.insertVacation(sqlSession, v);
	}
	
	@Override
	public int insertOtwork(Otwork o) {
		return sDao.insertOtwork(sqlSession, o);
	}
	
	@Override
	public int insertReSignEmp(ReSign r) {
		return sDao.insertReSignEmp(sqlSession, r);
	}
	@Override
	public int insertCooperation(Cooperation c) {
		return sDao.insertCooperation(sqlSession, c);
	}
	
//  기안서 통합 서식
	@Override
	public int insertDtpaper(Dtpaper d) {
		return sDao.insertDtpaper(sqlSession, d);
	}
	@Override
	public int saveDtpaper(Dtpaper d) {
		return sDao.saveDtpaper(sqlSession, d);
	}
//  임시저장, 반려됨 리스트조회
	@Override
	public int selectListCount(String fn, String empNo) {
		return sDao.selectListCount(sqlSession, fn, empNo);
	}
	@Override
	public ArrayList<Dtpaper> selectList(PageInfo pi, String empNo, String fn) {
		return sDao.selectList(sqlSession, pi, empNo, fn);
	}
	
	
//  진행중, 대기 리스트
	@Override
	public int selectProgressListCount(String fn, String empNo) {
		return sDao.selectProgressListCount(sqlSession, fn, empNo);
	}
	@Override
	public ArrayList<Dtpaper> selectProgressList(PageInfo pi, String empNo, String fn) {
		return sDao.selectProgressList(sqlSession, pi, empNo, fn);
	}
//	타부서 결재함
	@Override
	public int selectOthSignListCount(String empNo, String depCd) {
		return sDao.selectOthSignListCount(sqlSession, empNo ,depCd);
	}
	@Override
	public ArrayList<Dtpaper> selectOthSignList(PageInfo pi, String empNo, String depCd) {
		return sDao.selectOthSignList(sqlSession,pi, empNo, depCd);
	}
//	타부서 결재완료
	@Override
	public int selectEndOthSignListCount(String empNo, String depCd) {
		return sDao.selectEndOthSignListCount(sqlSession, empNo, depCd);
	}
	@Override
	public ArrayList<Dtpaper> selectEndOthSignList(PageInfo pi, String empNo, String depCd) {
		return sDao.selectEndOthSignList(sqlSession, pi, empNo, depCd);
	}
	
//	내부서 결재함
	@Override
	public int selectDeptSignListCount(String empNo, String depCd) {
		return sDao.selectDeptSignListCount(sqlSession, empNo, depCd);
	}
	@Override
	public ArrayList<Dtpaper> selectDeptSignList(PageInfo pi, String empNo, String depCd) {
		return sDao.selectDeptSignList(sqlSession, pi, empNo, depCd);
	}
	
//	내부서 결재완료
	@Override
	public int selectEndSignListCount(String empNo, String depCd) {
		return sDao.selectEndSignListCount(sqlSession, empNo, depCd);
	}
	@Override
	public ArrayList<Dtpaper> selectEndSignList(PageInfo pi, String empNo, String depCd) {
		return sDao.selectEndSignList(sqlSession, pi, empNo, depCd);
	}
	
	@Override
	public SelectVacation selectVa(int no) {
		return sDao.selectVa(sqlSession, no);
	}
	@Override
	public SelectOtwork selectOw(int no) {
		return sDao.selectOw(sqlSession, no);
	}
	@Override
	public SelectReSign selectRe(int no) {
		return sDao.selectRe(sqlSession, no);
	}
	@Override
	public SelectCooperation selectCo(int no) {
		return sDao.selectCo(sqlSession, no);
	}




//  기안서 수정하기 순서대로 // 공통 - 연차 - 외근 - 퇴직원 - 업무협조
	@Override
	public int updateDt(Dtpaper d) {
		return sDao.updateDt(sqlSession, d);
	}
	@Override
	public int updateVa(Vacation v) {
		return sDao.updateVa(sqlSession, v);
	}

	@Override
	public int updateOw(Otwork o) {
		return sDao.updateOw(sqlSession, o);
	}

	@Override
	public int updateRe(ReSign r) {
		return sDao.updateRe(sqlSession, r);
	}

	@Override
	public int updateCo(Cooperation c) {
		return sDao.updateCo(sqlSession, c);
	}
	
//	기안서 상세보기 결재선
	@Override
	public ArrayList<Sign> selectSignList(int dpNo) {
		return sDao.selectSignList(sqlSession, dpNo);
	}
//	기안서 상세보기 타이틀
	@Override
	public Dtpaper selectTitleList(int dpNo) {
		return sDao.selectTitleList(sqlSession, dpNo);
	}
	
	
	@Override
	public int updateAgreeSign(Sign s) {
		return sDao.updateAgreeSign(sqlSession, s);
	}
	@Override
	public int updateAgreeDtpaper(Sign s) {
		return sDao.updateAgreeDtpaper(sqlSession, s);
	}
	@Override
	public int updateAgreeSiStatus(Sign s) {
		return sDao.updateAgreeSiStatus(sqlSession, s);
	}
	@Override
	public int updateDisagreeSign(Sign s) {
		return sDao.updateDisagreeSign(sqlSession, s);
	}
	@Override
	public int updateDisagreeDtpaper(Sign s) {
		return sDao.updateDisagreeDtpaper(sqlSession, s);
	}
	
	@Override
	public int deleteDt(int dpNo) {
		return 0;
	}
	@Override
	public int deleteSign(Dtpaper d) {
		return sDao.deleteSign(sqlSession, d);
	}
	@Override
	public int updateSign(ArrayList<Sign> signList, Dtpaper d) {
		return sDao.updateSign(sqlSession, signList, d);
	}
	@Override
	public int deleteDtpaper(int dpNo) {
		return sDao.deleteDtpaper(sqlSession, dpNo);
	}
	@Override
	public ArrayList<Dtpaper> ajaxMainSignList(String empNo) {
		return sDao.ajaxMainSignList(sqlSession, empNo);
	}
	
	
	


	
	
	

	

	
	
	

}
