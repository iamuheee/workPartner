package com.wp.workpartner.sign.model.service;

import java.util.ArrayList;

import com.wp.workpartner.common.model.vo.PageInfo;
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
	int selectOthSignListCount(String empNo);
	ArrayList<Dtpaper> selectOthSignList(PageInfo pi, String empNo);
//  결재 할 리스트
	int selectSignListCount(String empNo);
	ArrayList<Dtpaper> selectSignList(PageInfo pi, String empNo);
//  결재 할 기안서 상세조회
	SelectCooperation selectSignCooperation(int dpNo, String empNo); 
	SelectReSign selectSignResign(int dpNo, String empNo); 
	SelectVacation selectSignVacation(int dpNo, String empNo); 
	SelectOtwork selectSignOtwork(int dpNo, String empNo);
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
	SelectCooperation selectCooperation(int dpNo); 
	SelectReSign selectResign(int dpNo); 
	SelectVacation selectVacation(int dpNo); 
	SelectOtwork selectOtwork(int dpNo); 
//  
}
