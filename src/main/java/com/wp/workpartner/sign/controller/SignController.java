package com.wp.workpartner.sign.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.wp.workpartner.common.template.FileUpload;
import com.wp.workpartner.sign.model.service.SignServiceImpl;
import com.wp.workpartner.sign.model.vo.Cooperation;
import com.wp.workpartner.sign.model.vo.Dtpaper;
import com.wp.workpartner.sign.model.vo.Otwork;
import com.wp.workpartner.sign.model.vo.ReSign;
import com.wp.workpartner.sign.model.vo.Sign;
import com.wp.workpartner.sign.model.vo.Vacation;

@Controller
public class SignController {
	
	@Autowired
	private SignServiceImpl sService;
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
	
		ArrayList<Sign> signList = d.getSignList();
 
		int result1 = sService.insertDtpaper(d);
		
		if(result1 > 0) { // 성공 => alert, 게시글 리스트페이지
			int result2 = sService.insertVacation(v);
				if(result2 > 0) {
					int result3 = sService.insertVaSign(signList);
					if(result3 > 0) {
						session.setAttribute("alertMsg", "결재 신청 되었습니다.");
					}
				}
				return "redirect:selectVa.si";
		}else { // 실패 => 에러문구, 에러페이지
			model.addAttribute("errorMsg", "결재 신청 실패.");
			return "common/errorPage";
		}
	}
	@RequestMapping("insertOw.si")
	public String insertOtWork(Dtpaper d, Otwork o, MultipartFile upfile, HttpSession session, Model model) {
		
		System.out.println(upfile);
		System.out.println(d);
		System.out.println(d.getSignList()); // ArrayList<Sign> 결재자리스
		System.out.println(o);
		if(!upfile.getOriginalFilename().equals("")) {
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/"); 
			
			d.setDpOrigin(upfile.getOriginalFilename());
			d.setDpChange(saveFilePath);
		}
		//int siAsign = d.getSignList().size();
		//System.out.println(siAsign);
		ArrayList<Sign> signList = d.getSignList();
//		System.out.println(signList);
		//signList.add(d.setSignList((d.getSignList).length);
		int result1 = sService.insertDtpaper(d);
		
		if(result1 > 0) { // 성공 => alert, 게시글 리스트페이지
			int result2 = sService.insertOtwork(o);
				if(result2 > 0) {
					int result3 = sService.insertOwSign(signList);
					if(result3 > 0) {
						session.setAttribute("alertMsg", "결재 신청 되었습니다.");
					}
				}
				return "redirect:sign/selectOutWork";
		}else { // 실패 => 에러문구, 에러페이지
			model.addAttribute("errorMsg", "결재 신청 실패.");
			return "common/errorPage";
		}
	}
	@RequestMapping("insertRe.si")
	public String insertReSignEmp(Dtpaper d, ReSign r, MultipartFile upfile, HttpSession session, Model model) {
		
		System.out.println(upfile);
		System.out.println(d);
		System.out.println(d.getSignList()); // ArrayList<Sign> 결재자리스
		System.out.println(r);
		if(!upfile.getOriginalFilename().equals("")) {
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/"); 
			
			d.setDpOrigin(upfile.getOriginalFilename());
			d.setDpChange(saveFilePath);
		}
		//int siAsign = d.getSignList().size();
		//System.out.println(siAsign);
		ArrayList<Sign> signList = d.getSignList();
//		System.out.println(signList);
		//signList.add(d.setSignList((d.getSignList).length);
		int result1 = sService.insertDtpaper(d);
		
		if(result1 > 0) { // 성공 => alert, 게시글 리스트페이지
			int result2 = sService.insertReSignEmp(r);
			if(result2 > 0) {
				int result3 = sService.insertReSign(signList);
				if(result3 > 0) {
					session.setAttribute("alertMsg", "결재 신청 되었습니다.");
				}
			}
			return "redirect:sign/selectOutWork";
		}else { // 실패 => 에러문구, 에러페이지
			model.addAttribute("errorMsg", "결재 신청 실패.");
			return "common/errorPage";
		}
	}
	@RequestMapping("insertCo.si")
	public String insertCooperation(Dtpaper d, Cooperation c, MultipartFile upfile, HttpSession session, Model model) {
		
		System.out.println(upfile);
		System.out.println(d);
		System.out.println(d.getSignList()); // ArrayList<Sign> 결재자리스
		System.out.println(c);
		if(!upfile.getOriginalFilename().equals("")) {
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/"); 
			
			d.setDpOrigin(upfile.getOriginalFilename());
			d.setDpChange(saveFilePath);
		}
		//int siAsign = d.getSignList().size();
		//System.out.println(siAsign);
		ArrayList<Sign> signList = d.getSignList();
//		System.out.println(signList);
		//signList.add(d.setSignList((d.getSignList).length);
		int result1 = sService.insertDtpaper(d);
		
		if(result1 > 0) { // 성공 => alert, 게시글 리스트페이지
			int result2 = sService.insertCooperation(c);
			if(result2 > 0) {
				int result3 = sService.insertCoSign(signList);
				if(result3 > 0) {
					session.setAttribute("alertMsg", "결재 신청 되었습니다.");
				}
			}
			return "redirect:sign/selectOutWork";
		}else { // 실패 => 에러문구, 에러페이지
			model.addAttribute("errorMsg", "결재 신청 실패.");
			return "common/errorPage";
		}
	}
