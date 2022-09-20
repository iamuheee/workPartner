package com.wp.workpartner.address.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.wp.workpartner.address.model.service.AddressService;
import com.wp.workpartner.address.model.vo.Department;
import com.wp.workpartner.address.model.vo.MyAddress;
import com.wp.workpartner.address.model.vo.MyGroup;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.common.template.Pagination;
import com.wp.workpartner.employee.model.vo.Employee;

@Controller
public class AddressController {
		
	@Autowired
	private AddressService adService;
		
	/** 주소록으로 이동하는 url
	 * @return url
	 */
	@RequestMapping("list.ad")
	private String selectAddressList() {
		return "address/addressListView";
	}
			
	/** 부서 list용 ajax
	 * @return 부서목록 list
	 */
	@ResponseBody
	@RequestMapping(value="depList.ad", produces="application/json; charset=utf-8")
	public String ajaxSelectDepartmentList() {
		ArrayList<Department> list = adService.selectDepList();
		//System.out.println(list);
		return new Gson().toJson(list);
	}	
	
	/**내연락처 목록용 ajax
	 * @param employeeNo
	 * @return 내 연락처에 등록된 그룹목록
	 */
	@ResponseBody
	@RequestMapping(value="gpList.ad", produces="application/json; charset=utf-8")
	public String ajaxSelectGroupList(String employeeNo) {
		ArrayList<MyGroup> list = adService.selectGpList(employeeNo);
		return new Gson().toJson(list);
	}	

	/** 부서별 사원테이블조회용 ajax
	 * @param depCd 조회할 보서코드
	 * @param currentPage
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="depTb.ad", produces="application/json; charset=utf-8")
	public String ajaxSelectEmpAddList(int depCd, @RequestParam(value="cpage", defaultValue="1")int currentPage) {
		
		int listCount = adService.selectEmpAdListCount(depCd);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 8);				
		ArrayList<Employee> list = adService.selectEmpAdList(depCd, pi);		
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list", list);
		hm.put("pi", pi);
		return new Gson().toJson(hm);		
	}
	
	/** 내 연락처 테이블 조회용
	 * @param groupNo 그룹번호
	 * @param currentPage 현재페이지
	 * @return 해당 그룹의 연락처들, pi객체
	 */
	@ResponseBody
	@RequestMapping(value="myAdTb.ad", produces="application/json; charset=utf-8")
	public String ajaxSelectMyAddList(int groupNo, @RequestParam(value="cpage", defaultValue="1")int currentPage) {
		
		int listCount = adService.selectMyAddCount(groupNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 8);		
		ArrayList<MyAddress> list = adService.selectMyAddList(groupNo, pi);
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list", list);
		hm.put("pi", pi);
		return new Gson().toJson(hm);		
	}
	
	/** 별표연락처테이블 조회
	 * @param empNo 해당 별표연락처의 사용자
	 * @param currentPage 현재 페이지
	 * @return 사용자의 별표연락처 list
	 */
	@ResponseBody
	@RequestMapping(value="starList.ad", produces="application/json; charset=utf-8")
	public String ajaxSelectStarList(String empNo, @RequestParam(value="cpage", defaultValue="1")int currentPage) {
		
		int listCount = adService.selectStarAdCount(empNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 8);
		ArrayList<MyAddress> list = adService.selectStarList(empNo, pi);
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list", list);
		hm.put("pi", pi);
		return new Gson().toJson(hm);		
	}
	
	/** 조직도테이블 > 상세페이지용
	 * @param empNo 상세조회할 사원번호
	 * @return 사원의 정보
	 */
	@ResponseBody
	@RequestMapping(value="detailEmp.ad", produces="application/json; charset=utf-8")
	public String ajaxSelectDetailEmp(String empNo) {
		Employee emp = adService.selectDetailEmp(empNo);		
		return new Gson().toJson(emp);
	}
	
