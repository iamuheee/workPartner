package com.wp.workpartner.sign.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.common.template.FileUpload;
import com.wp.workpartner.common.template.Pagination;
import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.mail.model.vo.Mail;
import com.wp.workpartner.sign.model.service.SignServiceImpl;
import com.wp.workpartner.sign.model.vo.Cooperation;
import com.wp.workpartner.sign.model.vo.Dtpaper;
import com.wp.workpartner.sign.model.vo.Otwork;
import com.wp.workpartner.sign.model.vo.ReSign;
import com.wp.workpartner.sign.model.vo.SelectCooperation;
import com.wp.workpartner.sign.model.vo.SelectOtwork;
import com.wp.workpartner.sign.model.vo.SelectReSign;
import com.wp.workpartner.sign.model.vo.SelectVacation;
import com.wp.workpartner.sign.model.vo.Sign;
import com.wp.workpartner.sign.model.vo.Vacation;

@Controller
public class SignController {
	
	@Autowired
	private SignServiceImpl sService;
	
//	결재자주소록
	@RequestMapping("addressAdmin.si")
	public String addressAdminNotice() {
		return "sign/selectSignList";
	}
	
	
//	-----------------------------------------------기안서 작성폼 ----------------------------------------------------------------------
	/**
	 * 기안서 작성폼
	 * @param model
	 * @return
	 */
	
