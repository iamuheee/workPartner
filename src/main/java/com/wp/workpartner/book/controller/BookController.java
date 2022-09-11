package com.wp.workpartner.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookController {

	// jsp 연결 위해 임시로 작성
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 내 회의실 예약 현황 조회 요청 처리 메소드
	 * @return	: String
	 */
	@RequestMapping("list.bk")
	public String selectBookList() {
		return "book/bookListView";
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 회의실 예약 이력 조회 요청 처리 메소드
	 * @return	: String
	 */
	@RequestMapping("historyList.bk")
	public String selectBookHistoryList() {
		return "book/bookHistoryListView";
	}
	
}
