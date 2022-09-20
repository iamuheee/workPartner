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
import com.wp.workpartner.attendance.model.vo.Department;
import com.wp.workpartner.attendance.model.vo.Position;
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
//	@RequestMapping("adminAtt.att")
//	private String adminAttendance() {
//		return "attendance/adminAttendanceView";
//	}
	
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
	
	/** 직위/직무 url
	 * @return url
	 */
	@RequestMapping(value="adminPosition.att", produces="application/json; charset=utf-8")
	private String adminPosition(Model model) {
		
		ArrayList<Department> list = aService.departmentList(); // 부서정보 가져오기
		ArrayList<Position> list2 = aService.positionList();    // 직위정보 가져오기
		
		model.addAttribute("list", list);
		
		return "attendance/adminPositionView";
	}
	
	
	
	
	/** 전사원근태현황
	 * @return url
	 */
	@RequestMapping(value="adminAtt.att", produces="application/json; charset=utf-8")
	public String adminAttendance(@RequestParam(value="cpage",  defaultValue="1") int currentPage, String date1, String date2, String condition, String keyword, Model model) {
		
		if(condition == null){
			condition = "0";
		}
		
		
		String a = "정상";
		String b = "지각";
		String c = "결근";
		String d = "연차";
		String e = "조퇴";
		String f = "오전반차";
		String g = "오후반차";
		
		ArrayList<Department> list2 = aService.departmentList();  // 부서정보 가져오기
		
		int searchCount = aService.selectSearchCount(date1, date2, condition, keyword);
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 5, 10);
		
		System.out.println(pi);
		System.out.println(condition);
		
		ArrayList<Attendance> list = aService.selectSearchList(date1, date2, condition, keyword, pi);
		
		
		int statusCount1 = aService.statusCount(a, date1, date2, condition, keyword); //정상
		int statusCount2 = aService.statusCount(b, date1, date2, condition, keyword); //지각
		int statusCount3 = aService.statusCount(c, date1, date2, condition, keyword); //결근
		int statusCount4 = aService.statusCount(d, date1, date2, condition, keyword); //연차
		int statusCount5 = aService.statusCount(e, date1, date2, condition, keyword); //조퇴
		int statusCount6 = aService.statusCount(f, date1, date2, condition, keyword); //오전반차
		int statusCount7 = aService.statusCount(g, date1, date2, condition, keyword); //오후반차
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("date1", date1);
		model.addAttribute("date2", date2);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("status1", statusCount1);
		model.addAttribute("status2", statusCount2);
		model.addAttribute("status3", statusCount3);
		model.addAttribute("status4", statusCount4);
		model.addAttribute("status5", statusCount5);
		model.addAttribute("status6", statusCount6);
		model.addAttribute("status7", statusCount7);
		
		return "attendance/adminAttendanceView";
	}
	

	
}
