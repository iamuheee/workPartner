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
	 * @return "URL"
	 */
	@RequestMapping("insert.du")
	public String insertDuty(Duty d, MultipartFile upfile, HttpSession session, Model m) {
		int result1 = dService.insertDuty(d);
		// int result2 = dService.insertDutyCharge(d);
		// 아직 담당자 추가 제대로 못하니까 임의로 1로 설정
		int result2 = 1;

		if(upfile != null) {
			// 첨부파일 있는 경우
			int result3 = dService.insertFile(File.uploadFile(upfile, FileUpload.saveFile(upfile, session, "resources/uploadFiles/")));
			if(result1 * result2 * result3 > 0) {
				session.setAttribute("alertMsg", "업무 등록에 성공했습니다.");
				return "detail.du?no=" + dService.selectDutyListCount();
			}else {
				m.addAttribute("errorMsg", "업무 등록에 실패했습니다.");
				return "common/errorPage";
			}
		}else {
			// 첨부파일 없는 경우
			if(result1 * result2 > 0) {
				session.setAttribute("alertMsg", "업무 등록에 성공했습니다.");
				return "detail.du?no=" + dService.selectDutyListCount();
			}else {
				m.addAttribute("errorMsg", "업무 등록에 실패했습니다.");
				return "common/errorPage";
			}
		}
	}
	
	
	/**
	 * 업무 리스트 조회
	 * @return ModelAndView <- ArrayList<Duty> dlist, ArrayList<DutyCharge> dclist
	 */
	@RequestMapping()
	public ModelAndView selectDutyList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv){
															// currentPage의 키값은 cpage, 기본값은 1
		int listCount = dService.selectDutyListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		String empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo(); // 세션에서 loginUser의 사번 받기
		
		ArrayList<Duty> dlist = dService.selectDutyList(pi, empNo);
		ArrayList<DutyCharge> dclist = dService.selectDutyChargeList(pi, empNo);
		
		// 업무번호:  8 7 7 7 6 6 5 4 4 4 3  3  2  2  1 
		// 반복분  :  0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		// 업무번호 높은 순으로 / 한 업무에 담당자가 여럿이면 ", "으로 이어서 / ArrayList<String>에 담기
		
		
		ArrayList<String> empICList = new ArrayList<>();
		
		int dlistIdx = 0;
		String empIC = "";
		for(int i=0; i<dclist.size(); i++) {
			if( dclist.get(i).getDutyNo() == dclist.get(i+1).getDutyNo() ) {
				empIC += dclist.get(i).getEmpICName() + ", ";
			}else {
				empIC += dclist.get(i).getEmpICName();
				dlist.get(dlistIdx).setEmpIC(empIC);
				empIC = ""; // 다른 dutyNo에 해당하는 담당자 이름이 올텐데 계속해서 이어지면 안되니까 문자열 초기화
				dlistIdx++; // dlist의 인덱스는 dutyNo이 +1할 때마다 증가하니까 이것도 증가시켜주기
			}
		}
		
		mv.addObject("pi", pi).addObject("dlist", dlist).setViewName("duty/dutyListView");
		return mv;
	}
	
	
	/**
	 * 업무 상세 조회 
	 * @return Duty
	 */
	@RequestMapping("detail.du")
	public ModelAndView selectDuty(ModelAndView mv, int no) {
		Duty d = dService.selectDuty(no);

		if(d != null) {
			mv.addObject("d", d).setViewName("duty/dutyDetailView");
		}else {
			mv.addObject("errorMsg", "요청하신 번호의 업무를 찾을 수 없습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
}
