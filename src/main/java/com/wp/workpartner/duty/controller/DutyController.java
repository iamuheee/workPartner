package com.wp.workpartner.duty.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.common.template.FileUpload;
import com.wp.workpartner.common.template.Pagination;
import com.wp.workpartner.duty.model.service.DutyServiceImpl;
import com.wp.workpartner.duty.model.vo.Duty;
import com.wp.workpartner.duty.model.vo.DutyCharge;
import com.wp.workpartner.employee.model.vo.Employee;

@Controller
public class DutyController {
	
	@Autowired
	private DutyServiceImpl dService;
	
	@Autowired
	private HttpSession session;
	
	
	/**
	 * 업무 등록 페이지로 이동
	 * @return "duty/dutyInsertForm"
	 */
	@RequestMapping("enroll.du")
	public String dutyInsertForm() {
		return "duty/dutyInsertForm";
	}
	
	
	/**
	 * 새로운 업무 등록
	 * @param Duty d
	 * @return "detail.du?no=등록된업무번호" 
	 */
	@RequestMapping("insert.du")
	public String insertDuty(Duty d, MultipartFile upfile, HttpSession session, Model m) {
		// 공통적으로 필요한 DDL
		// TB_DUTY 테이블에 대한 INSERT문 : Duty d 필요
		// TB_DUTY_CHARGE 테이블에 대한 INSERT문 : int dutyNo, ArrayList<DutyCharge> empIC 필요 <- Duty d에 담겨있음 / 담당자 사원의 이름은 SELECT문으로 조회해야 함
		
		// 첨부파일 있는 경우, TB_FILE에 대한 INSERT문 : File f 필요 ( == File.uploadFile)
		
		// => 첨부파일 유무에 따라 Service를 한번만 쓰되
		//	  한 Service에서 여러 Dao를 이용하기

		int result = 0; 
		
		if(upfile != null) {
			result = dService.insertDutyWithFile(d, File.uploadFile(upfile, FileUpload.saveFile(upfile, session, "resources/uploadFiles/")) );
		}else {
			result = dService.insertDutyWithoutFile(d);
		}
		
		if(result > 0) {
			session.setAttribute("alertMsg", "업무 등록에 성공했습니다.");
			return "list.du";
		}else {
			m.addAttribute("errorMsg", "업무 등록에 실패했습니다.");
			return "common/errorPage";
		}
	}
	
	
	/**
	 * 업무 리스트 조회
	 * @return ModelAndView <- ArrayList<Duty> dlist, ArrayList<DutyCharge> dclist
	 */
	@RequestMapping("list.du")
	public ModelAndView selectDutyList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv){
															// currentPage의 키값은 cpage, 기본값은 1
		int listCount = dService.selectDutyListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		String empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo(); // 세션에서 loginUser의 사번 받기
																				 // 그룹웨어이므로 empNo == null이면 아예 이 링크를 접근할 수 없도록 함
		
		mv.addObject("dlist", dService.selectDutyList(pi, empNo)).addObject("pi", pi).setViewName("duty/dutyListView");
		return mv;
	}
	
	
	/**
	 * 업무 상세 조회 
	 * @return Duty
	 */
	@RequestMapping("detail.du")
	public ModelAndView selectDuty(ModelAndView mv, @RequestParam(value="no")int no) {
		Duty d = dService.selectDuty(no);

		if(d != null) {
			mv.addObject("d", d).setViewName("duty/dutyDetailView");
		}else {
			mv.addObject("errorMsg", "요청하신 번호의 업무를 찾을 수 없습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
}
