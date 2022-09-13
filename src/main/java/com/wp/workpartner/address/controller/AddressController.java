package com.wp.workpartner.address.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wp.workpartner.address.model.service.AddressService;

@Controller
public class AddressController {
		
	@Autowired
	private AddressService bService;
	
	@RequestMapping("list.ad")
	private String selectAddressList() {
		return "address/addressListView";
	}
	
	// 부서	
//	@ResponseBody
//	@RequestMapping(value="deplist.ad", produces="application/json; charset=utf-8")
//	public String ajaxSelectDepartmentList() {
//		ArrayList<Department> list = 
//	}
}
