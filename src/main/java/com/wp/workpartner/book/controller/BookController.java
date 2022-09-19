package com.wp.workpartner.book.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.wp.workpartner.book.model.Service.BookService;
import com.wp.workpartner.book.model.vo.Book;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.common.template.Pagination;

@Controller
public class BookController {

	@Autowired
	BookService bService;
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 19.
	 * @method	: 회의실 예약 페이지 이동 요청 처리
	 * @return	: book/bookEnrollForm
	 */
	@RequestMapping("enrollForm.bk")
	public String enrollForm() { 
		return "book/bookEnrollForm";
	}
	
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
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 19.
	 * @method	: 회의실 예약 요청 처리
	 * @param	: Book b
	 * @return	: 성공 시 내 예약 현황 페이지 재요청 | 실패 시 error.jsp
	 */
	@RequestMapping("insert.bk")
	public String insertBook(Book b, HttpSession session, Model model) {
//		System.out.println(b);
		int result = bService.insertBook(b);
//		System.out.println(result);
	
		if(result > 0) {
			session.setAttribute("alertMsg", "회의실 예약이 완료되었습니다.");
			return "redirect:list.bk";
		}else {
			model.addAttribute("errorMsg", "회의실 예약 실패");
			return "common/error";
		}
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 19.
	 * @method	: (ajax) 내 회의실 예약 현황 조회 요청 처리
	 * @param	: cpage, empNo
	 * @return	: pi(페이징 처리), list(내 예약 현황 ArrayList)
	 */
	@ResponseBody
	@RequestMapping(value="selectList.bk", produces="application/json; charset=UTF-8")
	public String ajaxSelectBookList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String empNo) {
		
//		System.out.println("empNo: " + empNo);
		// 페이징 처리도 같이 해야 함
		
		int listCount = bService.selectListCount(empNo);
//		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount,  currentPage, 5, 10);
		ArrayList<Book> list = bService.selectBookList(empNo, pi);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("pi", pi);
		map.put("list", list);
		
		return new Gson().toJson(map);
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 19.
	 * @method	: (ajax) 회의실 예약 상세 내역 조회 요청
	 * @param	: bkNo - 회의실 예약 번호
	 * @return	: Book b - 회의실 예약 정보
	 */
	@ResponseBody
	@RequestMapping(value="select.bk", produces="application/json; charset=UTF-8")
	public String ajaxSelectBook(String bkNo) {
//		System.out.println(bkNo);
		
		Book b = bService.selectBook(bkNo);
		
		return new Gson().toJson(b);
	}
	
}
