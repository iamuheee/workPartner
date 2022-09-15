package com.wp.workpartner.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wp.workpartner.notice.model.service.NoticeService;

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
	
	
	
	
}
