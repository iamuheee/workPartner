package com.wp.workpartner.attendance.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.wp.workpartner.attendance.model.service.AttService;
import com.wp.workpartner.attendance.model.vo.Attendance;
import com.wp.workpartner.attendance.model.vo.Department;
import com.wp.workpartner.attendance.model.vo.Holiday;
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
	@RequestMapping(value="check.att", produces="application/json; charset=utf-8")
	private String checkAtt(Model model, String empNo) {
		
		ArrayList<Holiday> list = aService.holidayList(); // 공휴일정보 가져오기
		ArrayList<Attendance> list2 = aService.badWorkList(empNo); // 결근 정보 가져오기
		ArrayList<Attendance> list3 = aService.goodWorkList(empNo); // 정상 정보 가져오기
		ArrayList<Attendance> list4 = aService.vacationWorkList(empNo); // 연차 정보 가져오기
		ArrayList<Attendance> list5 = aService.bad2WorkList(empNo); // 지각,조퇴 정보 가져오기
		
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);
		model.addAttribute("list5", list5);
		
		return "attendance/checkAttendanceView";
	}
	
	/** 내휴가내역 이동하는 url
	 * @return url
	 */
	@RequestMapping("myVacation.att")
	private String myVacation() {
		return "attendance/vacationView";
	}
	
	/** 내근태현황 이동하는 url
	 * @return url
	 */
	@RequestMapping("myAttHis.att")
	private String myAtt() {
		
		return "attendance/attendanceHistoryView";
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
	
	/** 공휴일 관리화면 이동하는 url
	 * @return url
	 */
	@RequestMapping(value="adminHoliday.att", produces="application/json; charset=utf-8")
	private String adminHoliday(Model model) {
		
		ArrayList<Holiday> list = aService.holidayList(); // 공휴일정보 가져오기
		
		model.addAttribute("list", list);
		
		return "attendance/adminHolidayView";
	}
	
	// 공휴일 등록
		@RequestMapping(value="insert.hol", produces="application/json; charset=utf-8")
		private String insertHoliday(Model model, HttpSession session, String holidayCode, String holidayName) {
			
			int result = aService.insertHoliday(holidayCode, holidayName);
			
			if(result > 0) {  
				session.setAttribute("alertMsg", "성공적으로 공휴일이 등록되었습니다.");
				return "redirect:adminHoliday.att";
			}else { 
				session.setAttribute("alertMsg", "공휴일 등록 실패.");
				return "redirect:adminHoliday.att";
			}
		}
		
	// 공휴일 수정
		@RequestMapping(value="update.hol", produces="application/json; charset=utf-8")
		private String updateHoliday(Model model, HttpSession session, String holidayCode1, String holidayName1, String holidayCode2, String holidayName2 ) {
			
			if((holidayCode2 == "" || holidayCode2 == null) || (holidayName2 == "" || holidayName2 == null)) {
				
				session.setAttribute("alertMsg", "값을 입력하세요");
				return "redirect:adminHoliday.att";
				
			}else {
				
				int result = aService.updateHoliday(holidayCode1, holidayName1, holidayCode2, holidayName2);
				
				if(result > 0) {  
					session.setAttribute("alertMsg", "성공적으로 공휴일이 수정되었습니다.");
					return "redirect:adminHoliday.att";
				}else { 
					session.setAttribute("alertMsg", "공휴일 수정 실패");
					return "redirect:adminHoliday.att";
			
				
			    }
			}	
		}
			
	// 공휴일 삭제
		@RequestMapping(value="delete.hol", produces="application/json; charset=utf-8")
		private String deleteHoliday(Model model, HttpSession session, String holidayCode1, String holidayName1) {

			int result = aService.deleteHoliday(holidayCode1, holidayName1);
			
			if(result > 0) {  
				session.setAttribute("alertMsg", "성공적으로 공휴일이 삭제되었습니다.");
				return "redirect:adminHoliday.att";
			}else { 
				session.setAttribute("alertMsg", "공휴일 삭제 실패");
				return "redirect:adminHoliday.att";
		
				
			}
		}	
			
	
	/** 직위/직무 url
	 * @return url
	 */
	@RequestMapping(value="adminPosition.att", produces="application/json; charset=utf-8")
	private String adminPosition(Model model) {
		
		ArrayList<Department> list = aService.departmentList(); // 부서정보 가져오기
		ArrayList<Position> list2 = aService.positionList();    // 직위정보 가져오기
		
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		
		return "attendance/adminPositionView";
	}
	
	// 직위 등록
	@RequestMapping(value="insert.pst", produces="application/json; charset=utf-8")
	private String insertPosition(Model model, HttpSession session, String positionCode, String positionName) {
		
		int result = aService.insertPosition(positionCode, positionName);
		
		if(result > 0) {  
			session.setAttribute("alertMsg", "성공적으로 직위가 등록되었습니다.");
			return "redirect:adminPosition.att";
		}else { 
			session.setAttribute("alertMsg", "직위 등록 실패.");
			return "redirect:adminPosition.att";
		}
	}
	
	// 직위 수정
		@RequestMapping(value="update.pst", produces="application/json; charset=utf-8")
		private String updatePosition(Model model, HttpSession session, String positionCode1, String positionName1, String positionCode2, String positionName2 ) {
			
			if((positionCode2 == "" || positionCode2 == null) || (positionName2 == "" || positionName2 == null)) {
				
				session.setAttribute("alertMsg", "값을 입력하세요");
				return "redirect:adminPosition.att";
				
			}else {
				
				int result = aService.updatePosition(positionCode1, positionName1, positionCode2, positionName2);
				
				if(result > 0) {  
					session.setAttribute("alertMsg", "성공적으로 직위가 수정되었습니다.");
					return "redirect:adminPosition.att";
				}else { 
					session.setAttribute("alertMsg", "직위 수정 실패");
					return "redirect:adminPosition.att";
			
				
			    }
			}	
		}
		
	// 직위 삭제
		@RequestMapping(value="delete.pst", produces="application/json; charset=utf-8")
		private String deletePosition(Model model, HttpSession session, String positionCode1, String positionName1) {

			int result = aService.deletePosition(positionCode1, positionName1);
			
			if(result > 0) {  
				session.setAttribute("alertMsg", "성공적으로 직위가 삭제되었습니다.");
				return "redirect:adminPosition.att";
			}else { 
				session.setAttribute("alertMsg", "직위 삭제 실패");
				return "redirect:adminPosition.att";
		
				
			}
		}	
			
	
	// 부서 등록
	@RequestMapping(value="insert.dep", produces="application/json; charset=utf-8")
	private String insertDepartment(Model model, HttpSession session, String departmentCode, String departmentName) {
		
		int result = aService.insertDepartment(departmentCode, departmentName);
		
		if(result > 0) {  
			session.setAttribute("alertMsg", "성공적으로 부서가 등록되었습니다.");
			return "redirect:adminPosition.att";
		}else { 
			session.setAttribute("alertMsg", "부서 등록 실패");
			return "redirect:adminPosition.att";
		}
	}
	
	// 부서 수정
		@RequestMapping(value="update.dep", produces="application/json; charset=utf-8")
		private String updatedepartment(Model model, HttpSession session, String departmentCode1, String departmentName1, String departmentCode2, String departmentName2 ) {
			
			if((departmentCode2 == "" || departmentCode2 == null) || (departmentName2 == "" || departmentName2 == null)) {
				
				session.setAttribute("alertMsg", "값을 입력하세요");
				return "redirect:adminPosition.att";
				
			}else {
				
				int result = aService.updateDepartment(departmentCode1, departmentName1, departmentCode2, departmentName2);
				
				if(result > 0) {  
					session.setAttribute("alertMsg", "성공적으로 부서가 수정되었습니다.");
					return "redirect:adminPosition.att";
				}else { 
					session.setAttribute("alertMsg", "부서 수정 실패");
					return "redirect:adminPosition.att";
			
				
			    }
			}	
		}
			
	// 부서 삭제
		@RequestMapping(value="delete.dep", produces="application/json; charset=utf-8")
		private String deletedepartment(Model model, HttpSession session, String departmentCode1, String departmentName1) {

			int result = aService.deleteDepartment(departmentCode1, departmentName1);
			
			if(result > 0) {  
				session.setAttribute("alertMsg", "성공적으로 부서가 삭제되었습니다.");
				return "redirect:adminPosition.att";
			}else { 
				session.setAttribute("alertMsg", "부서 삭제 실패");
				return "redirect:adminPosition.att";
		
				
			}
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
	
	
	/** 내근태이력 이동하는 url
	 * @return url
	 */
	
	@RequestMapping(value="my.att", produces="application/json; charset=utf-8")
	private String AttHistory(@RequestParam(value="cpage",  defaultValue="1")int currentPage, String id, String date1, String date2, String check, Model model) {
		
		
		String[] array = null;
		
		if(check == null || check == "") {
			
			int searchCount = aService.myAttendanceCount(date1, date2, id);
			
			PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 5, 10);
			
			ArrayList<Attendance> list = aService.myAttendanceList(date1, date2, pi, id);
			
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("date1", date1);
			model.addAttribute("date2", date2);
			
			return "attendance/myAttendanceView";
			
		}else {
			array = check.split(",", 5);
			
			int searchCount = aService.myAttendanceCount(date1, date2, array, id);
			
			PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 5, 10);
			
			ArrayList<Attendance> list = aService.myAttendanceList(date1, date2, array, pi, id);
			
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("date1", date1);
			model.addAttribute("date2", date2);
			model.addAttribute("array", array);
			
			return "attendance/myAttendanceView";
			
		}
		
		
	}
	
	
	// 출석시간 보이는 페이지
	@ResponseBody
	@RequestMapping(value="mainTime.tm", produces="application/json; charset=utf-8")
	public String ajaxSelectReplyList(String empNo) {
		ArrayList<Attendance> list = aService.timeSelect(empNo);

		return new Gson().toJson(list); // "[{}, {}, {}, ...]		
	}
	
	
	
	
	// 출근하기 버튼 처리
	
	@RequestMapping(value="goWork.att", produces="application/json; charset=utf-8")
	public String goWork(String empNo, Model model, HttpSession session) {
		
		// 오늘이 공휴일, 연휴, 토/일 인지 확인    쉬는 날 : N  평일 Y
		ArrayList<Attendance> a = aService.checkHoliday(empNo);
		System.out.println(a);
		
		int count = 0;
		
		for (int i = 0; i < a.size(); i++) {
			//System.out.println(a.get(i).getHollyday());
			if(a.get(i).getHollyday().equals("Y")) {
				count ++;
			}
		}
		// System.out.println(count);
		
		// 오늘이 쉬는 날인 경우
		if(count == 0) {
			session.setAttribute("alertMsg", "오늘은 쉬는 날입니다.");
			return "common/mainPage";
		}else {
			
			// 오늘이 평일인 경우 -> 출석체크
			int result = aService.goWorkCheck(empNo);
			
			if(result > 0) {  
				session.setAttribute("alertMsg", "출근 완료");
				return "common/mainPage";
			}else { 
				session.setAttribute("alertMsg", "출근 실패");
				return "common/mainPage";
			}
		}
		
	}
	
	
	// 퇴근하기 버튼 처리 & 휴가지급
	
		@RequestMapping(value="outWork.att", produces="application/json; charset=utf-8")
		public String outWork(String empNo, Model model, HttpSession session) {

			// 1. 퇴근하기
			
			int result = aService.outWorkCheck(empNo);
			
			if(result > 0) {  
				
				session.setAttribute("alertMsg", "퇴근 완료");
				
				// 휴가 지급
				// 근무연수 0년차 
				
				return "common/mainPage";
				
			}else { 
				session.setAttribute("alertMsg", "퇴근 실패");
				return "common/mainPage";
			}
				
			
		}
	
	
	
	
}
