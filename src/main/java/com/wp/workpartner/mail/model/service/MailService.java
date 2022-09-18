package com.wp.workpartner.mail.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.common.model.vo.PageInfo;
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
	
	
	// [전체메일함]
	
	// 1_1 전체 조회 listCount
	int selectListTotalCount(HashMap<String, Object> map);

	// 1_2 전체 리스트 조회 
	ArrayList<Mail> selectListTotal(HashMap<String, Object> map, PageInfo pi);
	
	// 1_3 메일함 > 메일삭제 ****
	int deleteEmailGroup(HashMap<String, Object> map);
	// 1_4 메일함 > 읽음
	// 1_5 메일함 > 별표
	// 1_6 메일함 > 별표해제
	
	// [상세조회]
	
	// 1. 메일 읽음으로 바꾸기
	int mailReadUpdate(HashMap<String, Object> map);
	// 2. 상세조회
	Mail selectMailDetail(String no);
	// 3. 파일조회
	ArrayList<File> selectFileDetail(String no);
	
	
	// [받은메일함]
	
	// 1_1 받은 메일 조회 listCount
	int selectListReceiveCount(HashMap<String, Object> map);

	// 1_2 전체 리스트 조회 
	ArrayList<Mail> selectListReceive(HashMap<String, Object> map, PageInfo pi);
	
	
	// [보낸메일함]
	// 1_1 받은 메일 조회 listCount
	int selectListSendCount(HashMap<String, Object> map);

	// 1_2 전체 리스트 조회 
	ArrayList<Mail> selectListSend(HashMap<String, Object> map, PageInfo pi);
	
	// [휴지통]
	// 1_1 휴지통 조회 listCount
	int selectListBinCount(HashMap<String, Object> map);

	// 1_2 휴지통 리스트 조회 
	ArrayList<Mail> selectListBin(HashMap<String, Object> map, PageInfo pi);
	
	// 1_3 완전삭제
	
	// 1_4 복구
	
	// [중요메일함]
	// 1_1 중요메일함 조회 listCount
	int selectListStarCount(HashMap<String, Object> map);

	// 1_2 중요메일함 리스트 조회 
	ArrayList<Mail> selectListStar(HashMap<String, Object> map, PageInfo pi);

	
	
	
	
	// 기본서명 조회
	Signature selectSigBasic(String empNo);
	
	
	
	
	// 메일 완전 삭제 => 지정된 파일도 완전 삭제
	
	
	
	
	
	
	
	
	
}
