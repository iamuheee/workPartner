package com.wp.workpartner.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AttendanceController {
	
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

}
