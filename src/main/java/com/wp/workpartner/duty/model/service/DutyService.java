package com.wp.workpartner.duty.model.service;

import java.util.ArrayList;

import com.wp.workpartner.common.model.vo.Comment;
import com.wp.workpartner.duty.model.vo.Duty;

public interface DutyService {
	// ** 고민 **
	// 개인 업무와 프로젝트 업무 Controller, Service, Dao를 퉁쳐서 쓸 수는 없을까?
	
	// 업무 게시글 작성
	int insertDuty(Duty d);
	
	// 업무 게시글 리스트 조회 (+페이징)
	ArrayList<Duty> selectDutyList();
	int selectDutyListCount();
	
	// 업무 게시글 상세 조회
	Duty selectDuty(int dutyNo);
	
	// 업무 게시글 수정
	int updateDuty(Duty d);
	
	// 업무 게시글 삭제
	int deleteDuty(int dutyNo);
	
	// 업무 게시글 댓글 작성 (ajax)
	int insertDutyComment(Comment c);
	
	// 업무 게시글 댓글 수정 (ajax)
	int updateDutyComment(Comment c);
	
	// 업무 게시글 댓글 삭제 (ajax)
	int deleteDutyComment(int comNo);
	

}
