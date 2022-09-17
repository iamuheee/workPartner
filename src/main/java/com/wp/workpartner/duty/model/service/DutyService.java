package com.wp.workpartner.duty.model.service;

import java.util.ArrayList;

import com.wp.workpartner.common.model.vo.Comment;
import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.duty.model.vo.Duty;
import com.wp.workpartner.duty.model.vo.DutyCharge;

public interface DutyService {
	
	// 업무 게시글 작성 : 파일 有
	int insertDutyWithFile(Duty d, File f);
	
	// 업무 게시글 작성 : 파일 無
	int insertDutyWithoutFile(Duty d);
	
	
	// 업무 게시글 리스트 조회 (+페이징)
	int selectDutyListCount(Duty d); // 여러가지 필터에 대한 리스트 개수도 이 메소드를 통해 할 것임
	ArrayList<Duty> selectDutyList(PageInfo pi, String empNo);
	
	// 완료 업무 제외 게시글 개수 
	public int selectIncompleteListCount(Duty d);
	
	// 완료 업무 제외 게시글 리스트 조회
	public ArrayList<Duty> selectIncompleteList(Duty d, PageInfo pi);
	
	// 테이블 상단에 있는 필터 기능을 위한 리스트 조회
	public ArrayList<Duty> selectMyList(PageInfo pi, Duty d);
	
	// 업무 게시글 상세 조회
	Duty selectDuty(String dutyNo);
	
	// 업무 게시글 수정
	int updateDuty(Duty d);
	
	// 업무 게시글 삭제
	int deleteDuty(String dutyNo);
	
	// 업무 게시글 댓글 작성 (ajax)
	int insertDutyComment(Comment c);
	
	// 업무 게시글 댓글 수정 (ajax)
	int updateDutyComment(Comment c);
	
	// 업무 게시글 댓글 삭제 (ajax)
	int deleteDutyComment(int comNo);
	

}
