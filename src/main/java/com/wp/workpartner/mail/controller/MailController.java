package com.wp.workpartner.mail.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.wp.workpartner.address.model.service.AddressService;
import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.common.template.FileUpload;
import com.wp.workpartner.common.template.Pagination;
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
		Signature s = mService.selectSigBasic(empNo);
		int count = mService.selectBasicCount(empNo);
		// 기본설정된 서명이 없으면서 + 등록된 유효한 서명이 있을때 맨 첨에 있는 서명을 기본서명으로 설정해주기 
		int sinYCount = mService.selectSigYCount(empNo);
		if(count == 0 && sinYCount > 0) {
			result2 =  mService.updateBasic(empNo);
			System.out.println(result2);		
		}
		
		return (result1 * result2) > 0 ? "success" : "fail";
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
		
		// 만약 사용안함 + 등록한 서명이 없다면 ? s는 오는데 sigNo = null로 올것임 (s에 empNo만 담겨왔음)
		int result2 = 1;
		int result3 = 1;
		
		if(s.getSigNo() != null) {
			// 2-1. 서명테이블 => sigBasic설정 > 우선 모든 서명들 basic=n
			result2= mService.updateSigBasicNo(s);
			// 2-2. 사용자가 설정한 sigNo만 Y
			result3 = mService.updateSigBasicManage(s);
		}
				
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
	 * @return 전체메일함 목록으로 이동
	 */
	@RequestMapping("insertWrite.ma")
	public String insertMail(Mail mail, MultipartFile[] upfile, HttpSession session, Model model) {
		
		//System.out.println(upfile);
		//System.out.println(mail); => 받은 사람 이메일name => 여러개의 input으로 넘어왔을때 , 콤마로 여며진걸 확인 할 수 있었음
		if(mail.getMailImportant() == null) {
			mail.setMailImportant("N");
		};
		if(mail.getMailSecurity() == null) {
			mail.setMailSecurity("N");
		}
		if(mail.getMailFile() == null) {
			mail.setMailFile("N");
		}
		
		// 1. 순서상 실제로 넘어온 upfile 들 중에 실제 첨부파일이 담긴게 있는지 => 있다면 setMailFile에 Y를 담고 => 우선 mail먼저 insert(file테이블에는 mail_no필요)
		for(int i=0; i<upfile.length; i++) {					
			if(!upfile[i].getOriginalFilename().equals("")) {								
				mail.setMailFile("Y");									
			 }
		}		
		//System.out.println(mail);
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
	

	/** 전체메일함 이동
	 * @return
	 */
	@RequestMapping("totalList.ma")
	public String listTotalEmail() {
		return "email/emailTotalListView";
	}
	
	/** 전체메일함 조회
	 * @param email 식별자로서의 이메일(로그인한 유저의 이메일)
	 * @param currentPage 현재페이지
	 * @param searchCategory 검색종류
	 * @param keyword 검색어
	 * @param filter 기간
	 * @param orderEmail 순서
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectTotal.ma", produces="applicaton/json; charset=utf-8")
	public String  ajaxSelectTotalList(String email, @RequestParam(value="cpage", defaultValue="1")int currentPage,
				String searchCategory, String keyword, String filter, String orderEmail) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("email", email);
		map.put("searchCategory", searchCategory);
		map.put("keyword", keyword);
		map.put("filter", filter);
		map.put("orderEmail", orderEmail);
		
		int listCount = mService.selectListTotalCount(map);
			
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 8);				
		ArrayList<Mail> list = mService.selectListTotal(map, pi);		
						
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list", list);
		hm.put("pi", pi);
		
		return new Gson().toJson(hm);	
		
	}
	
	/** 전체메일함 다중선택 > 삭제 (휴지통)
	 * @param arr
	 */
	@ResponseBody
	@RequestMapping("deleteEmailGroup.ma")
	public String ajaxDeleteEmailGroup(String[] arr) {
		
		// ["66/xxxx@gmail.com/S", "", "", ...]
		
		// 첨에 // ["66,xxxx@gmail.com,S", "", "", ...]
		// ,콤마로 여몄는데 하나만 선택시 66만 나옴 => ,로 1차로 쪼개고  ,로 2차로 쪼개니까  66을 하나를 arr로 보고 그랬던거 같음
		//=> 그래서 회사에선 db에 여러개의 값 넣을때 |또는 / 를 쓰기도 함 (,는 대중적으로 많이 쓰여서 이런경우가 생기니까)
		
		ArrayList<Mail> list = new ArrayList<>();
		
		// String[] arr을 for문으로 => "gg/xxxx@gamil.com/s"   ""   ""   이렇게 순서대로 접근해서 
		for(String s : arr) {
			
			String[] mArr = s.split("/"); // ["66/xxxx@gmail.com/S"]; => 애를 쪼개기
			
			//System.out.println(mArr[0]);
			//System.out.println(mArr[1]);
			//System.out.println(mArr[2]);
			// 각각을 mail객체에 담기
			Mail m = new Mail();
			m.setMailNo(mArr[0]);
			m.setMailEmail( mArr[1] ); // => 받은사람일 경우 null이여야하는데 undefined로 문자열임 => sql에서 조건처리 
			m.setMailCategory(mArr[2]);
			
			list.add(m);
			
		}
		
				
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);		
		int result = mService.deleteEmailGroup(map);
		
		// pl로 한 sql문은 처리된 행수를 반환하지않는다 => 그러므로 -1나옴 => jsp에서 if(result>0)인경우 라는 조건을 없앰
		return result > 0 ? "success" : "fail";	
		
	}
	
	
	/** 이메일 상세내역 요청 
	 * @param no 메일번호
	 * @param mailEmail tb_mail_status 식별할수 있는 받는사람 이메일
	 * @param mv mail, file 정보
	 * @return
	 */
	@RequestMapping("detail.ma")
	public ModelAndView DetailEmail(String no, String mailEmail, ModelAndView mv) {
		
		//1. mail_status => mail_read ='Y'
		HashMap<String, Object> map = new HashMap<>();
		map.put("mailNo", no);
		map.put("mailEmail", mailEmail);
		int result1 =  mService.mailReadUpdate(map);
		
		// 2. mail 조회
		Mail m = mService.selectMailDetail(no);
		
		// 3. file 조회
		ArrayList<File> list = mService.selectFileDetail(no);
				
		mv.addObject("m", m).addObject("list", list).setViewName("email/emailDetailView");
		
		//System.out.println(m);
		
		return mv;
	}
			
	/** 메일전달하기
	 * @param mailNo 메일번호
	 * @param mv
	 * @return
	 */
	@RequestMapping("forward.ma")
	public ModelAndView forwardEmail(String mailNo, ModelAndView mv) {
		
		// 1. mail 조회
		Mail m = mService.selectMailDetail(mailNo);
		
		// 2. file 조회
		ArrayList<File> list = mService.selectFileDetail(mailNo);
				
		mv.addObject("m", m).addObject("list", list).setViewName("email/emailForwardView");
		//System.out.println(m);		
		return mv;
	}
	
	
	/** 메일 답장하기
	 * @param mailNo 메일번호
	 * @param mv
	 * @return
	 */
	@RequestMapping("reply.ma")
	public ModelAndView replyEmail(String mailNo, ModelAndView mv) {
		
		// mail 조회
		Mail m = mService.selectMailDetail(mailNo);
		mv.addObject("m", m).setViewName("email/emailReplyForm");
		return mv;
	}
	
	
	
	/** 받은메일함 조회
	 * @param email 식별자로서의 이메일(로그인한 유저의 이메일)
	 * @param currentPage 현재페이지
	 * @param searchCategory 검색종류
	 * @param keyword 검색어
	 * @param filter 기간
	 * @param orderEmail 순서
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectReceive.ma", produces="applicaton/json; charset=utf-8")
	public String  ajaxSelectReceiveList(String email, @RequestParam(value="cpage", defaultValue="1")int currentPage,
				String searchCategory, String keyword, String filter, String orderEmail) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("email", email);
		map.put("searchCategory", searchCategory);
		map.put("keyword", keyword);
		map.put("filter", filter);
		map.put("orderEmail", orderEmail);
		
		int listCount = mService.selectListReceiveCount(map);
			
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 8);				
		ArrayList<Mail> list = mService.selectListReceive(map, pi);		
						
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list", list);
		hm.put("pi", pi);
		
		return new Gson().toJson(hm);	
		
	}
	
	/** 보낸메일함 조회
	 * @param email 식별자로서의 이메일(로그인한 유저의 이메일)
	 * @param currentPage 현재페이지
	 * @param searchCategory 검색종류
	 * @param keyword 검색어
	 * @param filter 기간
	 * @param orderEmail 순서
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectSend.ma", produces="applicaton/json; charset=utf-8")
	public String  ajaxSelectSendList(String email, @RequestParam(value="cpage", defaultValue="1")int currentPage,
				String searchCategory, String keyword, String filter, String orderEmail) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("email", email);
		map.put("searchCategory", searchCategory);
		map.put("keyword", keyword);
		map.put("filter", filter);
		map.put("orderEmail", orderEmail);
		
		int listCount = mService.selectListSendCount(map);
			
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 8);				
		ArrayList<Mail> list = mService.selectListSend(map, pi);		
						
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list", list);
		hm.put("pi", pi);
		
		return new Gson().toJson(hm);	
		
	}
	
	/** 휴지통 조회
	 * @param email 식별자로서의 이메일(로그인한 유저의 이메일)
	 * @param currentPage 현재페이지
	 * @param searchCategory 검색종류
	 * @param keyword 검색어
	 * @param filter 기간
	 * @param orderEmail 순서
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectBin.ma", produces="applicaton/json; charset=utf-8")
	public String  ajaxSelectBinList(String email, @RequestParam(value="cpage", defaultValue="1")int currentPage,
				String searchCategory, String keyword, String filter, String orderEmail) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("email", email);
		map.put("searchCategory", searchCategory);
		map.put("keyword", keyword);
		map.put("filter", filter);
		map.put("orderEmail", orderEmail);
		
		int listCount = mService.selectListBinCount(map);
			
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 8);				
		ArrayList<Mail> list = mService.selectListBin(map, pi);		
						
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list", list);
		hm.put("pi", pi);
		
		return new Gson().toJson(hm);	
		
	}
	
	/** 중요메일함 조회
	 * @param email 식별자로서의 이메일(로그인한 유저의 이메일)
	 * @param currentPage 현재페이지
	 * @param searchCategory 검색종류
	 * @param keyword 검색어
	 * @param filter 기간
	 * @param orderEmail 순서
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectStar.ma", produces="applicaton/json; charset=utf-8")
	public String  ajaxSelectStarList(String email, @RequestParam(value="cpage", defaultValue="1")int currentPage,
				String searchCategory, String keyword, String filter, String orderEmail) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("email", email);
		map.put("searchCategory", searchCategory);
		map.put("keyword", keyword);
		map.put("filter", filter);
		map.put("orderEmail", orderEmail);
		
		int listCount = mService.selectListStarCount(map);
			
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 8);				
		ArrayList<Mail> list = mService.selectListStar(map, pi);		
						
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list", list);
		hm.put("pi", pi);
		
		return new Gson().toJson(hm);	
		
	}
	
	/** 전달용 메일쓰기
	 * @param mail 메일내용
	 * @param upfile 첨부파일
	 * @param session 
	 * @param model
	 * @return 전체메일함 목록으로 이동
	 */
	@RequestMapping("insertForward.ma")
	public String insertForward(Mail mail, MultipartFile[] upfile, HttpSession session, Model model) {
		
		//System.out.println(mail);// => 받은 사람 이메일name => 여러개의 input으로 넘어왔을때 , 콤마로 여며진걸 확인 할 수 있었음
		
		// 1. 순서상 실제로 넘어온 upfile 들 중에 실제 첨부파일이 담긴게 있는지 => 있다면 setMailFile에 Y를 담고 => 우선 mail먼저 insert(file테이블에는 mail_no필요)
		// 우선 null안들어가도록 조건처리
		if(mail.getMailImportant() == null) {
			mail.setMailImportant("N");
		};
		if(mail.getMailSecurity() == null) {
			mail.setMailSecurity("N");
		}
		if(mail.getMailFile() == null) {
			mail.setMailFile("N");
		}
		// 그다음 실제 파일담겨있거나, 기존의 저장된 파일이 있는상태로 전달시 Y로
		for(int i=0; i<upfile.length; i++) {					
			if(!upfile[i].getOriginalFilename().equals("")) {								
				mail.setMailFile("Y");									
			 }
		};
		
		if(mail.getFileList() != null) {
			ArrayList<File> fileList = mail.getFileList();
			for(File file : fileList) {
				//System.out.println(file);				
				// 기존의 file을 삭제하게되면 ArrayList에서 지워지지않고 file의 fileOriginName, 등등이 그대로 넘어와 null예외됨 
				if(file.getFileOriginName() != null) {
					mail.setMailFile("Y");	
				}
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
			
		// 전달받은 파일
		int result5 =1;
		//System.out.println(mail.getFileList());
		if(mail.getFileList() != null) {
			ArrayList<File> fileList = mail.getFileList();
			for(File file : fileList) {
				//System.out.println(file);
				
				// 기존의 file을 삭제하게되면 ArrayList에서 지워지지않고 file의 fileOriginName, 등등이 그대로 넘어와 null예외됨 
				if(file.getFileOriginName() != null) {
					mService.insertForwordFile(file);
				}
			}
		}
						
		//파일 등록 => 새로 추가한 파일 
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
		
		if(result1 * result2 * result3 * result4 * result5 > 0) {
			session.setAttribute("alertMsg", "메일보내기 성공!");
			return "redirect:totalList.ma";
		}else {
			model.addAttribute("errorMsg", "메일보내기 실패");
			return "common/error";
		}
		
	}
	
	/** 메일함 다중선택 > 읽음 
	 * @param arr : 메일번호, 받은사람이메일, 메일종류(S:보낸메일/R:받은/C:참조된)
	 */
	@ResponseBody
	@RequestMapping("readEmailGroup.ma")
	public String ajaxReadEmailGroup(String[] arr) {
		
		ArrayList<Mail> list = new ArrayList<>();
					
		for(String s : arr) {
			
			String[] mArr = s.split("/"); // ["66", "xxxx@gmail.com", "S"]; => 얘를 쪼개기
						
			// 각각을 mail객체에 담기
			Mail m = new Mail();
			m.setMailNo(mArr[0]);
			m.setMailEmail( mArr[1] ); // => 받은사람일 경우 null이여야하는데 undefined로 문자열임 => sql에서 조건처리 
			m.setMailCategory(mArr[2]);
			
			// mail객체를 list에 담기 
			list.add(m);			
		}
		
		// map에 담기
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);		
		int result = mService.readEmailGroup(map);
		
		// pl/sql로 한 sql문은 처리된 행수를 반환하지않는다 => 그러므로 -1나옴 => jsp에서 if(result>0)인경우 라는 조건을 없앰
		return result > 0 ? "success" : "fail";	
		
	}
	
	/** 메일함 다중선택 > 중요메일함IN 
	 * @param arr : 메일번호, 받은사람이메일, 메일종류(S:보낸메일/R:받은/C:참조된)
	 */
	@ResponseBody
	@RequestMapping("starOnEmailGroup.ma")
	public String ajaxStarOnEmailGroup(String[] arr) {
		
		ArrayList<Mail> list = new ArrayList<>();
					
		for(String s : arr) {
			
			String[] mArr = s.split("/"); 
						
			// 각각을 mail객체에 담기
			Mail m = new Mail();
			m.setMailNo(mArr[0]);
			m.setMailEmail( mArr[1] ); // => 받은사람일 경우 null이여야하는데 undefined로 문자열임 => sql에서 조건처리 
			m.setMailCategory(mArr[2]);
			
			// mail객체를 list에 담기 
			list.add(m);						
		}		
		// map에 담기
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);		
		int result = mService.starOnEmailGroup(map);
		
		// pl/sql로 한 sql문은 처리된 행수를 반환하지않는다 => 그러므로 -1나옴 => jsp에서 if(result>0)인경우 라는 조건을 없앰
		return result > 0 ? "success" : "fail";	
		
	}
	
	/** 메일함 다중선택 > 중요메일함OUT
	 * @param arr : 메일번호, 받은사람이메일, 메일종류(S:보낸메일/R:받은/C:참조된)
	 */
	@ResponseBody
	@RequestMapping("starOffEmailGroup.ma")
	public String ajaxStarOffEmailGroup(String[] arr) {
		
		ArrayList<Mail> list = new ArrayList<>();
					
		for(String s : arr) {
			
			String[] mArr = s.split("/"); 
						
			// 각각을 mail객체에 담기
			Mail m = new Mail();
			m.setMailNo(mArr[0]);
			m.setMailEmail( mArr[1] ); // => 받은사람일 경우 null이여야하는데 undefined로 문자열임 => sql에서 조건처리 
			m.setMailCategory(mArr[2]);
			
			// mail객체를 list에 담기 
			list.add(m);						
		}		
		// map에 담기
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);		
		int result = mService.starOffEmailGroup(map);
		
		// pl/sql로 한 sql문은 처리된 행수를 반환하지않는다 => 그러므로 -1나옴 => jsp에서 if(result>0)인경우 라는 조건을 없앰
		return result > 0 ? "success" : "fail";	
		
	}
	
	/** 휴지통 다중선택 > 완전삭제
	 * @param arr : 메일번호, 받은사람이메일, 메일종류(S:보낸메일/R:받은/C:참조된)
	 */
	@ResponseBody
	@RequestMapping("deleteFix.ma")
	public String ajaxDeleteFix(String[] arr) {
		
		ArrayList<Mail> list = new ArrayList<>();
					
		for(String s : arr) {
			
			String[] mArr = s.split("/"); 
						
			// 각각을 mail객체에 담기
			Mail m = new Mail();
			m.setMailNo(mArr[0]);                                    // String[] 문자열로 받았으니까  
			m.setMailEmail( mArr[1] ); // => 받은사람일 경우 null이여야하는데 undefined로 문자열임 => sql에서 조건처리 
			m.setMailCategory(mArr[2]);
			
			// mail객체를 list에 담기 
			list.add(m);						
		}		
		// map에 담기
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);		
		int result = mService.deleteFix(map);
		
		// pl/sql로 한 sql문은 처리된 행수를 반환하지않는다 => 그러므로 -1나옴 => jsp에서 if(result>0)인경우 라는 조건을 없앰
		return result > 0 ? "success" : "fail";	
		
	}
	
	/** 휴지통 다중선택 > 복구
	 * @param arr : 메일번호, 받은사람이메일, 메일종류(S:보낸메일/R:받은/C:참조된)
	 */
	@ResponseBody
	@RequestMapping("updateMailY.ma")
	public String ajaxUpdateMailY(String[] arr) {
		
		ArrayList<Mail> list = new ArrayList<>();
					
		for(String s : arr) {
			
			String[] mArr = s.split("/"); 
						
			// 각각을 mail객체에 담기
			Mail m = new Mail();
			m.setMailNo(mArr[0]);                                    // String[] 문자열로 받았으니까  
			m.setMailEmail( mArr[1] ); // => 받은사람일 경우 null이여야하는데 undefined로 문자열임 => sql에서 조건처리 
			m.setMailCategory(mArr[2]);
			
			// mail객체를 list에 담기 
			list.add(m);						
		}		
		// map에 담기
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);		
		int result = mService.updateMailY(map);
		
		// pl/sql로 한 sql문은 처리된 행수를 반환하지않는다 => 그러므로 -1나옴 => jsp에서 if(result>0)인경우 라는 조건을 없앰
		return result > 0 ? "success" : "fail";	
		
	}
	
	/** 메인페이지 받은메일 + 최신 top 5
	 * @param email
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectMainTopEmail.ma" , produces="applicaton/json; charset=utf-8")
	public String ajaxMainTopEmailList(String email) {
		ArrayList<Mail> list = mService.mainTopEmailList(email);
		return new Gson().toJson(list);
	}
	
	
	
	 
}
