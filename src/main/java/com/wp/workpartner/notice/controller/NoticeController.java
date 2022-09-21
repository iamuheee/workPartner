package com.wp.workpartner.notice.controller;

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
import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.common.template.FileUpload;
import com.wp.workpartner.common.template.Pagination;
import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.notice.model.service.NoticeService;
import com.wp.workpartner.notice.model.vo.Notice;

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
	
	/** 공지사항 상세내용
	 * @param no 공지사항 번호
	 * @param mv
	 * @return
	 */
	@RequestMapping("detail.nt")
	public ModelAndView detailNotice(String no, ModelAndView mv){
		String noticeNo = no;
		//System.out.println(noticeNo);
		// 1. count + 1
		int result = ntService.increaseCount(noticeNo);
		
		//System.out.println(result);
		
		if(result>0) {
			// 2. notice 조회
			Notice n = ntService.selectDetailNotice(noticeNo);
			// 3. file 조회
			ArrayList<File> list = ntService.selectFileDetail(noticeNo);
			
			mv.addObject("n", n).addObject("list", list).setViewName("notice/noticeDetailView");
		}else {
			mv.addObject("errorMsg", "공지사항 상세페이지 조회 실패");
		}		
		
		return mv;
	}
		
	// 공지사항 관리자 설정페이지
	@RequestMapping("admin.nt")
	public String adminNoticeManage() {
		return "notice/noticeAdmin";
	}
	
	
	/** 공지사항 관리자 조회
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectNtAdminY.nt", produces="application/json; charset=utf-8")
	public String ajaxSelectNtAdminY() {
		ArrayList<Employee> list = ntService.selectNtAdminY();		
		return new Gson().toJson(list);		
	}
	
	/**  공지사항 관리자 변경 Y => N
	 * @param empNo 관리자 => 일반사원 으로 변경될 사번
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="upDateAdminN.nt")
	public String ajaxUpdateAdminN(String empNo) {
		int result = ntService.upDateAdminN(empNo);
		return result>0 ? "success" : "fail";
	}
	
	
	/**  공지사항 관리자 변경 Y 
	 * @param empNo 일반사원 => 관리자 으로 변경될 사번
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="updateAdminY.nt")
	public String ajaxUpdateAdminY(String[] arrEmp) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("arrEmp", arrEmp);
		
		int result = ntService.updateAdminY(map);
		return result>0 ? "success" : "fail";
		
	}
	
	/** 상단 주요 공지사항 list조회
	 * @param currentPage 현재 페이지
	 * @param searchCategory 검색 카테고리
	 * @param keyword 검색 입력어
	 * @param filter 필터링
	 * @param orderNotice 순서
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectTop.nt", produces="applicaton/json; charset=utf-8")
	public String ajaxSelectTopNotice(@RequestParam(value="cpage", defaultValue="1")int currentPage, 
			String searchCategory, String keyword, String filter, String orderNotice) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchCategory", searchCategory);
		map.put("keyword", keyword);
		map.put("filter", filter);
		map.put("orderNotice", orderNotice);
						
		int listCount = ntService.selectTopNoticeCount(map);
						
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 4);
		ArrayList<Notice> list = ntService.selectTopNotice(map, pi);
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list",list);
		hm.put("pi", pi);
		
		return new Gson().toJson(hm);
				
	}
	
	/** 일반 공지사항 조회
	 * @param currentPage
	 * @param searchCategory
	 * @param keyword
	 * @param filter
	 * @param orderNotice
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectNormal.nt", produces="applicaton/json; charset=utf-8")
	public String ajaxSelectNormalNotice(@RequestParam(value="cpage", defaultValue="1")int currentPage, 
			String searchCategory, String keyword, String filter, String orderNotice) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchCategory", searchCategory);
		map.put("keyword", keyword);
		map.put("filter", filter);
		map.put("orderNotice", orderNotice);
						
		int listCount = ntService.selectNormalNoticeCount(map);
						
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 9);
		ArrayList<Notice> list = ntService.selectNormalNotice(map, pi);
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list",list);
		hm.put("pi", pi);
		
		return new Gson().toJson(hm);
				
	}
	
	/** summerNote 이미지 업로드
	 * @param multipartFile
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/uploadSummernoteImageFile.nt")
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpSession session )  {
		
		// 얜 multipartFile[] 로 받아서 controller에서 반복문 돌리는게 아니라 이미 summerNote collback부분에서 받는 파일을 for문으로 돌려 함수호출해줌 => 결국 넘어오는건 1개라는거지		
				
		int result = 0;
		
		
		String saveFilePath = FileUpload.saveFile(multipartFile, session, "resources/summer_images/"); // "resources/summer_images/" + "XXXX.jpg" changeName으로 저장경로와 함께 돌아옴
		File file = File.uploadFile(multipartFile, saveFilePath); // 파일 객체에 담기(이렇게 전달하면 originalName 등등 알아서 담아서 file객체 돌려줌)
		
		result = ntService.insertSummernote(file);
		
		/*
		 * if(result > 0) { System.out.println("성공"); }else { System.out.println("실패");
		 * }
		 */
		
		//System.out.println(saveFilePath);
		
		return saveFilePath;
	}
	
	/** 공지사항등록
	 * @param notice 등록할 공지내용
	 * @param upfile 첨부파일
	 * @param session alert Msg담기위해
	 * @param model error Msg 담기위해
	 * @return 공지사항 조회페이지이동
	 */
	@RequestMapping("insertNotice.nt")
	public String insertNotice(Notice notice, MultipartFile[] upfile, HttpSession session, Model model) {
		
		// null이 들어가지 않도록 조건 + 초기값처리 
		if(notice.getNoticeFile() == null) {
			notice.setNoticeFile("N");
		};
		
		if(notice.getNoticeImportant() == null) {
			notice.setNoticeImportant("N");
		};
		
		if(notice.getNoticeTop() == null) {
			notice.setNoticeTop("N");
		};
		
		
		// 1. 순서상 실제로 넘어온 upfile 들 중에 실제 첨부파일이 담긴게 있는지
		//=> 있다면 setNoticeFile에 Y를 담고 => 우선 notice먼저 insert(file테이블에는 nt_no필요)			
		for(int i=0; i<upfile.length; i++) {					
			if(!upfile[i].getOriginalFilename().equals("")) {								
				notice.setNoticeFile("Y");								
			 }
		}	
		
		//System.out.println(notice);
		
		// 2. tb_notice insert
		int result1 = ntService.insertNotice(notice);
		
					
		//파일 등록
		int result2 = 1;
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
				
				result2 = ntService.insertFileNotice(file);
			 }
		}
		
		//System.out.println(result1 + " " +result2 + " " +result3 + " " +result4);
		
		if(result1 * result2 > 0) {
			session.setAttribute("alertMsg", "공지사항이 등록되었습니다.");
			return "redirect:list.nt";
		}else {
			model.addAttribute("errorMsg", "공지사항등록 실패");
			return "common/error";
		}
			
	}
	
	
	/** 공지사항 삭제
	 * @param noticeNo 삭제할 공지사항 번호
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("deleteNotice.nt")
	public String deleteNotice(String noticeNo, HttpSession session, Model model) {
		
		int result = ntService.deleteNotice(noticeNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "공지사항 삭제되었습니다.");
			return "redirect:list.nt";
		}else {
			model.addAttribute("errorMsg", "공지사항삭제 실패");
			return "common/error";
		}	
			
	}
	
	/** 공지사항 수정페이지 form
	 * @return 해당 공지사항에 등록되어있던 정보 조회
	 */
	@RequestMapping("update.nt")
	public ModelAndView updateNotice(String no, ModelAndView mv) {
		
		// 뿌려줄 내용 조회해오기
		// 1. notice 조회
		Notice n = ntService.selectDetailNotice(no);
		// 2. file 조회
		ArrayList<File> list = ntService.selectFileDetail(no);
		
		mv.addObject("n", n).addObject("list", list).setViewName("notice/noticeUpdateForm");	
		
		return mv;		
	}
	
	
	/** 공지사항 수정하기
	 * @param notice 수정할 내용 + 기존의 첨부파일 ArrayList fileList
	 * @param upfile 새로운 첨부파일
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("updateNotice.nt")
	public String updateNoticeAndFile(Notice notice, MultipartFile[] upfile, HttpSession session, Model model) {
				
		// 1. null 초기값 설정
		// null이 들어가지 않도록 조건 + 초기값처리 
		// db에 default 해놓으면 null로 할 시 default값이 들어갈 줄 알았는데
		// 그건 sql에서 직접 명시하지않고  예를 들어 insert시 명시해놓고 
		//insert into noticeImportant values => #{noticeImpotant  해버리면 아무리 default조건을 줘도 null이 들어감 
		if(notice.getNoticeFile() == null) {
			notice.setNoticeFile("N");
		};
		
		if(notice.getNoticeImportant() == null) {
			notice.setNoticeImportant("N");
		};
		
		if(notice.getNoticeTop() == null) {
			notice.setNoticeTop("N");
		};
				
		// 경우에 따라 noticefile= 'Y'로 바꿔주기 전에 먼저 기존에 등록되었던 첨부파일에 대한 거 
		// 4-1 기존에 저장된 파일들 file_status = 'N'			
		int result2 = 1;					// 원래 등록된 파일이 없는경우 + 있었으나 수정폼에서 다 지운 경우도 있으니
		if(notice.getNoticeFile() != "N") { // 애초에 원래 등록된 첨부파일이 있었을 경우 해당 글번호로 저장된 파일 status='n'시키는 if절 (<=저건 jsp에서 form안에 input-hidden으로 담았음)
			result2 = ntService.updateFileN(notice.getNoticeNo());
			notice.setNoticeFile("N"); // 다 삭제해버렸으니 우선 N			
		}		
								
		// 2-1. 순서상 실제로 넘어온 upfile 들 중에 실제 첨부파일이 담긴게 있는지
		//=> 있다면 setNoticeFile에 Y를 담고 		
		for(int i=0; i<upfile.length; i++) {					
			if(!upfile[i].getOriginalFilename().equals("")) {								
				notice.setNoticeFile("Y");								
			 }				
		};
		// 2-2 혹은 새 첨부파일 없이 기존의 저장된 첨부파일만 저장할경우
		//=> 있다면 setNoticeFile에 Y를 담고 	
		if(notice.getFileList() != null) {
			ArrayList<File> fileList = notice.getFileList();
			// 기존파일들이 모두 지워진다면 NULL로 오고(=>if절 getfilelist != null) => 여러개 중 부분적으로 넘어오면
			// 기존의 file들 중 0번째를 삭제하게 되면 ArrayList의 i는 지워지지않고 file(0) 필드=null 필드=null 필드=null 이런식으로 전달됨
			for(File f : fileList) {
				if(f.getFileNo() > 0) {
					notice.setNoticeFile("Y");
				}				
			}
		}	
		
		// 3. notice update
		int result1 = ntService.updateNotice(notice);
			
		int result3 = 1;
		// 4-2 기존의 파일들 중 넘어온 파일들만 있다면 다시 file_status='Y'
		if(notice.getFileList() != null) {
			ArrayList<File> fileList = notice.getFileList();
			// 기존의 file을 삭제하게 되면 ArrayList의 i는 지워지지않고 file(0) 필드=null 필드=null 필드=null 이런식으로 전달됨
			for(File fileY : fileList) {
				if(fileY.getFileNo() > 0) {				
					
					// 파일객체에 참고번호로 공지사항 글번호 담아서 전달
					fileY.setRefNo(Integer.parseInt(notice.getNoticeNo()));
					result3 = ntService.updateFileY(fileY);						
				}
				
			}
		}	
		
		// 5. 새로 등록된 첨부파일 file insert
		// 파일 등록
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
				
				System.out.println(file);
								
				file.setRefNo(Integer.parseInt(notice.getNoticeNo()));
			
				result4 = ntService.updateFileNotice(file); // 참조번호가 currval이 아니라 고정된거 공지사항번호넘기기
			 }
		}
		
		if(result1 * result4 > 0) {
			session.setAttribute("alertMsg", "공지사항 수정 성공");
			return "redirect:detail.nt?no=" + notice.getNoticeNo();
		}else {
			model.addAttribute("errorMsg", "공지사항 수정 실패");
			return "common/error";
		}
		
		
	}
	
	
	
	
	
	
	

	
	
}
