package com.wp.workpartner.mail.model.service;

import java.util.ArrayList;

import com.wp.workpartner.mail.model.vo.Signature;

public interface MailService {

	
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
	
	// 4. 기본서명 설정 
	
	
	// 기본서명 조회
	Signature selectSigBasic(String empNo);
	
	
	
	
	
	
	
	
	
}