	@RequestMapping("vaEnroll.si")
	public String vacationEnrollForm(Model model) {
		
		model.addAttribute("paperName", "연차");
		return "sign/vacationInsert";
	}
	@RequestMapping("reEnroll.si")
	public String reSignEmpEnrollForm(Model model) {
		model.addAttribute("paperName", "퇴직원");
		return "sign/reSignEmpInsert";
	}
	@RequestMapping("owEnroll.si")
	public String outworkEnrollForm(Model model) {
		model.addAttribute("paperName", "외근");
		return "sign/outWorkInsert";
	}
	@RequestMapping("coEnroll.si")
	public String coopEnrollForm(Model model) {
		model.addAttribute("paperName", "업무협조");
		return "sign/cooperationInsert";
	}
	
	
//	-----------------------------------------------기안서 insert 순서대로 연차, 외근, 퇴직원, 업무협조 ----------------------------------------------------------------------
	/**
	 * 공통으로 사용되는 mapper
	 * ArrayList<Sign> signList = d.getSignList();
	 * int 결재선리스트 반복분 돌려가며 저장 = sService.insertVaSign(signList);
	 * int 결재선 공통 항목 저장 = sService.insertDtpaper(d);
	 * 
	 * @param d
	 * @param v
	 * @param upfile
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("insertV.si")
	public String insertVacation(Dtpaper d, Vacation v, MultipartFile upfile, HttpSession session, Model model) {
		System.out.println(d);
		System.out.println(v);
		System.out.println(upfile);
		if(!upfile.getOriginalFilename().equals("")) {
			
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/"); 
			
			d.setDpOrigin(upfile.getOriginalFilename());
			d.setDpChange(saveFilePath);
		}
	
		ArrayList<Sign> signList = d.getSignList();
 
		int result1 = sService.insertDtpaper(d);
		System.out.println(result1);
		if(result1 > 0) { // 성공 => alert, 게시글 리스트페이지
			int result2 = sService.insertVacation(v);
			System.out.println(result2);
				if(result2 > 0) {
					int result3 = sService.insertVaSign(signList);
					if(result3 > 0) {
						System.out.println(result3);
						System.out.println("결재선 추가 성공");
					}
				}
				return "sign/successPage";
		}else { // 실패 => 에러문구, 에러페이지
			return "sign/errorPage";
		}
	}
	@RequestMapping("insertOw.si")
	public String insertOtWork(Dtpaper d, Otwork o, MultipartFile upfile, HttpSession session, Model model) {
		if(!upfile.getOriginalFilename().equals("")) {
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/"); 
			
			d.setDpOrigin(upfile.getOriginalFilename());
			d.setDpChange(saveFilePath);
		}
		ArrayList<Sign> signList = d.getSignList();
		int result1 = sService.insertDtpaper(d);
		
		if(result1 > 0) { // 성공 => alert, 게시글 리스트페이지
			int result2 = sService.insertOtwork(o);
				if(result2 > 0) {
					int result3 = sService.insertOwSign(signList);
					if(result3 > 0) {
						System.out.println("결재선 추가 성공");
					}
				}
				return "sign/successPage";
		}else { // 실패 => 에러문구, 에러페이지
			return "sign/errorPage";
		}
	}
	@RequestMapping("insertRe.si")
	public String insertReSignEmp(Dtpaper d, ReSign r, MultipartFile upfile, HttpSession session, Model model) {
		
		System.out.println(upfile);
		System.out.println(d);
		if(!upfile.getOriginalFilename().equals("")) {
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/"); 
			
			d.setDpOrigin(upfile.getOriginalFilename());
			d.setDpChange(saveFilePath);
		}
		ArrayList<Sign> signList = d.getSignList();
		int result1 = sService.insertDtpaper(d);
		
		if(result1 > 0) { // 성공 => alert, 게시글 리스트페이지
			int result2 = sService.insertReSignEmp(r);
			if(result2 > 0) {
				int result3 = sService.insertReSign(signList);
				if(result3 > 0) {
					System.out.println("결재선 추가 성공");
				}
			}
			return "sign/successPage";
		}else { // 실패 => 에러문구, 에러페이지
			return "sign/errorPage";
		}
	}
	@RequestMapping("insertCo.si")
	public String insertCooperation(Dtpaper d, Cooperation c, MultipartFile upfile, HttpSession session, Model model) {
		
		System.out.println(upfile);
		System.out.println(d);
		if(!upfile.getOriginalFilename().equals("")) {
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/"); 
			
			d.setDpOrigin(upfile.getOriginalFilename());
			d.setDpChange(saveFilePath);
		}
		ArrayList<Sign> signList = d.getSignList();
		
		int result1 = sService.insertDtpaper(d);
		
		if(result1 > 0) { // 성공 => alert, 게시글 리스트페이지
			int result2 = sService.insertCooperation(c);
			if(result2 > 0) {
				int result3 = sService.insertCoSign(signList);
				if(result3 > 0) {
					System.out.println("결재선 추가 성공");
				}
			}
			return "sign/successPage";
		}else { // 실패 => 에러문구, 에러페이지
			return "sign/errorPage";
		}
	}
	
	
//	-----------------------------------------------기안서 임시저장 insert 순서대로 연차, 외근, 퇴직원, 업무협조 ----------------------------------------------------------------------
	/**
	 * 기안하기와 insert기안서종류 insert기안서결재자 동일 saveDtpaper 다름
	 * @param d각 기안서 공통사용
	 * @param v o r c 각 기안서 명칭
	 * @param upfile 각 기안서 공통사용
	 * @param session 각 기안서 공통사용
	 * @param model 각 기안서 공통사용
	 * @return
	 */
	
//	임시저장
	@RequestMapping("saveVa.si")
	public String saveVacation(Dtpaper d,Vacation v, MultipartFile upfile, HttpSession session, Model model) {
		
		System.out.println(upfile);
		System.out.println(d);
		
//		파일업로드
		if(!upfile.getOriginalFilename().equals("")) {
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/"); 
			
			d.setDpOrigin(upfile.getOriginalFilename());
			d.setDpChange(saveFilePath);
		}
		
		
		ArrayList<Sign> signList = d.getSignList(); // 결재선 리스트 dtpaper signList에 담기
		int result1 = sService.saveDtpaper(d);
		
		if(result1 > 0) { // 성공 => alert, 게시글 리스트페이지
			int result2 = sService.insertVacation(v);
			if(result2 > 0 && signList != null) {
					int result3 = sService.insertVaSign(signList);
					if(result3 > 0) {
						System.out.println("결재선 추가 성공");
				}
			}
			return "sign/successPage";
		}else { // 실패 => 에러문구, 에러페이지
			model.addAttribute("errorMsg", "결재 신청 실패.");
			return "sign/errorPage";
		}
	}
	@RequestMapping("saveOt.si")
	public String saveOtwork(Dtpaper d ,Otwork o, MultipartFile upfile, HttpSession session, Model model) {
		
		System.out.println(upfile);
		System.out.println(d);
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
						System.out.println("결재선 추가 성공");
					}
			}
			return "sign/successPage";
		}else { // 실패 => 에러문구, 에러페이지
			return "sign/errorPage";
		}
	}
	@RequestMapping("saveRe.si")
	public String saveReSign(Dtpaper d ,ReSign r, MultipartFile upfile, HttpSession session, Model model) {
		
		System.out.println(upfile);
		System.out.println(d);
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
					System.out.println("결재선 추가 성공");
				}
			}
			return "sign/successPage";
		}else { // 실패 => 에러문구, 에러페이지
			return "sign/errorPage";
		}
	}
	@RequestMapping("saveCo.si")
	public String saveCoop(Dtpaper d, Cooperation c, MultipartFile upfile, HttpSession session, Model model) {
		
		System.out.println(upfile);
		System.out.println(d);
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
					System.out.println("결재선 추가 성공");
				}
			}
			return "sing/successPage";
		}else { // 실패 => 에러문구, 에러페이지
			return "sign/errorPage";
		}
	}
	
	
