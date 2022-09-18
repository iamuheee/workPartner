package com.wp.workpartner.room.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.common.template.FileUpload;
import com.wp.workpartner.room.model.service.RoomService;
import com.wp.workpartner.room.model.vo.Equip;
import com.wp.workpartner.room.model.vo.Room;

@Controller
public class RoomController {

	// jsp 연결 위해 임시로 작성
	
	// rm -> ro로 수정하기
	
	@Autowired
	private RoomService rService;
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 회의실 리스트 조회 요청 처리 메소드 
	 * @return	: String
	 */
	@RequestMapping("list.ro")
	public String selectRoomList() {
		return "room/roomListView";
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 회의실 등록 페이지 요청 처리 메소드 
	 * @return	: String
	 */
	@RequestMapping("enrollForm.rm")
	public String insertForm() {
		return "room/roomEnrollForm";
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 회의실 수정 페이지 요청 처리 메소드 
	 * @return	: String
	 */
	@RequestMapping("updateForm.ro")
	public String updateForm() {
		return "room/roomUpdateForm";
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 17.
	 * @method  : (ajax) 회의 장비 추가 요청 처리 
	 * @param	: eqName - 회의 장비명
	 * @return	: String result - insert 처리 결과
	 */
	@ResponseBody
	@RequestMapping("insertEq.ro")
	public String ajaxInsertEquip(String eqName) {
//		System.out.println(eqName);
		int result = rService.insertEquip(eqName);
//		System.out.println(result);
		
		return (result > 0) ? "success" : "fail"; 
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 17.
	 * @method	: (ajax) 회의 장비 조회 요청 처리
	 * @return	: list - 조회 결과 ArrayList
	 */
	@ResponseBody
	@RequestMapping(value="selectEqList.ro", produces="application/json; charset=UTF-8")
	public String ajaxSelectEquipList() {
		ArrayList<Equip> list =  rService.selectEquipList();
		return new Gson().toJson(list);
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 18.
	 * @method	: 회의실 등록 요청 처리
	 * @param	: upfile - 다중 첨부파일 배열
	 * @return	: 성공 시 - 회의실 조회 요청 | 실패 시 - 에러 페이지 포워딩
	 */
	@RequestMapping("insert.ro")
	public String insertRoom(Room r, MultipartFile[] upfile, HttpSession session, Model model) {	// 여러 장의 회의실 이미지를 배열로 받음

		int result1 = rService.insertRoom(r);
		
		if(result1 > 0) {	// 1. tb_table insert 성공 시
			int fileLevel = 1;
			int result2 = 0;	// tb_file insert 성공 여부 담을 변수
			
			for(int i=0; i<upfile.length; i++) {
				if(!upfile[i].getOriginalFilename().equals("")) {
					String saveFilePath = FileUpload.saveFile(upfile[i], session, "resources/uploadFiles/");
					File file = File.uploadFile(upfile[i], saveFilePath);
					result2 = rService.insertRoomImg(file, fileLevel);
					fileLevel++;
				}
			}
			
			if(result2 > 0 ) {	// 2. tb_file insert 성공 시
				String[] equips = r.getEqNo().split(",");	// 체크박스로 넘어온 값을 배열에 담아 넘김
				System.out.println("equips : " + equips);
				int result3 = rService.insertUsingEquip(equips);
				
				if(result3 == equips.length) {	// 3. tb_usingequip insert 성공 시
					session.setAttribute("alertMsg", "회의실이 등록되었습니다.");
					return "redirect:list.ro";
				}
			} 
			
		}	// tb_table insert 실패
		
		model.addAttribute("errorMsg", "회의실 등록 실패");
		return "common/error";
	}
	

}