//	임시저장
	@RequestMapping("saveVa.si")
	public String saveVacation(Dtpaper d, Vacation v, MultipartFile upfile, HttpSession session, Model model) {
		
		System.out.println(upfile);
		System.out.println(d);
		System.out.println(d.getSignList()); // ArrayList<Sign> 결재자리스
		System.out.println(v);
		if(!upfile.getOriginalFilename().equals("")) {
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/"); 
			
			d.setDpOrigin(upfile.getOriginalFilename());
			d.setDpChange(saveFilePath);
		}
			ArrayList<Sign> signList = d.getSignList();
			System.out.println(signList);
		int result1 = sService.saveDtpaper(d);
		
		if(result1 > 0) { // 성공 => alert, 게시글 리스트페이지
			int result2 = sService.insertVacation(v);
			if(result2 > 0 && signList != null) {
					int result3 = sService.insertVaSign(signList);
					if(result3 > 0) {
						session.setAttribute("alertMsg", "결재 신청 되었습니다.");
				}
			}
			return "redirect:sign/selectOutWork";
		}else { // 실패 => 에러문구, 에러페이지
			model.addAttribute("errorMsg", "결재 신청 실패.");
			return "common/errorPage";
		}
	}
	@RequestMapping("saveOt.si")
	public String saveOtwork(Dtpaper d, Otwork o, MultipartFile upfile, HttpSession session, Model model) {
		
		System.out.println(upfile);
		System.out.println(d);
		System.out.println(d.getSignList()); // ArrayList<Sign> 결재자리스
		System.out.println(o);
		if(!upfile.getOriginalFilename().equals("")) {
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/"); 
			
			d.setDpOrigin(upfile.getOriginalFilename());
			d.setDpChange(saveFilePath);
		}
		ArrayList<Sign> signList = d.getSignList();
		
		int result1 = sService.saveDtpaper(d);
		
		if(result1 > 0) { // 성공 => alert, 게시글 리스트페이지
			int result2 = sService.insertOtwork(o);
			if(result2 > 0 && signList != null) {
					int result3 = sService.insertOwSign(signList);
					if(result3 > 0) {
						session.setAttribute("alertMsg", "결재 신청 되었습니다.");
					}
			}
			return "redirect:sign/selectOutWork";
		}else { // 실패 => 에러문구, 에러페이지
			model.addAttribute("errorMsg", "결재 신청 실패.");
			return "common/errorPage";
		}
	}
	@RequestMapping("saveRe.si")
	public String saveReSign(Dtpaper d, ReSign r, MultipartFile upfile, HttpSession session, Model model) {
		
		System.out.println(upfile);
		System.out.println(d);
		System.out.println(d.getSignList()); // ArrayList<Sign> 결재자리스
		System.out.println(r);
		if(!upfile.getOriginalFilename().equals("")) {
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/"); 
			
			d.setDpOrigin(upfile.getOriginalFilename());
			d.setDpChange(saveFilePath);
		}
		ArrayList<Sign> signList = d.getSignList();
		
		int result1 = sService.saveDtpaper(d);
		
		if(result1 > 0) { // 성공 => alert, 게시글 리스트페이지
			int result2 = sService.insertReSignEmp(r);
			if(result2 > 0 && signList != null) {
				int result3 = sService.insertReSign(signList);
				if(result3 > 0) {
					session.setAttribute("alertMsg", "결재 신청 되었습니다.");
				}
			}
			return "redirect:sign/selectOutWork";
		}else { // 실패 => 에러문구, 에러페이지
			model.addAttribute("errorMsg", "결재 신청 실패.");
			return "common/errorPage";
		}
	}
	@RequestMapping("saveCo.si")
	public String saveCoop(Dtpaper d, Cooperation c, MultipartFile upfile, HttpSession session, Model model) {
		
		System.out.println(upfile);
		System.out.println(d);
		System.out.println(d.getSignList()); // ArrayList<Sign> 결재자리스
		System.out.println(c);
		if(!upfile.getOriginalFilename().equals("")) {
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/"); 
			
			d.setDpOrigin(upfile.getOriginalFilename());
			d.setDpChange(saveFilePath);
		}
		ArrayList<Sign> signList = d.getSignList();
		
		int result1 = sService.saveDtpaper(d);
		
		if(result1 > 0) { // 성공 => alert, 게시글 리스트페이지
			int result2 = sService.insertCooperation(c);
			if(result2 > 0 && signList != null) {
				int result3 = sService.insertCoSign(signList);
				if(result3 > 0) {
					session.setAttribute("alertMsg", "결재 신청 되었습니다.");
				}
			}
			return "redirect:sign/selectOutWork";
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
//	결재자주소록
	@RequestMapping("addressAdmin.si")
	public String addressAdminNotice() {
		return "sign/signAddressAdmin";
	}
//	기안서 상세보기
//	@RequestMapping("selectVa.si")
//	public ModelAndView selectVacation()

}
	