//	-----------------------------------------------기안서 상세보기 select 순서대로 연차, 외근, 퇴직원, 업무협조 ----------------------------------------------------------------------
	/**
	 * url = detailMy.si?no=?&ct=?
	 * selectXX(no) // no = dpNo
	 * @param mv
	 * @param model
	 * @param no
	 * @param ct
	 * @param st
	 * @return
	 */
	
//	기안서 상세보기
	@RequestMapping("detailMy.si")
	public ModelAndView selectDetailView(ModelAndView mv, Model model, int dpNo, String ct, String st) {
		ArrayList<Sign> selectSignList = sService.selectSignList(dpNo);
		Dtpaper titleList = sService.selectTitleList(dpNo);
		
		if(ct.equals("연차")) {
			model.addAttribute("flag", st);
			SelectVacation selectVa = sService.selectVa(dpNo);
			mv.addObject("selectSignList", selectSignList)
			.addObject("v", selectVa)
			.addObject("t", titleList)
			.setViewName("sign/vacationDetailView");
			
		}else if(ct.equals("외근")) {
			model.addAttribute("flag", st);
			SelectOtwork selectOw = sService.selectOw(dpNo);
			mv.addObject("selectSignList", selectSignList)
			.addObject("o", selectOw)
			.addObject("t", titleList)
			.setViewName("sign/outworkDetailView");
			
		}else if(ct.equals("퇴직원")) {
			model.addAttribute("flag", st);
			SelectReSign selectRe = sService.selectRe(dpNo);
			mv.addObject("selectSignList", selectSignList)
			.addObject("r", selectRe)
			.addObject("t", titleList)
			.setViewName("sign/reSignEmpDetailView");
			
		}else {
			model.addAttribute("flag", st);
			SelectCooperation selectCo = sService.selectCo(dpNo);
			mv.addObject("selectSignList", selectSignList)
			.addObject("c", selectCo)
			.addObject("t", titleList)
			.setViewName("sign/cooperationDetailView");
			
		}
		return mv;
	}
	
