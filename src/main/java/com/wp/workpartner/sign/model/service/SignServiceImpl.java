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
		return 0;
	}
	@Override
	public ArrayList<Dtpaper> selectOthSignList(PageInfo pi, String empNo) {
		return null;
	}
//	내부서 결재함
	@Override
	public int selectSignListCount(String empNo) {
		return 0;
	}
	@Override
	public ArrayList<Dtpaper> selectSignList(PageInfo pi, String empNo) {
		return null;
	}

	@Override
	public SelectCooperation selectSignCooperation(int dpNo, String empNo) {
		return null;
	}

	@Override
	public SelectReSign selectSignResign(int dpNo, String empNo) {
		return null;
	}

	@Override
	public SelectVacation selectSignVacation(int dpNo, String empNo) {
		return null;
	}

	@Override
	public SelectOtwork selectSignOtwork(int dpNo, String empNo) {
		return null;
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
	public SelectCooperation selectCooperation(int dpNo) {
		return null;
	}

	@Override
	public SelectReSign selectResign(int dpNo) {
		return null;
	}

	@Override
	public SelectVacation selectVacation(int dpNo) {
		return null;
	}

	@Override
	public SelectOtwork selectOtwork(int dpNo) {
		return null;
	}

	
	
	

	

	
	
	

}
