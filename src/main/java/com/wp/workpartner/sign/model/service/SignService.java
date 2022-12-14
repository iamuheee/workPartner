package com.wp.workpartner.sign.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.employee.model.vo.Employee;
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

public interface SignService {
//	기안서 작성 결재선 insert 
	int insertVaSign(ArrayList<Sign> signList);
	int insertOwSign(ArrayList<Sign> signList);
	int insertReSign(ArrayList<Sign> signList);
	int insertCoSign(ArrayList<Sign> signList);
	
	int updateSign(ArrayList<Sign> signList, Dtpaper d);
//	기안서 공통 insert 및 임시저장 insert
	int insertDtpaper(Dtpaper d);
	int saveDtpaper(Dtpaper d);
//	기안서 항목별 insert
	int insertVacation(Vacation v);
	int insertOtwork(Otwork o);
	int insertReSignEmp(ReSign r);
	int insertCooperation(Cooperation c);
	
//  기안서 수정하기
	int updateCo(Cooperation c);
	int updateVa(Vacation v);
	int updateOw(Otwork o);
	int updateRe(ReSign r);
//  기안서 수정하기 dtpaper
	int updateDt(Dtpaper d);
//	기안서 삭제하기
	int deleteSign(Dtpaper d);
	int deleteDt(int dpNo);
	
//  기안서 상세조회
	SelectCooperation selectCo(int dpNo); 
	SelectReSign selectRe(int dpNo); 
	SelectVacation selectVa(int dpNo); 
	SelectOtwork selectOw(int dpNo); 
//  기안서 상세보기 결재선
	ArrayList<Sign> selectSignList(int dpNo);
//	기안서 상세보기 타이틀
	Dtpaper selectTitleList(int dpNo);
	
	int deleteDtpaper(int dpNo);
	
	
//	임시저장 반려됨 임시저장 리스트
	int selectListCount(String fn, String empNo);
	ArrayList<Dtpaper> selectList(PageInfo pi, String empNo, String fn);
//	진행중 결재완료 진행중 대기 리스트
	int selectProgressListCount(String fn, String empNo);
	ArrayList<Dtpaper> selectProgressList(PageInfo pi, String empNo, String fn);
//	타부터 결재리스트
	int selectOthSignListCount(String empNo,String depCd);
	ArrayList<Dtpaper> selectOthSignList(PageInfo pi, String empNo, String depCd);
//	타부서 결재완료
	int selectEndOthSignListCount(String empNo, String depCd);
	ArrayList<Dtpaper> selectEndOthSignList(PageInfo pi, String empNo, String depCd);
//  결재 리스트
	int selectDeptSignListCount(String empNo, String depCd);
	ArrayList<Dtpaper> selectDeptSignList(PageInfo pi, String empNo, String depCd);
//	내부서 결재완료
	int selectEndSignListCount(String empNo, String depCd);
	ArrayList<Dtpaper> selectEndSignList(PageInfo pi, String empNo, String depCd);

//	기안서 승인하기 결재선 상태 업데이트
	int updateAgreeSign(Sign s);
//  기안서 승인하기 기안서 상태 업데이트
	int updateAgreeDtpaper(Sign s);
	int updateAgreeSiStatus(Sign s);
//	기안서 결재반려 상태 업데이트 
	int updateDisagreeSign(Sign s);
	int updateDisagreeDtpaper(Sign s);
	ArrayList<Dtpaper> ajaxMainSignList(String empNo);
}
