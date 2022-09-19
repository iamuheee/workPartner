package com.wp.workpartner.book.model.Service;

import java.util.ArrayList;

import com.wp.workpartner.book.model.vo.Book;

public interface BookService {

	// 회의실 예약 서비스 (insert)
	int insertBook(Book b);
	
	// 회의실 예약 목록 조회 서비스 (select)
	// 날짜별 조회
	ArrayList selectBookByDate(String meetDate);
	
	// 회의실별 조회
	ArrayList selectBookByRoom(String bkNo);
	
	// 회의실 예약 수정 서비스 (update)
	int updateBook(Book b);
	
	// 회의실 예약 취소 서비스 (update)
	int deleteBook(Book b);
	
}
