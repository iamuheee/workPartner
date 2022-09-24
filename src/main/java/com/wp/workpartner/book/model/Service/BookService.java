package com.wp.workpartner.book.model.Service;

import java.util.ArrayList;

import com.wp.workpartner.book.model.vo.Book;
import com.wp.workpartner.common.model.vo.PageInfo;

public interface BookService {

	// 회의실 예약 서비스 (insert)
	int insertBook(Book b);
	
	// 내 예약 현황 조회 서비스 (select)
	int selectListCount(String empNo);
	ArrayList selectBookList(String empNo, PageInfo pi);	
	
	// 내 예약 상세 조회 서비스 (select)
	Book selectBook(String bkNo);
	
	// 회의실 예약 목록 조회 서비스 (select)
	// 날짜별 조회
	ArrayList selectBookByDate(String meetDate);
	// 회의실별 조회
	ArrayList selectBookByRoom(String bkNo);

	// 전체 조회
	ArrayList selectAllBookList();
	ArrayList selectRoomList();
	
	// 회의실 예약 수정 서비스 (update)
	int updateBook(Book b);
	
	// 회의실 예약 취소 서비스 (update)
	int deleteBook(String bkNo);
	
	// 전체 예약 목록 조회 서비스 (select)
	int selectAllListCount();
	ArrayList selectAllList(PageInfo pi);
	
//	// 회의실별, 기간별 예약 목록 조회 서비스 (select)
//	int selectAllListCountByCondition(String rmNo, String stardDate, String endDate);
//	ArrayList selectAllListByCondition(String rmNo, String startDate, String endDate, PageInfo pi);
	
	// 회의실별 예약 목록 조회 서비스
	int selectByRoomListCount(String rmNo);
	ArrayList selectByRoomList(String rmNo, PageInfo pi);
	
	// 기간별 예약 목록 조회 서비스
	int selectByDateListCount(String start, String end);
	ArrayList selectByDateList(String start, String end, PageInfo pi);
	
	// 회의실별 + 기간별 예약 목록 조회 서비스
	int selectByRoomAndDateListCount(String rmNo, String start, String end);
	ArrayList selectByRoomAndDateList(String rmNo, String start, String end, PageInfo pi);
	
	// 예약 날짜+시간 조회 서비스
	ArrayList selectTime(String rmNo, String bkDate);
}
