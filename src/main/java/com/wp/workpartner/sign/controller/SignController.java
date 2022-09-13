package com.wp.workpartner.sign.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SignController {
	@RequestMapping("coopEnrollForm.bo")
	public String coopEnrollForm() {
		return "sign/cooperation";
	}
}
