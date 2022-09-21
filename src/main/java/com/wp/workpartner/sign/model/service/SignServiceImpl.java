package com.wp.workpartner.sign.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.common.model.vo.PageInfo;
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
	public int selectOthSignListCount(String empNo) {
		return sDao.selectOthSignListCount(sqlSession, empNo);
	}
	@Override
	public ArrayList<Dtpaper> selectOthSignList(PageInfo pi, String empNo) {
		return sDao.selectOthSignList(sqlSession,pi, empNo);
	}
//	타부서 결재완료
	@Override
	public int selectEndOthSignListCount(String empNo) {
		return sDao.selectEndOthSignListCount(sqlSession, empNo);
	}
	@Override
	public ArrayList<Dtpaper> selectEndOthSignList(PageInfo pi, String empNo) {
		return sDao.selectEndOthSignList(sqlSession, pi, empNo);
	}
	
//	내부서 결재함
	@Override
	public int selectDeptSignListCount(String empNo) {
		return sDao.selectDeptSignListCount(sqlSession, empNo);
	}
	@Override
	public ArrayList<Dtpaper> selectDeptSignList(PageInfo pi, String empNo) {
		return sDao.selectDeptSignList(sqlSession, pi, empNo);
	}
	
//	내부서 결재완료
	@Override
	public int selectEndSignListCount(String empNo) {
		return sDao.selectEndSignListCount(sqlSession, empNo);
	}
	@Override
	public ArrayList<Dtpaper> selectEndSignList(PageInfo pi, String empNo) {
		return sDao.selectEndSignList(sqlSession, pi, empNo);
	}
	
	@Override
	public SelectVacation selectVa(int dpNo) {
		return sDao.selectVa(sqlSession, dpNo);
	}
	@Override
	public SelectOtwork selectOw(int dpNo) {
		return sDao.selectOw(sqlSession, dpNo);
	}
	@Override
	public SelectReSign selectRe(int dpNo) {
		return sDao.selectRe(sqlSession, dpNo);
	}
	@Override
	public SelectCooperation selectCo(int dpNo) {
		return sDao.selectCo(sqlSession, dpNo);
	}




	@Override
	public int updateCooperation(Dtpaper d, Cooperation c) {
		return 0;
	}

	@Override
	public int updateVacation(Dtpaper d, Vacation v) {
		return 0;
	}

	@Override
	public int updateOtwork(Dtpaper d, Otwork o) {
		return 0;
	}

	@Override
	public int updateReSignEmp(Dtpaper d, ReSign r) {
		return 0;
	}

	@Override
	public int deleteCooperation(int dpNo) {
		return 0;
	}

	@Override
	public int deleteVacation(int dpNo) {
		return 0;
	}

	@Override
	public int deleteOtwork(int dpNo) {
		return 0;
	}

	@Override
	public int deleteReSignEmp(int dpNo) {
		return 0;
	}

	@Override
	public SelectCooperation selectSignCooperation(int dpNo) {
		return null;
	}

	@Override
	public SelectReSign selectSignResign(int dpNo) {
		return null;
	}

	@Override
	public SelectVacation selectSignVacation(int dpNo) {
		return null;
	}

	@Override
	public SelectOtwork selectSignOtwork(int dpNo) {
		return null;
	}
	@Override
	public ArrayList<Sign> selectSignList(int dpNo) {
		return sDao.selectSignList(sqlSession, dpNo);
	}
	


	
	
	

	

	
	
	

}