//	---------------------------------기안서 업데이트 update 순서대로 연차, 외근, 퇴직원, 업무협조 ----------------------------------------------------------------------
	
	@RequestMapping("updateForm.si")
	public ModelAndView updateForm(ModelAndView mv, Model model, int dpNo, String ct) {

		ArrayList<Sign> selectSignList = sService.selectSignList(dpNo);
			Dtpaper titleList = sService.selectTitleList(dpNo);
			
			if(ct.equals("연차")) {
				SelectVacation selectVa = sService.selectVa(dpNo);
				mv.addObject("selectSignList", selectSignList)
				.addObject("v", selectVa)
				.addObject("t", titleList)
				.setViewName("sign/vacationUpdateForm");
				
			}else if(ct.equals("외근")) {
				SelectOtwork selectOw = sService.selectOw(dpNo);
				mv.addObject("selectSignList", selectSignList)
				.addObject("o", selectOw)
				.addObject("t", titleList)
				.setViewName("sign/outworkUpdateForm");
				
			}else if(ct.equals("퇴직원")) {
				SelectReSign selectRe = sService.selectRe(dpNo);
				mv.addObject("selectSignList", selectSignList)
				.addObject("r", selectRe)
				.addObject("t", titleList)
				.setViewName("sign/reSignEmpUpdateForm");
				
			}else {
				SelectCooperation selectCo = sService.selectCo(dpNo);
				mv.addObject("selectSignList", selectSignList)
				.addObject("c", selectCo)
				.addObject("t", titleList)
				.setViewName("sign/cooperationUpdateForm");
			}
			return mv;
	}
	
	
//	------------------------ 기안서 진행중, 대기, 결재완료 update---------------------------------
	/**
	 * sign dtpaper = Dtpaper에 담겨있음
	 * ct = 해당 기안서 카테고리 연차=va 외근=ow 퇴직원=re 업무협조=co
	 * 
	 * @param d
	 * @param v
	 * @param o
	 * @param r
	 * @param c
	 * @param session
	 * @param reupfile
	 * @param ct
	 * @return 업데이트된 기안서 상세보기 페이지 detailMy.si?dpNo=?ct=?
	 */
	@RequestMapping(value="updateSi.si", produces="applicaton/json; charset=UTF-8", method=RequestMethod.POST)
	public String updateDtpaper(Dtpaper d, Vacation v, Otwork o, ReSign r, Cooperation c,  HttpSession session, MultipartFile reupfile, String ct) {
		System.out.println(d);
		System.out.println(v);
		System.out.println(o);
		System.out.println(r);
		System.out.println(c);
		System.out.println(ct);
		System.out.println(reupfile);
		
		if(!reupfile.getOriginalFilename().equals("")) {
			
			// 기존에 첨부파일이 있을 경우
			if(d.getDpOrigin() != null) {
				new File(session.getServletContext().getRealPath(d.getDpChange())).delete();
			}
			// 새로 넘어온 첨부파일 서버 업로드 시키기
			String saveFilePath = FileUpload.saveFile(reupfile, session, "resources/uploadFiles/");
			
			d.setDpOrigin(reupfile.getOriginalFilename());
			d.setDpChange(saveFilePath);
		}
		
		
		int dtpaper = sService.updateDt(d);
		System.out.println(dtpaper);
		if(dtpaper > 0) {
			System.out.println(dtpaper);
			if(ct.equals("연차")) {
				int updateVa = sService.updateVa(v);
			}else if(ct.equals("외근")) {
				int updateOw = sService.updateOw(o);
			}else if(ct.equals("퇴직원")) {
				int updateRe = sService.updateRe(r);
			}else {
				int updateCo = sService.updateCo(c);
			}
			
			return "sign/successPage" ;
		}else {
			return "sign/errorPage";
		}
	}
	
//	------------------------------------임시저장 update 결재선은 원래 데이터 삭제 후 다시 insert---------------------------
	@RequestMapping("updateRsi.si")
	public String updateReDtpaper(Dtpaper d, Vacation v, Otwork o, ReSign r, Cooperation c,  HttpSession session, MultipartFile reupfile, String ct) {
		int deleteSign = sService.deleteSign(d);
		
		
		if(!reupfile.getOriginalFilename().equals("")) {
			// 기존에 첨부파일이 있을 경우
			if(d.getDpOrigin() != null) {
				new File(session.getServletContext().getRealPath(d.getDpChange())).delete();
			}
			// 새로 넘어온 첨부파일 서버 업로드 시키기
			String saveFilePath = FileUpload.saveFile(reupfile, session, "resources/uploadFiles/");
			d.setDpOrigin(reupfile.getOriginalFilename());
			d.setDpChange(saveFilePath);
		}
		
		ArrayList<Sign> signList = d.getSignList();
		
		int insertSign = sService.updateSign(signList, d);
		
		if(insertSign > 0) {
			System.out.println(d.getDpFinal());
			int dtpaper = sService.updateDt(d);
				
			if(dtpaper > 0) {
					
				if(ct.equals("연차")) {
					
					int updateVa = sService.updateVa(v);
						
				}else if(ct.equals("외근")) {
					
					int updateOw = sService.updateOw(o);
					
				}else if(ct.equals("퇴직원")) {
					
					int updateRe = sService.updateRe(r);
						
				}else {
					
					int updateCo = sService.updateCo(c);
						
				}
					
			}
			
			return "sign/successPage";
		}else {
			return "sign/errorPage";
		}
	}
	
	
