package com.wp.workpartner.mail.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.wp.workpartner.address.model.service.AddressService;
import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.mail.model.service.MailService;
import com.wp.workpartner.mail.model.vo.Signature;

@Controller
public class MailController {
	
	@Autowired
	private MailService mService;
	
	@Autowired
	private AddressService adService;
	
	//전체이메일리스트 조회 
	@RequestMapping("totalList.ma")
	public String listTotalEmail() {
		return "email/emailTotalListView";
	}
	
	//이메일 상세내역 요청
	@RequestMapping("detail.ma")
	public String DetailEmail() {
		return "email/emailDetailView";
	}
	
	//답장하기
	@RequestMapping("reply.ma")
	public String replyEmail() {
		return "email/emailReplyForm";
	}
	
	//메일쓰기
	@RequestMapping("insert.ma")
	public String insertEmailWrite() {
		return "email/emailInsertForm";
	}
	
	//전달하기
	@RequestMapping("forward.ma")
	public String forwardEmail() {
		return "email/emailForwardView";
	}
	
	//중요메일함
	@RequestMapping("starList.ma")
	public String starEmailList() {
		return "email/starMailListView";
	}
	
	//받는메일함
	@RequestMapping("receiveList.ma")
	public String receiveEmailList() {
		return "email/emailReceiveListView";
	}
	
	//보낸메일함
	@RequestMapping("sendList.ma")
	public String sendEmailList() {
		return "email/emailSendListView";
	}
	
	//휴지통
	@RequestMapping("bin.ma")
	public String binEmailList() {
		return "email/emailBinListView";
	}
	
	//주소록>메일보내기
	@RequestMapping("selectEmail.ma")
	public String selectEmailForm() {
		return "email/emailSelectForm";
	}
	
	
	/** 서명설정페이지 이동	 
	 */
	@RequestMapping("sig.ma")
	public String emailSignature() {				
		return "email/emailSignature";
	}
	
	/** 등록한 서명 조회
	 * @param empNo 사번
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectSigList.ma", produces="application/json; charset=utf-8")
	public String emailSignatureList(String empNo) {
		ArrayList<Signature> list = mService.selectSigList(empNo);		
		return new Gson().toJson(list);		
	}
	
	/** 서명삭제 , 기본 설정된 서명이 없을 경우 맨 앞에 있는 rnum=1이 기본서명이 되도록 할 것
	 * @param sigNo 서명번호
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="deleteSig.ma") 
	public String deleteSig(String sigNo, String empNo) {
		System.out.println(sigNo +" " + empNo);
		int result2=1;
		// 삭제
		int result1 = mService.deleteSig(sigNo);	
		System.out.println(result1);
		// 기본설정 조회
		//Signature s = mService.selectSigBasic(empNo);
		int count = mService.selectBasicCount(empNo);
		if(count == 0) {
			result2 =  mService.updateBasic(empNo);
			System.out.println(result2);
		
		}
		
		return (result1*result2) > 0 ? "success" : "fail";
	 }
	
	/** 서명 모달창에 입력 될 사원 정보조회
	 * @param empNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectSigEmp.ma", produces="application/json; charset=utf-8")
	public String selectSigEmp(String empNo) {
		Employee emp = adService.selectDetailEmp(empNo);
		return new Gson().toJson(emp);
	}
	
	/** 서명등록
	 * @param s
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("insertSig.ma")
	public String insertSig(Signature s, HttpSession session, Model model) {
		
		int result = mService.insertSig(s);
		
		if(result > 0) {
			// alert문구 담아서 기존에 보던 상세페이지
			session.setAttribute("alertMsg", "서명등록되었습니다.");
			
			return "redirect:sig.ma";			
			
		}else {
			// 에러문구 담아서 에러페이지
			model.addAttribute("errorMsg", "서명등록 실패");
			return "common/error";
		}
		
	}
	
	
	
	 
}
