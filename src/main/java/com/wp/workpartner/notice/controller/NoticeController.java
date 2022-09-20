package com.wp.workpartner.notice.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.common.template.Pagination;
import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.notice.model.service.NoticeService;
import com.wp.workpartner.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService ntService;
	
	//공지사항게시판 조회
	@RequestMapping("list.nt")
	public String selectNoticeList() {
		return "notice/noticeListView";
	}
	
	// 공지사항 등록폼	
	@RequestMapping("insertNtForm.nt")
	public String insertFormNotice(){
		return "notice/noticeInsertForm";
	}
	
	// 공지사항 상세내용
	@RequestMapping("detail.nt")
	public String detailNotice(){
		return "notice/noticeDetailView";
	}
	
	// 공지사항 수정페이지
	@RequestMapping("update.nt")
	public String updateNotice() {
		return "notice/noticeUpdateForm";
	}
	
	// 공지사항 관리자 설정페이지
	@RequestMapping("admin.nt")
	public String adminNoticeManage() {
		return "notice/noticeAdmin";
	}
	
	
	/** 공지사항 관리자 조회
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectNtAdminY.nt", produces="application/json; charset=utf-8")
	public String ajaxSelectNtAdminY() {
		ArrayList<Employee> list = ntService.selectNtAdminY();		
		return new Gson().toJson(list);		
	}
	
	/**  공지사항 관리자 변경 Y => N
	 * @param empNo 관리자 => 일반사원 으로 변경될 사번
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="upDateAdminN.nt")
	public String ajaxUpdateAdminN(String empNo) {
		int result = ntService.upDateAdminN(empNo);
		return result>0 ? "success" : "fail";
	}
	
	
	/**  공지사항 관리자 변경 Y 
	 * @param empNo 일반사원 => 관리자 으로 변경될 사번
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="updateAdminY.nt")
	public String ajaxUpdateAdminY(String[] arrEmp) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("arrEmp", arrEmp);
		
		int result = ntService.updateAdminY(map);
		return result>0 ? "success" : "fail";
		
	}
	
	/** 상단 주요 공지사항 list조회
	 * @param currentPage 현재 페이지
	 * @param searchCategory 검색 카테고리
	 * @param keyword 검색 입력어
	 * @param filter 필터링
	 * @param orderNotice 순서
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectTop.nt", produces="applicaton/json; charset=utf-8")
	public String ajaxSelectTopNotice(@RequestParam(value="cpage", defaultValue="1")int currentPage, 
			String searchCategory, String keyword, String filter, String orderNotice) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchCategory", searchCategory);
		map.put("keyword", keyword);
		map.put("filter", filter);
		map.put("orderNotice", orderNotice);
						
		int listCount = ntService.selectTopNoticeCount(map);
						
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 4);
		ArrayList<Notice> list = ntService.selectTopNotice(map, pi);
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list",list);
		hm.put("pi", pi);
		
		return new Gson().toJson(hm);
				
	}
	
	@ResponseBody
	@RequestMapping(value="selectNormal.nt", produces="applicaton/json; charset=utf-8")
	public String ajaxSelectNormalNotice(@RequestParam(value="cpage", defaultValue="1")int currentPage, 
			String searchCategory, String keyword, String filter, String orderNotice) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchCategory", searchCategory);
		map.put("keyword", keyword);
		map.put("filter", filter);
		map.put("orderNotice", orderNotice);
						
		int listCount = ntService.selectNormalNoticeCount(map);
						
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 9);
		ArrayList<Notice> list = ntService.selectNormalNotice(map, pi);
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list",list);
		hm.put("pi", pi);
		
		return new Gson().toJson(hm);
				
	}
	
	
	
}