////	----------------------------------------반려됨 재작성 = 다시 인서트------------------------------
//	@RequestMapping("insertReVa.si")
//	public String insertVacation2(Dtpaper d, Vacation v, MultipartFile reupfile, HttpSession session, Model model) {
//
//		if(!reupfile.getOriginalFilename().equals("")) {
//			
//			// 기존에 첨부파일이 있을 경우
//			if(d.getDpOrigin() != null) {
//				new File(session.getServletContext().getRealPath(d.getDpChange())).delete();
//			}
//			// 새로 넘어온 첨부파일 서버 업로드 시키기
//			String saveFilePath = FileUpload.saveFile(reupfile, session, "resources/uploadFiles/");
//			
//			d.setDpOrigin(reupfile.getOriginalFilename());
//			d.setDpChange(saveFilePath);
//		}
//	
//		ArrayList<Sign> signList = d.getSignList();
// 
//		int result1 = sService.insertDtpaper(d);
//		
//		if(result1 > 0) { // 성공 => alert, 게시글 리스트페이지
//			int result2 = sService.insertVacation(v);
//				if(result2 > 0) {
//					int result3 = sService.updateSign(signList,d);
//					if(result3 > 0) {
//						session.setAttribute("alertSignMsg", "결재신청되었습니다.");
//					}
//				}
//				return "redirect:selectVa.si";
//		}else { // 실패 => 에러문구, 에러페이지
//			model.addAttribute("errorMsg", "결재 신청 실패.");
//			return "common/errorPage";
//		}
//	}
//	@RequestMapping("insertReOw.si")
//	public String insertOtWork2(Dtpaper d, Otwork o, MultipartFile reupfile, HttpSession session, Model model) {
//		if(!reupfile.getOriginalFilename().equals("")) {
//			
//			// 기존에 첨부파일이 있을 경우
//			if(d.getDpOrigin() != null) {
//				new File(session.getServletContext().getRealPath(d.getDpChange())).delete();
//			}
//			// 새로 넘어온 첨부파일 서버 업로드 시키기
//			String saveFilePath = FileUpload.saveFile(reupfile, session, "resources/uploadFiles/");
//			
//			d.setDpOrigin(reupfile.getOriginalFilename());
//			d.setDpChange(saveFilePath);
//		}
//		ArrayList<Sign> signList = d.getSignList();
//		int result1 = sService.insertDtpaper(d);
//		
//		if(result1 > 0) { // 성공 => alert, 게시글 리스트페이지
//			int result2 = sService.insertOtwork(o);
//				if(result2 > 0) {
//					int result3 = sService.updateSign(signList,d);
//					if(result3 > 0) {
//						session.setAttribute("alertSignMsg", "결재신청되었습니다.");
//					}
//				}
//				return "redirect:selectOutWork";
//		}else { // 실패 => 에러문구, 에러페이지
//			model.addAttribute("errorMsg", "결재 신청 실패.");
//			return "common/errorPage";
//		}
//	}
//	@RequestMapping("insertReRe.si")
//	public String insertReSignEmp2(Dtpaper d, ReSign r, MultipartFile reupfile, HttpSession session, Model model) {
//		System.out.println(reupfile);
//		System.out.println(d);
//		System.out.println(d.getSignList()); // ArrayList<Sign> 결재자리스
//		System.out.println(r);
//		if(!reupfile.getOriginalFilename().equals("")) {
//			
//			if(d.getDpOrigin() != null) {
//				new File(session.getServletContext().getRealPath(d.getDpChange())).delete();
//			}
//			String saveFilePath = FileUpload.saveFile(reupfile, session, "resources/uploadFiles/");
//			
//			d.setDpOrigin(reupfile.getOriginalFilename());
//			d.setDpChange(saveFilePath);
//		}
//		ArrayList<Sign> signList = d.getSignList();
//		int result1 = sService.insertDtpaper(d);
//		
//		if(result1 > 0) { // 성공 => alert, 게시글 리스트페이지
//			int result2 = sService.insertReSignEmp(r);
//			if(result2 > 0) {
//				int result3 = sService.updateSign(signList,d);
//				if(result3 > 0) {
//					session.setAttribute("alertSignMsg", "결재신청되었습니다.");
//				}
//			}
//			return "redirect:sign/selectOutWork";
//		}else { // 실패 => 에러문구, 에러페이지
//			model.addAttribute("errorMsg", "결재 신청 실패.");
//			return "common/errorPage";
//		}
//	}
//	@RequestMapping("insertReCo.si")
//	public String insertCooperation2(Dtpaper d, Cooperation c, MultipartFile reupfile, HttpSession session, Model model) {
//		System.out.println(reupfile);
//		System.out.println(d);
//		System.out.println(d.getSignList()); // ArrayList<Sign> 결재자리스
//		System.out.println(c);
//		if(!reupfile.getOriginalFilename().equals("")) {
//			
//			// 기존에 첨부파일이 있을 경우
//			if(d.getDpOrigin() != null) {
//				new File(session.getServletContext().getRealPath(d.getDpChange())).delete();
//			}
//			// 새로 넘어온 첨부파일 서버 업로드 시키기
//			String saveFilePath = FileUpload.saveFile(reupfile, session, "resources/uploadFiles/");
//			
//			d.setDpOrigin(reupfile.getOriginalFilename());
//			d.setDpChange(saveFilePath);
//		}
//		//int siAsign = d.getSignList().size();
//		//System.out.println(siAsign);
//		ArrayList<Sign> signList = d.getSignList();
////		System.out.println(signList);
//		//signList.add(d.setSignList((d.getSignList).length);
//		int result1 = sService.insertDtpaper(d);
//		
//		if(result1 > 0) { // 성공 => alert, 게시글 리스트페이지
//			int result2 = sService.insertCooperation(c);
//			if(result2 > 0) {
//				int result3 = sService.updateSign(signList ,d);
//				if(result3 > 0) {
//					session.setAttribute("alertSignMsg", "결재신청되었습니다.");
//				}
//			}
//			return "redirect:sign/selectOutWork";
//		}else { // 실패 => 에러문구, 에러페이지
//			model.addAttribute("errorMsg", "결재 신청 실패.");
//			return "common/errorPage";
//		}
//	}

	
//	---------------------------------리스트 조회---------------------------------------------
	// 임시저장
		@RequestMapping("saveSi.si")
		public ModelAndView selectSaveList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, Model model, String empNo, String fn, String st) {
			model.addAttribute("flag", "save");
			int saveListCount = sService.selectListCount(fn, empNo);
			PageInfo pi = Pagination.getPageInfo(saveListCount, currentPage, 5, 15);
			ArrayList<Dtpaper> saveList = sService.selectList(pi, empNo, fn);
			mv.addObject("pi",pi)
			.addObject("saveList",saveList)
			.setViewName("sign/dpaperSaveResignListView");
			return mv;
		}
		// 반려됨
		@RequestMapping("reSi.si")
		public ModelAndView selectReSignList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, Model model, String empNo, String fn, String st) {
			model.addAttribute("flag", "ReSign");
			int reSignListCount = sService.selectListCount(fn, empNo);
			PageInfo pi = Pagination.getPageInfo(reSignListCount, currentPage, 5, 15);
			ArrayList<Dtpaper> reSignList = sService.selectList(pi, empNo, fn);
			mv.addObject("pi",pi)
			.addObject("reSignList",reSignList)
			.setViewName("sign/dpaperSaveResignListView");
			return mv;
		}
		// 진행중
			@RequestMapping("contSi.si")
			public ModelAndView selectProgressList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, Model model, String empNo, String fn, String st) {
				model.addAttribute("flag", "continue");
				int contListCount = sService.selectProgressListCount(fn, empNo);
				PageInfo pi = Pagination.getPageInfo(contListCount, currentPage, 5, 15);
				ArrayList<Dtpaper> progressList = sService.selectProgressList(pi, empNo, fn);
				mv.addObject("pi",pi)
				.addObject("progressList", progressList)
				.setViewName("sign/dpaperContEndListView");
				return mv;
			}
		
		// 결재완료
		@RequestMapping("endSi.si")
		public ModelAndView selectEndSignList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, Model model, String empNo, String fn, String st) {
			model.addAttribute("flag", "end");
			int endListCount = sService.selectProgressListCount(fn, empNo);
			PageInfo pi = Pagination.getPageInfo(endListCount, currentPage, 5, 15);
			ArrayList<Dtpaper> endSignList = sService.selectProgressList(pi, empNo, fn);
			mv.addObject("pi",pi)
			.addObject("endSignList", endSignList)
			.setViewName("sign/dpaperContEndListView");
			return mv;
		}
		
