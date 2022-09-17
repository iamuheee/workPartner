package com.wp.workpartner.duty.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.common.template.Pagination;
import com.wp.workpartner.duty.model.service.DutyServiceImpl;
import com.wp.workpartner.duty.model.vo.Duty;

@Controller
public class DutySearchController {
	
	@Autowired
	DutyServiceImpl dService;
	
	@Autowired
	private HttpSession session;
	
	
	// ===============================================================================================================
	
	@ResponseBody
	@RequestMapping(value="incomplete.du", produces="application/json; charset=utf-8")
	public String selectNotDoneList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Duty d) {
		// dutyNo == PROGRESS가 "완료"인 dutyNo을 콤마로 이어붙인 문자열 (ex: 6,7,8)
		// 그런데, dutyNo 중 하나에 속하면 조회하는 개념이기때문에 IN(6,7,8)이 ${} 안에 들어가야 함
		// => dutyNo을 () 안에 묶어야 함
		d.setDutyNo( "(" + d.getDutyNo() + ")");
		
		System.out.println(d);
		
		PageInfo pi = Pagination.getPageInfo(dService.selectDutyListCount(d), 1, 5, 10);
		ArrayList<Duty> notDoneList = dService.selectMyList(pi, d);
		
		System.out.println(notDoneList);
		
		HashMap<String, Object> doneFilter = new HashMap<>();
		doneFilter.put("notDoneList", notDoneList);
		doneFilter.put("pi", pi);
		
		return new Gson().toJson(doneFilter);
	}
	
	
	@ResponseBody
	@RequestMapping(value="myduty.du", produces="application/json; charset=utf-8")
	public String selectMyList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Duty d) {
		PageInfo pi = Pagination.getPageInfo(dService.selectDutyListCount(d), 1, 5, 10);
		ArrayList<Duty> mylist = dService.selectMyList(pi, d);
		
		HashMap<String, Object> myduty = new HashMap<>();
		myduty.put("mylist", mylist);
		myduty.put("pi", pi);
		
		return new Gson().toJson(myduty);
	}
	
	
	@RequestMapping("search.du")
	public ModelAndView selectSearchList( @RequestParam(value="cpage", defaultValue="1")int currentPage, ModelAndView mv, Duty d){
		
		d.setTitle( "%" + d.getTitle() + "%" ); // 키워드검색 : LIKE 연산자 써야되므로 미리 붙여주기
		System.out.println(d);
		PageInfo pi = Pagination.getPageInfo(dService.selectDutyListCount(d), currentPage, 5, 10);
		ArrayList<Duty> dlist = dService.selectMyList(pi, d);
		System.out.println(dlist);
		mv.addObject("pi", pi)
		  .addObject("dlist", dlist)
		  .setViewName("duty/dutySearchList");
		return mv;
	}
	
	
	
}
