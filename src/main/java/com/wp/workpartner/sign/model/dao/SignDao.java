package com.wp.workpartner.sign.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.mail.model.vo.Mail;
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

@Repository
public class SignDao {
//  -------------------기안서 작성 Insert-----------------------------

//  기안서 dpPaper 공통항목
	public int insertDtpaper(SqlSessionTemplate sqlSession, Dtpaper d) {
		return sqlSession.insert("signMapper.insertDtpaper", d);
	}
//	각 기안서 시퀀스 번호 currval 및 결재선리스트 insert
	public int insertVaSign(SqlSessionTemplate sqlSession, ArrayList<Sign> signList) {
		
		int result = 0;
		for(Sign s : signList) {
			System.out.println(s);
			result += sqlSession.insert("signMapper.insertVaSign", s);
		}
		
		return result;
	}
	public int insertOwSign(SqlSessionTemplate sqlSession, ArrayList<Sign> signList) {
		
		int result = 0;
		for(Sign s : signList) {
			result += sqlSession.insert("signMapper.insertOwSign", s);
		}
		
		return result;
	}
	public int insertReSign(SqlSessionTemplate sqlSession, ArrayList<Sign> signList) {
		
		int result = 0;
		for(Sign s : signList) {
			result += sqlSession.insert("signMapper.insertReSign", s);
		}
		
		return result;
	}
	public int insertCoSign(SqlSessionTemplate sqlSession, ArrayList<Sign> signList) {
		
		int result = 0;
		for(Sign s : signList) {
			result += sqlSession.insert("signMapper.insertCoSign", s);
		}
		
		return result;
	}
	
//  기안서 카테고리 별 insert 순서대로 연차 외근 퇴직 업무협조
	public int insertVacation(SqlSessionTemplate sqlSession, Vacation v) {
		return sqlSession.insert("signMapper.insertVacation", v);
	}
	public int insertOtwork(SqlSessionTemplate sqlSession, Otwork o) {
		return sqlSession.insert("signMapper.insertOtwork", o);
	}
	public int insertReSignEmp(SqlSessionTemplate sqlSession, ReSign r) {
		return sqlSession.insert("signMapper.insertReSignEmp", r);
	}
	public int insertCooperation(SqlSessionTemplate sqlSession, Cooperation c) {
		return sqlSession.insert("signMapper.insertCooperation", c);
	}
//	--------------------------임시저장시 공통항목 = dp_final = 임시저장 -----------------------------
	public int saveDtpaper(SqlSessionTemplate sqlSession, Dtpaper d) {
		return sqlSession.insert("signMapper.saveDtpaper", d);
	}
	
	
//	--------------------기안서 상세보기-------------------------
//  상세보기 결재선 리스트
	public ArrayList<Sign> selectSignList(SqlSessionTemplate sqlSession, int dpNo ){
		return (ArrayList)sqlSession.selectList("signMapper.selectSignList", dpNo);
	}
//	상세보기 타이틀 및 첨부파일
	public Dtpaper selectTitleList(SqlSessionTemplate sqlSession, int dpNo) {
		return sqlSession.selectOne("signMapper.selectTitleList", dpNo);
	}
//	기안서 카테고리별 상세보기
	public SelectVacation selectVa(SqlSessionTemplate sqlSession, int dpNo) {
		return sqlSession.selectOne("signMapper.selectVa", dpNo);
	}
	public SelectOtwork selectOw(SqlSessionTemplate sqlSession, int dpNo) {
		return sqlSession.selectOne("signMapper.selectOw", dpNo);
	}
	public SelectReSign selectRe(SqlSessionTemplate sqlSession, int dpNo) {
		return sqlSession.selectOne("signMapper.selectRe", dpNo);
	}
	public SelectCooperation selectCo(SqlSessionTemplate sqlSession, int dpNo) {
		return sqlSession.selectOne("signMapper.selectCo", dpNo);
	}
	
	
//	---------------------기안서 승인 및 반려----------------------------
//	기안서 승인하기 업데이트
	public int updateAgreeSign(SqlSessionTemplate sqlSession, Sign s) {
		return sqlSession.update("signMapper.updateAgreeSign", s);
	}
	public int updateAgreeDtpaper(SqlSessionTemplate sqlSession,  Sign s) {
		return sqlSession.update("signMapper.updateAgreeDtpaper", s);
	}
	public int updateAgreeSiStatus(SqlSessionTemplate sqlSession,Sign s) {
		return sqlSession.update("signMapper.updateAgreeSiStatus", s);
	}
//	기안서 반려하기 업데이트
	public int updateDisagreeSign(SqlSessionTemplate sqlSession,  Sign s) {
		return sqlSession.update("signMapper.updateDisagreeSign", s);
	}
	public int updateDisagreeDtpaper(SqlSessionTemplate sqlSession,Sign s) {
		return sqlSession.update("signMapper.updateDisagreeDtpaper", s);
	}
	
	
//	-----------------------기안서 수정하기 ----------------------------
//	기안서 수정하기 공통 테이블
	public int updateDt(SqlSessionTemplate sqlSession, Dtpaper d) {
		return sqlSession.update("signMapper.updateDt", d);
	}
//	기안서 수정하기 순서대로 연차 - 외근 - 퇴직원 - 업무협조

