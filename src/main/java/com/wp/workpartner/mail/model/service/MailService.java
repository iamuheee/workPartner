package com.wp.workpartner.mail.model.service;

import java.util.ArrayList;

import com.wp.workpartner.mail.model.vo.Signature;

public interface MailService {

	
	// 1. 메일 서명 조회 => 뿌릴때 서명1 서명2 이거 rowNum
	
	ArrayList<Signature> selectSigList(String empNo);
	
	// 2. 메일 서명 삭제	
	// 3-1. 메일 서명 등록 시 필요한 정보 가져오기
	// 3-2 메일 서명등록 
	// 4. 기본서명 설정 
	
	
	
	
	
	
	
	
	
	
	
	
}
