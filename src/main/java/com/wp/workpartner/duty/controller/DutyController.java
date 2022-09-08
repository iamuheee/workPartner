package com.wp.workpartner.duty.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wp.workpartner.duty.model.service.DutyServiceImpl;
import com.wp.workpartner.duty.model.vo.Duty;

@Controller
public class DutyController {
	
	@Autowired
	private DutyServiceImpl dService;
	
	/**
	 * 업무 등록 페이지로 이동하는 요청 처리
	 * @return "duty/dutyInsertForm"
	 */
	@RequestMapping("enroll.du")
	public String dutyInsertForm() {
		return "duty/dutyInsertForm";
	}
	
	public String insertDuty(Duty d) {
		int result = dService.insertDuty(d);
		
		if(result > 0) {
			
			return "";
		}else {
			return "";
		}
	}
	
	
}
