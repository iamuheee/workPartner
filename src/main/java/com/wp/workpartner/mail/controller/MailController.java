package com.wp.workpartner.mail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wp.workpartner.mail.model.service.MailService;

@Controller
public class MailController {
	
	@Autowired
	private MailService mService;
	
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
	
	//서명설정
	@RequestMapping("sig.ma")
	public String emailSignatureList() {
		return "email/emailSignature";
	}
}
