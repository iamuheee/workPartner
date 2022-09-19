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
	
	// 회의실 예약 수정 서비스 (update)
	int updateBook(Book b);
	
	// 회의실 예약 취소 서비스 (update)
	int deleteBook(String bkNo);
	
}
