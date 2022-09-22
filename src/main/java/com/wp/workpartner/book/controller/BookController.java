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
import com.wp.workpartner.room.model.vo.Room;

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
			return "redirect:enrollForm.bk";
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
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 20.
	 * @method	: 회의실 예약 수정 요청
	 * @param	: Book b
	 * @return	: redirect:list.bk
	 */
	@RequestMapping("update.bk")
	public String updateBook(Book b, HttpSession session, Model model) {
		//System.out.println("updateBk 넘어온 값 : " + b); // 잘 넘어옴
		// bkPerson, bkDate, bkStart, bkEnd, bkModify(내가 직접 넣어줘야 함)
		
		int result = bService.updateBook(b);
//		System.out.println(result);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "회의실 예약 일정 변경에 성공했습니다.");
			return "redirect:list.bk";
		}else {
			model.addAttribute("errorMsg", "회의실 예약 변경 실패");
			return "common/error";
		}
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 20.
	 * @method	: (ajax) 회의실 예약 취소 요청 
	 * @param	: bkNo
	 * @return	: String result
	 */
	@ResponseBody
	@RequestMapping("delete.bk")
	public String ajaxDeleteBook(String bkNo) {
//		System.out.println("bkNo : " + bkNo);
		int result = bService.deleteBook(bkNo);
//		System.out.println(result);
		
		return (result > 0) ? "success" : "fail";
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 22.
	 * @method	: (ajax) 풀캘린더 스케쥴에 띄울 회의실 목록 및 회의실별 예약 목록 조회 요청 처리
	 * @return	: room, book
	 */
	@ResponseBody
	@RequestMapping(value="calendar.bk", produces="application/json; charset=UTF-8")
	public String ajaxGetBookCal() {
		// event용 data에 담을 예약 내역과 resource용 data에 담을 회의실 목록을 함께 가져가야 함
		// event == 캘린더에 띄울 하나하나의 이벤트 객체
		// resource == 각각의 회의실 정보를 담은 객체
		ArrayList<Book> book = bService.selectAllBookList();
		ArrayList<Room> room = bService.selectRoomList();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("book", book);
		map.put("room", room);
		
		return new Gson().toJson(map);
	}
	
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 22.
	 * @method	: (ajax) 관리자용 회의실 예약 이력 조회 요청 처리
	 * @return	: list, pi
	 */
	@ResponseBody
	@RequestMapping(value="selectAll.bk", produces="application/json; charset=UTF-8")
	public String ajaxSelectAll(@RequestParam(value="cpage", defaultValue="1") int currentPage) {
		int listCount = bService.selectAllListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Book> list = bService.selectAllList(pi);
		
//		System.out.println(pi);
//		System.out.println(list);
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("pi", pi);
		result.put("list", list);
		
		return new Gson().toJson(result);
	}

	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 22.
	 * @method	: (ajax) 회의실별 예약 목록 조회 요청 처리 
	 * @param	: cpage, rmNo
	 * @return	: list, pi
	 */
	@ResponseBody
	@RequestMapping(value="selectByRoom.bk", produces="application/json; charset=UTF-8")
	public String ajaxSelectByRoom(@RequestParam(value="cpage", defaultValue="1") int currentPage, String rmNo) {
//		System.out.println("rmNo : " + rmNo);
//		System.out.println("cpage : " + currentPage);
		
		int listCount = bService.selectByRoomListCount(rmNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList list = bService.selectByRoomList(rmNo, pi);
		
//		System.out.println(pi);
//		System.out.println(list);
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("pi", pi);
		result.put("list", list);
		
		return new Gson().toJson(result);
	}
	
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 22.
	 * @method	: (ajax) 기간별 회의실 예약 목록 요청 처리
	 * @param	: cpage, start(시작 날짜), end(종료 날짜)
	 * @return	: list, pi
	 */
	@ResponseBody
	@RequestMapping(value="selectByDate.bk", produces="application/json; charset=UTF-8")
	public String ajaxSelectByDate(@RequestParam(value="cpage", defaultValue="1") int currentPage, String start, String end) {
//		System.out.println("start : " + start);
//		System.out.println("end : " + end);
//		System.out.println("cpage : " + currentPage);
		
		int listCount = bService.selectByDateListCount(start, end);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList list = bService.selectByDateList(start, end, pi);
		
//		System.out.println(pi);
//		System.out.println(list);
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("pi", pi);
		result.put("list", list);
		
		return new Gson().toJson(result);
	}
	
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 22.
	 * @method	: 회의실별, 날짜별 예약 목록 조회 요청 
	 * @param	: cpage, rmNo, start, end
	 * @return	: list, pi
	 */
	@ResponseBody
	@RequestMapping(value="selectByRD.bk", produces="application/json; charset=UTF-8")
	public String ajaxSelectByRoomAndDate(@RequestParam(value="cpage", defaultValue="1") int currentPage, String rmNo, String start, String end) {
//		System.out.println("rmNo : " + rmNo);
//		System.out.println("start : " + start);
//		System.out.println("end : " + end);
//		System.out.println("cpage : " + currentPage);
		
		int listCount = bService.selectByRoomAndDateListCount(rmNo, start, end);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList list = bService.selectByRoomAndDateList(rmNo, start, end, pi);
		
//		System.out.println(pi);
//		System.out.println(list);
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("pi", pi);
		result.put("list", list);
		
		return new Gson().toJson(result);
	}
	
	
}
