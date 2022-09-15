package com.wp.workpartner.sign.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.wp.workpartner.common.template.FileUpload;
import com.wp.workpartner.sign.model.service.SignService;
import com.wp.workpartner.sign.model.vo.Dtpaper;
import com.wp.workpartner.sign.model.vo.Vacation;

@Controller
public class SignController {
	@Autowired
	private SignService sService;
	@RequestMapping("vaEnroll.si")
	public String vacationEnrollForm(Model model) {
		
		model.addAttribute("paperName", "연차");
		return "sign/vacation";
	}
	@RequestMapping("reEnroll.si")
	public String reSignEmpEnrollForm(Model model) {
		model.addAttribute("paperName", "퇴직원");
		return "sign/reSignEmp";
	}
	@RequestMapping("owEnroll.si")
	public String outworkEnrollForm(Model model) {
		model.addAttribute("paperName", "외근");
		return "sign/outWork";
	}
	@RequestMapping("coEnroll.si")
	public String coopEnrollForm(Model model) {
		model.addAttribute("paperName", "업무협조");
		return "sign/cooperation";
	}
//	@RequestMapping("signMain.bo")
//	public String signMain() {
//		return "sign/signMain";
//	}
	@RequestMapping("insertV.si")
	public String insertVacation(Dtpaper d, Vacation v, MultipartFile upfile, HttpSession session, Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/"); 
			
			d.setDpOrigin(upfile.getOriginalFilename());
			d.setDpChange(saveFilePath);
		}
		
		// 넘어온 첨부파일이 없을 경우 b : 제목, 작성자, 내용
		// 넘어온 첨부파일이 있을 경우 b : 제목, 작성자, 내용, 파일원본명, 파일저장경로
		int result1 = sService.insertDtpaper(d);
		
		if(result1 > 0) { // 성공 => alert, 게시글 리스트페이지
			int reuslt2 = sService.insertVacation(v);
			session.setAttribute("alertMsg", "결재 신청 되었습니다.");
			return "redirect:workpartner"; //위에 cpage 선언해둠. list.bo?cpage=1 이렇게 작성필요 x
		}else { // 실패 => 에러문구, 에러페이지
			model.addAttribute("errorMsg", "결재 신청 실패.");
			return "common/errorPage";
		}
	}
	
// 기안서 리스트 조회
	@RequestMapping("saveSi.si")
	public String selectSaveSignList(Model model) {
		model.addAttribute("flag", "save");
		return "sign/dpaperSaveResign";
	}
	@RequestMapping("contSi.si")
	public String selectContSignList(Model model) {
		model.addAttribute("flag", "continue");
		return "sign/dpaperContEnd";
	}
	@RequestMapping("reSi.si")
	public String selectReSignList(Model model) {
		model.addAttribute("flag", "reSign");
		return "sign/dpaperSaveResign";
	}
	@RequestMapping("endSi.si")
	public String selectEndSignList(Model model) {
		model.addAttribute("flag", "end");
		return "sign/dpaperContEnd";
	}
	
//	타부서 결재함
	@RequestMapping("othSi.si")
	public String selectOtherSignList(Model model){
		model.addAttribute("flag", "otherSign");
		return "sign/otherDeptSign";
	}
	@RequestMapping("othEndSi.si")
	public String selectOtherSignEndList(Model model) {
		model.addAttribute("flag", "otherEndSign");
		return "sign/otherDeptSign";
	}
//	내 부서 결재함
	@RequestMapping("deptSi.si")
	public String selectDeptSignList(Model model){
		model.addAttribute("flag", "deptSign");
		return "sign/deptSign";
	}
	@RequestMapping("deptEndSi.si")
	public String selectDeptSignEndList(Model model) {
		model.addAttribute("flag", "deptEndSign");
		return "sign/deptSign";
	}
}
	