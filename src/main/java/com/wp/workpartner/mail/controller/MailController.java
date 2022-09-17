package com.wp.workpartner.mail.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.wp.workpartner.address.model.service.AddressService;
import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.common.template.FileUpload;
import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.mail.model.service.MailService;
import com.wp.workpartner.mail.model.vo.Mail;
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
	public String selectEmailForm(String email, Model model) {
		model.addAttribute("email", email);
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
		//System.out.println(sigNo +" " + empNo);
		int result2=1;
		// 삭제
		int result1 = mService.deleteSig(sigNo);	
		//System.out.println(result1);
		// 기본설정 조회
		//Signature s = mService.selectSigBasic(empNo);
		int count = mService.selectBasicCount(empNo);
		if(count == 0) {
			result2 =  mService.updateBasic(empNo);
			//System.out.println(result2);
		
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
	
	/** 서명설정
	 * @param s
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("sigManage.ma")
	public String updateSigManage(Signature s, Employee e, HttpSession session, Model model) {
		//System.out.println(s);
		//System.out.println(e);		
		// 1. 직원테이블 => empSigUse
		int result1 = mService.updateSigUseManage(e);
		// 2-1. 서명테이블 => sigBasic설정 > 우선 모든 서명들 basic=n
		int result2= mService.updateSigBasicNo(s);
		// 2-2. 사용자가 설정한 sigNo만 Y
		int result3 = mService.updateSigBasicManage(s);
		
		if((result1*result2*result3) > 0) {
			// alert문구 담아서 기존에 보던 상세페이지
			session.setAttribute("alertMsg", "설정이 완료되었습니다.");
			
			return "redirect:sig.ma";			
			
		}else {
			// 에러문구 담아서 에러페이지
			model.addAttribute("errorMsg", "서명설정 실패");
			return "common/error";
		}
		
	}
	
	
	/** 메일쓰기form 이동
	 * @return
	 */
	@RequestMapping("insert.ma")
	public String insertEmailForm() {
		return "email/emailInsertForm";
	}
	
	/** 메일쓰기 > 사용자가 등록한 서명리스트, 서명사용여부
	 * @param empNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="sigList.ma", produces="application/json; charset=utf-8")
	public String sigListEmail(String empNo) {
		
		// 1. 등록한 서명리스트
		ArrayList<Signature> list = mService.selectSigList(empNo);	
		// 2. 설정한 서명사용여부 
		Employee emp = adService.selectDetailEmp(empNo);
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list", list);
		hm.put("emp", emp);
		return new Gson().toJson(hm);
	
	}
	
	/** 메일쓰기
	 * @param mail 메일내용
	 * @param upfile 첨부파일
	 * @param session 
	 * @param model
	 * @return 다시 메일쓰기 폼으로 이동
	 */
	@RequestMapping("insertWrite.ma")
	public String insertMail(Mail mail, MultipartFile[] upfile, HttpSession session, Model model) {
		
		//System.out.println(upfile);
		//System.out.println(mail); => 받은 사람 이메일name => 여러개의 input으로 넘어왔을때 , 콤마로 여며진걸 확인 할 수 있었음
		
		// 1. 순서상 실제로 넘어온 upfile 들 중에 실제 첨부파일이 담긴게 있는지 => 있다면 setMailFile에 Y를 담고 => 우선 mail먼저 insert(file테이블에는 mail_no필요)
		for(int i=0; i<upfile.length; i++) {					
			if(!upfile[i].getOriginalFilename().equals("")) {								
				mail.setMailFile("Y");									
			 }
		}		
		int result = mService.insertMail(mail);
		
		// 2. tb_mail_status
					
		// 2-1 받는사람입장
		String[] mailRecipients = mail.getMailRecipient().split(",");
		int result1 = mService.insertMailStatusRev(mailRecipients);
		
		int result2 =1;
		// 2-2 cc입장
		if(mail.getMailCC() != null) {
			String[] mailCCs = mail.getMailCC().split(",");
			result2 = mService.insertMailStatusCC(mailCCs);			
		}
		// 2-3 보낸사람입장
		int result3 = mService.insertMailStatusSen();
			
		//파일 등록
		int result4 = 1;
		/*
		 * ** 만일 다중파일 업로드시에는?
		 *    여러개의 input type="file"요소에 다 동일한 키값으로 부여(name ="upfile")
		 *    MultipartFile[] upfile 로(배열로) 받으면 됨.(0번 인덱스부터 차곡차곡 첨부파일 객체 담겨있음)
		 *    반복문 돌려가면서 FileUpload.saveFile 메소드 호출시 해당 MultipartFile하나씩 넘기기
		 */
		
		for(int i=0; i<upfile.length; i++) {
			
			// MultipartFile=> root-context.xml에서 관련 라이브러리 dependency 해주면
			// 라이브러리 등록 후엔 파일 넘어온게 있든 없든 MultipartFile객체를 주입시켜줌
			// => 전달된 파일 있는지 => null로하면 안됨!!!(객체가 있으니까) 
			// => *** 빈 문자열과 비교
			if(!upfile[i].getOriginalFilename().equals("")) {
				
				// FileUpload 클래스의 saveFile은 static 메소드로 만들었기때문에 서버시작시 바로 메모리에 있음. 생성없이 바로 호출
				// saveFilePath = 파일명수정 + 저장경로까지
				String saveFilePath = FileUpload.saveFile(upfile[i], session, "resources/uploadFiles/");
				// file 객체에 전달 => file 객체에 originName, changeName, filePath가 담겨옴
				File file = File.uploadFile(upfile[i], saveFilePath);
				
				result4 = mService.insertMailFile(file);
			 }
		}
		
		//System.out.println(result1 + " " +result2 + " " +result3 + " " +result4);
		
		if(result1 * result2 * result3 * result4 > 0) {
			session.setAttribute("alertMsg", "메일보내기 성공!");
			return "redirect:totalList.ma";
		}else {
			model.addAttribute("errorMsg", "메일보내기 실패");
			return "common/error";
		}
			
	}
	
	
	
	
	
	 
}
