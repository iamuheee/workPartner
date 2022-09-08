package com.wp.workpartner.duty.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wp.workpartner.duty.model.service.DutyServiceImpl;
import com.wp.workpartner.duty.model.vo.Duty;

@Controller
public class DutyController {
	
	@Autowired
	private DutyServiceImpl dService;
	
	public String insertDuty(Duty d) {
		int result = dService.insertDuty(d);
		
		if(result > 0) {
			
			return "";
		}else {
			return "";
		}
	}
	
	
}