//	-------------------------------타부서 결재함-----------------------------
//		타부서 결재 할 목록
		@RequestMapping("othSi.si")
		public ModelAndView selectOtherSignList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, Model model, String empNo, String depCd){
			model.addAttribute("flag", "otherSign");
			int othSignListCount = sService.selectOthSignListCount(empNo, depCd);
			PageInfo pi = Pagination.getPageInfo(othSignListCount, currentPage, 5, 15);
			ArrayList<Dtpaper> othSignList = sService.selectOthSignList(pi, empNo, depCd);
			mv.addObject("pi",pi)
			.addObject("othSignList", othSignList)
			.setViewName("sign/otherDeptSignListView");
			System.out.println(othSignList);
			return mv;
		}
//		타부서 결재완료 목록
		@RequestMapping("othEndSi.si")
		public ModelAndView selectEndOtherSignList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, Model model, String empNo, String depCd) {
			model.addAttribute("flag", "otherEndSign");
			System.out.println(depCd);
			System.out.println(empNo);
			int endOthSignListCount = sService.selectEndOthSignListCount(empNo, depCd);
			PageInfo pi = Pagination.getPageInfo(endOthSignListCount, currentPage, 5, 15);
			ArrayList<Dtpaper> endOthSignList = sService.selectEndOthSignList(pi, empNo, depCd);
			mv.addObject("pi",pi)
			.addObject("endOthSignList", endOthSignList)
			.setViewName("sign/otherDeptSignListView");
			System.out.println(endOthSignList);
			return mv;
		}
	
