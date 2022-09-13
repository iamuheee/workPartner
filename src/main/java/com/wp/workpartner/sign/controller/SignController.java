package com.wp.workpartner.sign.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SignController {
	@RequestMapping("vacationEnrollForm.bo")
	public String vacationEnrollForm() {
		return "sign/vacation";
	}
	@RequestMapping("reSignEnrollForm.bo")
	public String reSignEmpEnrollForm() {
		return "sign/reSignEmp";
	}
	@RequestMapping("outWorkEnrollForm.bo")
	public String outworkEnrollForm() {
		return "sign/outWork";
	}
	@RequestMapping("coopEnrollForm.bo")
	public String coopEnrollForm() {
		return "sign/cooperation";
	}
	
}
