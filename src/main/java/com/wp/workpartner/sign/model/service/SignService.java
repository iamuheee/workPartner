package com.wp.workpartner.sign.model.service;

import java.util.ArrayList;

import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.employee.model.vo.Employee;
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
//	기안서 작성
	int insertVaSign(ArrayList<Sign> signList);
	int insertOwSign(ArrayList<Sign> signList);
	int insertReSign(ArrayList<Sign> signList);
	int insertCoSign(ArrayList<Sign> signList);
	
	int insertDtpaper(Dtpaper d);
	int saveDtpaper(Dtpaper d);
	
	int insertVacation(Vacation v);
	int insertOtwork(Otwork o);
	int insertReSignEmp(ReSign r);
	int insertCooperation(Cooperation c);
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
//  결재 할 기안서 상세조회
	SelectCooperation selectSignCooperation(int dpNo); 
	SelectReSign selectSignResign(int dpNo); 
	SelectVacation selectSignVacation(int dpNo); 
	SelectOtwork selectSignOtwork(int dpNo);
//  기안서 수정하기
	int updateCooperation(Dtpaper d, Cooperation c);
	int updateVacation(Dtpaper d, Vacation v);
	int updateOtwork(Dtpaper d, Otwork o);
	int updateReSignEmp(Dtpaper d, ReSign r);
//	기안서 삭제하기
	int deleteCooperation(int dpNo);
	int deleteVacation(int dpNo);
	int deleteOtwork(int dpNo);
	int deleteReSignEmp(int dpNo);
//  기안서 상세조회
	SelectCooperation selectCo(int no); 
	SelectReSign selectRe(int no); 
	SelectVacation selectVa(int no); 
	SelectOtwork selectOw(int no); 
//  기안서 상세보기 결재선
	ArrayList<Sign> selectSignList(int no);
//	기안서 상세보기 타이틀
	Dtpaper selectTitleList(int no);
//	기안서 승인하기 결재선 상태 업데이트
	int updateAgreeSign(Sign s);
//  기안서 승인하기 기안서 상태 업데이트
	int updateAgreeDtpaper(Sign s);
	int updateAgreeSiStatus(Sign s);
//	기안서 결재반려 상태 업데이트 
	int updateDisagreeSign(Sign s);
	int updateDisagreeDtpaper(Sign s);
}
