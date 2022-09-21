package com.wp.workpartner.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.notice.model.vo.Notice;

public interface NoticeService {
	
	// [공지사항 관리자 설정]
	// 1. 관리자 조회
	ArrayList<Employee> selectNtAdminY();
	
	// 2. 관리자변경 Y => N
	int upDateAdminN(String empNo);
	
	// 3. 관리자변경 Y
	int updateAdminY(HashMap<String, Object> map);
	
	
	// [공지사항 전체 리스트]
	// 공지사항 상단 조회
	// 1. listCount
	int selectTopNoticeCount(HashMap<String,Object> map);
	
	// 2. list
	ArrayList<Notice> selectTopNotice(HashMap<String, Object> map, PageInfo pi);
	
	// 공지사항 일반조회
	// 1. listCount
	int selectNormalNoticeCount(HashMap<String,Object> map);
	
	// 2. list
	ArrayList<Notice> selectNormalNotice(HashMap<String, Object> map, PageInfo pi);
	
	
	// [공지사항 작성하기]
	// 1. 써머노트 이미지 업로드
	int insertSummernote(File file);
	
	// 2. notice insert
	int insertNotice(Notice notice);
	
	// 3. file insert
	int insertFileNotice(File file);
	
	
	// [공지사항 상세조회]
	// 1. count + 1
	int increaseCount(String noticeNo);
	
	// 2. notice정보받기
	Notice selectDetailNotice(String noticeNo);
	
	// 3. file 받기
	ArrayList<File> selectFileDetail(String noticeNo);
	
	// [공지사항 삭제]
	int deleteNotice(String noticeNo);
	
	// [공지사항 수정하기]
	// 1. notice update
	int updateNotice(Notice notice);
	
	// 2. 기존의 파일 삭제
	int updateFileN(String noticeNo);
	
	// 3. 넘어온 기존 파일은 Y
	int updateFileY(File file);
	
	
	// 4. file insert
	int updateFileNotice(File file);
	
}