//---------------------------내 부서 결재함---------------------------------------------
//		내부서 결재 할 목록
		@RequestMapping("deptSi.si")
		public ModelAndView selectDeptSignList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, Model model, String empNo, String depCd){
			model.addAttribute("flag", "deptSign");
			int deptSignListCount = sService.selectDeptSignListCount(empNo, depCd);
			PageInfo pi = Pagination.getPageInfo(deptSignListCount, currentPage, 5, 15);
			ArrayList<Dtpaper> deptSignList = sService.selectDeptSignList(pi, empNo, depCd);
			mv.addObject("pi",pi)
			.addObject("deptSignList", deptSignList)
			.setViewName("sign/deptSignListView");
			System.out.println(deptSignList);
			return mv;
		}
//		내부서 결재완료 목록
		@RequestMapping("deptEndSi.si")
		public ModelAndView selectDeptEndSignList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, Model model, String empNo, String depCd) {
			model.addAttribute("flag", "deptEndSign");
			int endSignListCount = sService.selectEndSignListCount(empNo, depCd);
			PageInfo pi = Pagination.getPageInfo(endSignListCount, currentPage, 5, 15);
			ArrayList<Dtpaper> endDeptSignList = sService.selectEndSignList(pi, empNo, depCd);
			
			mv.addObject("pi",pi)
			.addObject("endDeptSignList", endDeptSignList)
			.setViewName("sign/deptSignListView");
			System.out.println(endDeptSignList);
			return mv;
		}
	
	
