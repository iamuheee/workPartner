package com.wp.workpartner.duty.controller;


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
		
		
		// empICNo : empNo,empNo,empNo 의 형태
		// => tb_employee에서 employee 객체의 ArrayList 조회, 각각을 TB_DUTY_CHARGE에 담기

		int result = 0; 
		
		if(upfile.getOriginalFilename().length() > 0) {
			File f = File.uploadFile(upfile, FileUpload.saveFile(upfile, session, "resources/uploadFiles/"));
			d.setFilePath( f.getFilePath() );
			result = dService.insertDutyWithFile(d, f);
		}else {
			result = dService.insertDutyWithoutFile(d);
		}
		
		if(result > 0) {
			session.setAttribute("alertMsg", "업무 등록에 성공했습니다.");
			return "redirect:list.du";
		}else {
			m.addAttribute("errorMsg", "업무 등록에 실패했습니다.");
			return "common/error";
		}
	}
	
	
	/**
	 * 업무 리스트 조회
	 * @return ModelAndView <- ArrayList<Duty> dlist, ArrayList<DutyCharge> dclist
	 */
	@RequestMapping("list.du")
	public ModelAndView selectDutyList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, ModelAndView mv){
															// currentPage의 키값은 cpage, 기본값은 1
		Duty d = new Duty();
		d.setEmpNo( ((Employee)session.getAttribute("loginUser")).getEmpNo() );
		
		int listCount = dService.selectDutyListCount(d);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		mv.addObject("dlist", dService.selectDutyList(pi, d.getEmpNo()))
		  .addObject("pi", pi)
		  .setViewName("duty/dutyListView");
		return mv;
	}
	
	
	
	/**
	 * 업무 상세 조회 
	 * @return Duty
	 */
	@RequestMapping("detail.du")
	public ModelAndView selectDuty(ModelAndView mv, @RequestParam(value="no")String no) {
		Duty d = dService.selectDuty(no);

		if(d != null) {
			mv.addObject("d", d).setViewName("duty/dutyDetailView");
		}else {
			mv.addObject("errorMsg", "요청하신 번호의 업무를 찾을 수 없습니다.").setViewName("common/error");
		}
		
		return mv;
	}
	
	
	/**
	 * 업무 수정 페이지로 이동
	 * @param mv
	 * @param dutyNo
	 * @return
	 */
	@RequestMapping("uform.du")
	public ModelAndView updateDutyForm(ModelAndView mv, @RequestParam("no")String dutyNo) {
		// 1. 수정하려는 dutyNo에 해당하는 Duty 객체 조회
		// 2. Duty객체를 수정 페이지에 보냄
		Duty d = dService.selectDuty(dutyNo);
		
		if(d != null) {
			String empICNo = "", empICName = "";
			for( DutyCharge dc : d.getEmpIC() ) {
				empICNo += dc.getEmpICNo() + ",";
				empICName += dc.getEmpICName() + ",";
			}
			d.setEmpICNo(empICNo.substring(0, empICNo.length() - 1));
			d.setEmpICName(empICName.substring(0, empICName.length() - 1));
			System.out.println("수정폼에 보내는 d : " + d);
			mv.addObject("d", d).setViewName("duty/dutyUpdateForm");
		}else {
			mv.addObject("errorMsg","업무 수정 페이지 이동에 실패했습니다.").setViewName("common/error");
		}
		return mv;
	}
	
	
	/**
	 * 업무 수정(UPDATE) 요청처리
	 * @param upfile
	 * @param d
	 * @param session
	 * @param m
	 * @return
	 */
	@RequestMapping("update.du")
	public String updateDuty(MultipartFile upfile, Duty d, HttpSession session, Model m) {
		
		
		int result2 = 1;
		System.out.println("upfile.isEmpty는" + upfile.isEmpty() );
		if(!upfile.isEmpty()) {
			// 새로 업로드된 파일이 있는 경우
			File file = File.uploadFile(upfile, FileUpload.saveFile(upfile, session, "resources/uploadFiles/"));
			file.setRefNo( Integer.parseInt(d.getDutyNo()) );
			d.setFilePath(file.getFilePath()); // filePath 새로 담아주기
			 if(d.getFilePath() == null) { 
				 // 기존 파일이 없는 경우 : TB_FILE에 INSERT 진행
				 result2 *= dService.insertDutyFile(file); 
			 }else { 
				 // 기존 파일이 있는 경우 : TB_FILE에 UPDATE (FILE_REF_NO = ?) 진행
				 result2 *= dService.updateDutyFile(file); 
			 }
		}
		
		int result1 = dService.updateDuty(d);
		
		if(result1 * result2 > 0) {
			session.setAttribute("alertMsg", "업무 수정에 성공했습니다.");
			return "redirect:detail.du?no=" + d.getDutyNo();
		}else {
			m.addAttribute("errorMsg", "업무 수정에 실패했습니다.");
			return "common/error";
		}
	}
	
	@RequestMapping("delete.du")
	public String deleteDuty(String dutyNo, HttpSession session, Model m) {
		int result = dService.deleteDuty(dutyNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "업무 삭제에 성공했습니다.");
			return "redirect:list.du";
		}else {
			m.addAttribute("errorMsg", "업무 삭제에 실패했습니다.");
			return "common/error";
		}
	}

}
