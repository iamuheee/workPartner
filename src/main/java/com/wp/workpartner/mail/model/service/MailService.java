package com.wp.workpartner.mail.model.service;

import java.util.ArrayList;

import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.mail.model.vo.Mail;
import com.wp.workpartner.mail.model.vo.Signature;

public interface MailService {

	// [ 메일 서명 ]
	// 1. 메일 서명 조회 => 뿌릴때 서명1 서명2 이거 rowNum	
	ArrayList<Signature> selectSigList(String empNo);
	
	// 2-1. 메일 서명 삭제
	int deleteSig(String sigNo);
	 
	// 2-2. 기본설정된 서명있는지 조회
	int selectBasicCount(String empNo);
	
	// 2-3. 없을 경우 row1인 sigNo를 기본으로 바꿔주기
	int updateBasic(String empNo); 
		
	// 3. 메일 서명등록
	int insertSig(Signature s);	
	
	// 4-1 기본서명 설정 : 직원테이블 > sigUse
	int updateSigUseManage(Employee e);
	
	// 4-2 모두 우선 basic n
	int updateSigBasicNo(Signature s);
	
	// 4-3 기본서명 설정 : 서명테이블 > sigBaic
	int updateSigBasicManage(Signature s);
	
	// [메일쓰기]
	
	// 1. tb_mail insert
	int insertMail(Mail mail);
	
	// 2. tb_mail_status insert
	// 2-1 받는입장
	int insertMailStatusRev(String[] mailRecipients);
	// 2-2 참조된입장
	int insertMailStatusCC(String[] mailCCs);
	// 2-3 보낸입장
	int insertMailStatusSen();
	
	// 3. 파일 등록 
	int insertMailFile(File file);
	
	// 기본서명 조회
	Signature selectSigBasic(String empNo);
	
	
	// 메일 완전 삭제 => 지정된 파일도 완전 삭제
	
	
	
	
	
	
	
	
	
}