	public int updateVa(SqlSessionTemplate sqlSession, Vacation v) {
		return sqlSession.update("signMapper.updateVa", v);
	}
	public int updateOw(SqlSessionTemplate sqlSession, Otwork o) {
		return sqlSession.update("signMapper.updateOw", o);
	}
	public int updateRe(SqlSessionTemplate sqlSession, ReSign r) {
		return sqlSession.update("signMapper.updateRe", r);
	}
	public int updateCo(SqlSessionTemplate sqlSession, Cooperation c) {
		return sqlSession.update("signMapper.updateCo", c);
	}
//	기안서 삭제
	public int deleteSign(SqlSessionTemplate sqlSession, Dtpaper d) {
		return sqlSession.delete("signMapper.deleteSign", d);
	}
//  반려됨 결재선 다시 인서트
	public int updateSign(SqlSessionTemplate sqlSession, ArrayList<Sign> signList, Dtpaper d) {
		int result = 0;
		for(Sign s : signList) {
			HashMap<Object, Object> map = new HashMap();
			map.put("s", s);
			map.put("d", d);
			System.out.println(s);
			System.out.println(d);
			System.out.println(map);
			result += sqlSession.insert("signMapper.updateSign", map);
		}
		return result;
	}
	
	
//	------------------------------리스트 조회 목록---------------------------

	//	기안서 임시저장, 반려됨 리스트
	public int selectListCount(SqlSessionTemplate sqlSession, String fn, String empNo) {
		HashMap<String, String> map = new HashMap();
		map.put("empNo", empNo);
		map.put("fn", fn);
		return sqlSession.selectOne("signMapper.selectListCount", map);
	}
	public ArrayList<Dtpaper> selectList(SqlSessionTemplate sqlSession,PageInfo pi,String empNo, String fn){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		HashMap<String, String> map = new HashMap();
		map.put("empNo", empNo);
		map.put("fn", fn);
		return (ArrayList)sqlSession.selectList("signMapper.selectList", map, rowBounds);
	}
	
	//	기안서 결재완료, 진행중, 대기 리스트
	public int selectProgressListCount(SqlSessionTemplate sqlSession, String fn, String empNo) {
		HashMap<String, String> map = new HashMap();
		map.put("empNo", empNo);
		map.put("fn", fn);
		return sqlSession.selectOne("signMapper.selectProgressListCount", map);
	}
	public ArrayList<Dtpaper> selectProgressList(SqlSessionTemplate sqlSession,PageInfo pi,String empNo, String fn){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		HashMap<String, String> map = new HashMap();
		map.put("empNo", empNo);
		map.put("fn", fn);
		return (ArrayList)sqlSession.selectList("signMapper.selectProgressList", map, rowBounds);
	}
	
//	-------------------타부서 리스트 조회------------------------
	//	타부서 결재 할 목록
	public int selectOthSignListCount(SqlSessionTemplate sqlSession, String empNo, String deoCd) {
		return sqlSession.selectOne("signMapper.selectOthSignListCount", empNo);
	}
	public ArrayList<Dtpaper> selectOthSignList(SqlSessionTemplate sqlSession,PageInfo pi, String empNo, String depCd){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		HashMap<String, String> map = new HashMap();
		map.put("empNo", empNo);
		map.put("depCd", depCd);
		return (ArrayList)sqlSession.selectList("signMapper.selectOthSignList", map, rowBounds);
	}
	
	//	타부서 결재완료 목록
	public int selectEndOthSignListCount(SqlSessionTemplate sqlSession, String empNo, String depCd) {
		HashMap<String, String> map = new HashMap();
		map.put("empNo", empNo);
		map.put("depCd", depCd);
		return sqlSession.selectOne("signMapper.selectEndOthSignListCount", map);
	}
	public ArrayList<Dtpaper> selectEndOthSignList(SqlSessionTemplate sqlSession, PageInfo pi, String empNo, String depCd){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		HashMap<String, String> map = new HashMap();
		map.put("empNo", empNo);
		map.put("depCd", depCd);
		
		return (ArrayList)sqlSession.selectList("signMapper.selectEndOthSignList", map, rowBounds);
	}
	
	
//	------------------내부서 리스트 조회--------------------------

	//	내부서 결재 할 목록
	public ArrayList<Dtpaper> selectDeptSignList(SqlSessionTemplate sqlSession,PageInfo pi, String empNo, String depCd) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		HashMap<String, String> map = new HashMap();
		map.put("empNo", empNo);
		map.put("depCd", depCd);
		
		return (ArrayList)sqlSession.selectList("signMapper.selectDeptSignList", map, rowBounds);
	}
	public int selectDeptSignListCount(SqlSessionTemplate sqlSession, String empNo, String depCd) {
		HashMap<String, String> map = new HashMap();
		map.put("empNo", empNo);
		map.put("depCd", depCd);
		return sqlSession.selectOne("signMapper.selectDeptSignListCount", map);
	}
	
	//	내부서 결재완료 목록
	public int selectEndSignListCount(SqlSessionTemplate sqlSession, String empNo,String deoCd) {
		return sqlSession.selectOne("signMapper.selectEndSignListCount", empNo);
	}
	public ArrayList<Dtpaper> selectEndSignList(SqlSessionTemplate sqlSession, PageInfo pi, String empNo, String depCd){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		HashMap<String, String> map = new HashMap();
		map.put("empNo", empNo);
		map.put("depCd", depCd);
		return (ArrayList)sqlSession.selectList("signMapper.selectEndSignList", map, rowBounds);
	}
	
	
	public int deleteDtpaper(SqlSessionTemplate sqlSession, int dpNo) {
		return sqlSession.update("signMapper.deleteDtpaper", dpNo);
	}

	public ArrayList<Dtpaper> ajaxMainSignList(SqlSessionTemplate sqlSession, String empNo){
		return (ArrayList)sqlSession.selectList("signMapper.ajaxMainSignList", empNo);
	}
}