//-----------------------결재 승인 및 반려-----------------------------------------
//		결재 반려하기 = 현재 결재자 결재상태 = R 나머지 N
		
		@RequestMapping("disagreeSign.si")
		public String updateDisagreeSign(HttpSession session,Dtpaper d, Model model) {
			System.out.println(d);
			Employee loginUser = (Employee)session.getAttribute("loginUser");
			ArrayList<Sign> signList = d.getSignList();
			int result = 0;
			int result1 = 0;
//			int result2 = 0;
			for(Sign s : signList) {
				System.out.println(s.getSignEmpNo());
				System.out.println(loginUser.getEmpNo());
				if(s.getSignEmpNo().equals(loginUser.getEmpNo())) {
					 result = sService.updateDisagreeSign(s);
					 if(result > 0) {
						 result1 = sService.updateDisagreeDtpaper(s);
//						 if(s.getSiAsign() == 2 || s.getSiAsign() == 3) {
//							 if(s.getSiSeq()== 1 || s.getSiSeq() == 2) {
//								 if(s.getSiAsign() != s.getSiSeq()) {
//									 result2 = sService.updateDisagreeStatus(s);
//								 }
//							 }
//						 }
					 }
				}else {
					System.out.println("실패");
				}
			}
			System.out.println(result1);
			if(result1 > 0) {
				return "sign/successPage";
			}
			else {
				return "sign/errorPage";
			}
			
		}
//		결재 승인하기 현재 결재자 c -> y 다음결재자 n->c
		@RequestMapping("agreeSign.si")
		public String updateAgreeSign(HttpSession session,Dtpaper d, Model model) {
			System.out.println(d);
			System.out.println(d.getDpNo());
			System.out.println(d.getDpCategory());
			Employee loginUser = (Employee)session.getAttribute("loginUser");
			ArrayList<Sign> signList = d.getSignList();
			int result = 0;
			int result1 = 0;
			int result2 = 0;
			
			for(Sign s : signList) {
				System.out.println(s.getSignEmpNo());
				System.out.println(loginUser.getEmpNo());
				
				if(s.getSignEmpNo().equals(loginUser.getEmpNo())) {
					 result = sService.updateAgreeSign(s);
					 
					 if(result > 0) {
						 result1 = sService.updateAgreeDtpaper(s);
//						 if(s.getSiAsign() == 2 || s.getSiAsign() == 3) {
//							 if(s.getSiSeq()== 1 || s.getSiSeq() == 2) {
//								 if(s.getSiAsign() != s.getSiSeq()) {
//									 result2 = sService.updateAgreeSiStatus(s);
//								 }
//							 }
//						 }
						 if(s.getSiAsign() > 1 && s.getSiSeq() < s.getSiAsign()) { // 총결재자수가 다수일경우 
							 result2 = sService.updateAgreeSiStatus(s);
						 }
//						 if(s.getSiSeq() == s.getSiAsign() && cp.equals("연차")) { //최종결재경
//						 }
					 }
				}else {
					return "sign/errorPage";
				}
					
			}
				return "sign/successPage";
		}
	
		@RequestMapping("delete.si")
		public String deleteDtpaper(int dpNo ) {
			
			int result = sService.deleteDtpaper(dpNo);
			if(result > 0) {
				return "sign/successPage";
			}else {
				return "sign/errorPage";
			}
		}
		@ResponseBody
		@RequestMapping(value="mainSelectSign.si" , produces="applicaton/json; charset=utf-8")
		public String ajaxMainSignList(String empNo) {
			ArrayList<Dtpaper> list = sService.ajaxMainSignList(empNo);
			System.out.println(list);
			return new Gson().toJson(list);
		}
}
	