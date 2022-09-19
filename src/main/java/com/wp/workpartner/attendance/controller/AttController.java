package com.wp.workpartner.attendance.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wp.workpartner.attendance.model.service.AttService;
import com.wp.workpartner.attendance.model.vo.Attendance;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.common.template.Pagination;

@Controller
public class AttController {
	
	@Autowired
	private AttService aService;
	
	/** 출석체크 이동하는 url
	 * @return url
	 */
	@RequestMapping("check.att")
	private String checkAtt() {
		return "attendance/checkAttendanceView";
	}
	
	/** 내근태현황 이동하는 url
	 * @return url
	 */
	@RequestMapping("my.att")
	private String myAtt() {
		return "attendance/myAttendanceView";
	}
	
	/** 내근태이력 이동하는 url
	 * @return url
	 */
	@RequestMapping("myAttHis.att")
	private String AttHistory() {
		return "attendance/attendanceHistoryView";
	}
	
	/** 내휴가내역 이동하는 url
	 * @return url
	 */
	@RequestMapping("myVacation.att")
	private String myVacation() {
		return "attendance/vacationView";
	}
	
	/** 전사원근태현황 이동하는 url
	 * @return url
	 */
	@RequestMapping("adminAtt.att")
	private String adminAttendance() {
		return "attendance/adminAttendanceView";
	}
	
	/** 근태조정내역 이동하는 url
	 * @return url
	 */
	@RequestMapping("adminAttAdjust.att")
	private String adminAttAdjust() {
		return "attendance/adminAttAdjustView";
	}
	
	/** 전사원휴가현황 이동하는 url
	 * @return url
	 */
	@RequestMapping("adminVacation.att")
	private String adminVacation() {
		return "attendance/adminVacationView";
	}
	
	/** 직위/직무 이동하는 url
	 * @return url
	 */
	@RequestMapping("adminPosition.att")
	private String adminPosition() {
		return "attendance/adminPositionView";
	}
	
	
	
	
	/** 전사원근태현황
	 * @return url
	 */
	
	@RequestMapping(value="adminAttlist.att", produces="application/json; charset=utf-8")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String date1, String date2, String condition, String keyword, Model model) {
		
		int searchCount = aService.selectSearchCount(date1, date2, condition, keyword);
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 5);
	
		ArrayList<Attendance> list = aService.selectSearchList(date1, date2, condition, keyword, pi);
		
//		System.out.println(pi);
//		System.out.println(list);
//		System.out.println(date1);
//		System.out.println(date2);
//		System.out.println(condition);
//		System.out.println(keyword);
//		System.out.println(searchCount);
		
		model.addAttribute("pi", pi);
		//model.addAttribute("list", list);
		model.addAttribute("date1", date1);
		model.addAttribute("date2", date2);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return "redirect:adminAtt.att";
	}
	
}
