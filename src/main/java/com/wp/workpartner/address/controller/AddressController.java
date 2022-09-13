package com.wp.workpartner.address.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.wp.workpartner.address.model.service.AddressService;
import com.wp.workpartner.address.model.vo.Department;
import com.wp.workpartner.address.model.vo.MyAddress;
import com.wp.workpartner.address.model.vo.MyGroup;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.common.template.Pagination;
import com.wp.workpartner.employee.model.vo.Employee;

@Controller
public class AddressController {
		
	@Autowired
	private AddressService adService;
	
	// 주소록list
	@RequestMapping("list.ad")
	private String selectAddressList() {
		return "address/addressListView";
	}
		
	// 부서 list용 ajax
	@ResponseBody
	@RequestMapping(value="depList.ad", produces="application/json; charset=utf-8")
	public String ajaxSelectDepartmentList() {
		ArrayList<Department> list = adService.selectDepList();
		//System.out.println(list);
		return new Gson().toJson(list);
	}
	
	// 내연락처 목록용 ajax
	@ResponseBody
	@RequestMapping(value="gpList.ad", produces="application/json; charset=utf-8")
	public String ajaxSelectGroupList(String employeeNo) {
		ArrayList<MyGroup> list = adService.selectGpList(employeeNo);
		return new Gson().toJson(list);
	}
	
	// 부서별 사원테이블조회용 ajax
	@ResponseBody
	@RequestMapping(value="depTb.ad", produces="application/json; charset=utf-8")
	public String ajaxSelectEmpAddList(int depCd, @RequestParam(value="cpage", defaultValue="1")int currentPage) {
		
		int listCount = adService.selectEmpAdListCount(depCd);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 10);				
		ArrayList<Employee> list = adService.selectEmpAdList(depCd, pi);		
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list", list);
		hm.put("pi", pi);
		return new Gson().toJson(hm);		
	}
	
	@ResponseBody
	@RequestMapping(value="myAdTb.ad", produces="application/json; charset=utf-8")
	public String ajaxSelectMyAddList(int groupNo, @RequestParam(value="cpage", defaultValue="1")int currentPage) {
		
		int listCount = adService.selectMyAddCount(groupNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 10);		
		ArrayList<MyAddress> list = adService.selectMyAddList(groupNo, pi);
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list", list);
		hm.put("pi", pi);
		return new Gson().toJson(hm);		
	}
	
	@ResponseBody
	@RequestMapping(value="starList.ad", produces="application/json; charset=utf-8")
	public String ajaxSelectStarList(String empNo, @RequestParam(value="cpage", defaultValue="1")int currentPage) {
		
		int listCount = adService.selectStarAdCount(empNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 2);
		ArrayList<MyAddress> list = adService.selectStarList(empNo, pi);
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list", list);
		hm.put("pi", pi);
		return new Gson().toJson(hm);
		
	}
}