	/** 별표연락처 & 내 연락처 > 상세내용 
	 * @param addressNo 연락처번호
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="detailMyAdd.ad", produces="application/json; charset=utf-8")
	public String ajaxSelectDetailMyAdd(int addressNo) {
		MyAddress myAdd = adService.selectDetailmyAdd(addressNo);
		return new Gson().toJson(myAdd);
	}
	
	/** 별 클릭시 실시간 addstar 반영
	 * @param myAd : adderessNo, addressStar
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="updateStar.ad")
	public String ajaxUpdateStar(MyAddress myAd) {	
		// produces로 json타입하면 안됨 전달안된다
		// 값 두개 전달왔을때 data 키값==객체의 필드명과 같게 써서 객체에 담았음 
		int result = adService.updateAddStar(myAd);
		return result > 0 ? "success" : "fail";
	}
	
	
	/** 연락처 편집
	 * @param myAdd 수정된 정보
	 * @param session 성공메시지
	 * @param model 실패메세지
	 * @return
	 */
	@RequestMapping("updateAdd.ad")
	public String updateAdd(MyAddress myAdd, HttpSession session, Model model) {
		//System.out.println(myAdd);
		
		int result = adService.updateAdd(myAdd);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			return "redirect:list.ad";
		}else {
			model.addAttribute("errorMsg", "수정실패");
			return "common/error";
		}
		
	}
	
	/** 새 연락처 등록
	 * @param myAdd 연락처 정보
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("insertAd.ad")
	public String insertAdd(MyAddress myAdd, HttpSession session, Model model) {
		
		int result = adService.insertAdd(myAdd);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 등록되었습니다.");
			return "redirect:list.ad";
		}else {
			model.addAttribute("errorMsg", "등록실패");
			return "common/error";
		}
		
	}
	
	/** 새 내 연락처 그룹 추가
	 * @param myGp 그룹명, 등록한 직원번호	
	 */
	@ResponseBody
	@RequestMapping("insertGp.ad")
	public String insertGp(MyGroup myGp) {
		int result = adService.insertGp(myGp);
		return result > 0? "success" : "fail";
		
	}
	
	/** 그룹명 수정
	 * @param myGp 그룹번호	
	 * @return
	 */
	@ResponseBody
	@RequestMapping("updateGp.ad")
	public String updateGp(MyGroup myGp) {
		int result = adService.updateGp(myGp);
		return result > 0? "success" : "fail";
	}
	
	/** 그룹삭제
	 * @param groupNo 그룹번호
	 * @return
	 */
	@ResponseBody
	@RequestMapping("deleteGp.ad")
	public String deleteGp(int groupNo) {
		int result = adService.deleteGp(groupNo);
		return result > 0? "success" : "fail";
	}
	
	/** 내 연락처 개별 삭제
	 * @param addressNo 연락처 번호
	 * @return
	 */
	@ResponseBody
	@RequestMapping("deleteAdd.ad")
	public String ajaxDeleteAddOne(String addressNo) {
		int result = adService.deleteAddOne(addressNo);
		return result > 0 ? "success" : "fail";
	}
	
	/** 다중선택 연락처 삭제
	 * @param addArr 연락처번호들
	 * @return
	 */
	@ResponseBody
	@RequestMapping("deleteAdds.ad")
	public String ajaxDeleteAddGroup(String[] addArr) {
				
		/* 이렇게 sql문을 반복실행하는것보단
		int result = 0;
		for(String addressNo: addArr) {
			result = adService.deleteAddOne(addressNo);
		}	
		*/
		
		/* 이용할 동적 sql문 => 마이바티스 홈페이지 동적 sql foreach 참조
		 * delete from tb_my_address
		 * where address_no in (20, 21)
		 * 
		 */
		// 주의 => 그럼 화면상에서 체크박스 선택 안 할 시 삭제버튼 못누르게 해줘야함 => 안그러면 저 sql구문상 전체data가 삭제처리됨
		// map을 dao까지 쭉 넘기고 sql문 까지 넘기기
		// collection="addArr"로 하면된다 (map에 key값한)
		//hashMap 담지않고 collection="addArr"하면 안 됨!!
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("addArr", addArr);
		
		int result = adService.deleteAddGp(map);
		
		return result > 0 ? "success" : "fail";	
		
	}
	
	// 공지사항관리자 주소록
	@RequestMapping("addressAdmin.ad")
	public String addressAdminNotice() {
		return "address/addressAdminNotice";
	}
	
	// 쪽지보내기용 주소록
	@RequestMapping("addressNote.ad")
	public String addressNote() {
		return "address/addressNote";
	}
	
	// 받는사람 이메일용 주소록
	@RequestMapping("addressEmail.ad")
	public String addressEmail() {
		return "address/addressEmail";
	}
	
	// CC용 이메일용 주소록
	@RequestMapping("addressEmailCC.ad")
	public String addressEmailCC() {
		return "address/addressEmailCC";
	}
	
	// 업무용 주소록
	@RequestMapping("addressDuty.ad")
	public String addressDuty() {
		return "address/addressDuty";
	}
	
	// 프로젝트 멤버추가용 주소록
	@RequestMapping("addressProject.ad")
	public String addressProject() {
		return "address/addressProject";
	}
	
	// 프로젝트 게시판 담당자용 주소록
	@RequestMapping("addressPcharge.ad")
	public String addressPcharge() {
		return "address/addressPcharge";
	}
	
	
}
