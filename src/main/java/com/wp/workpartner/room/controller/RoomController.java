package com.wp.workpartner.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoomController {

	// jsp 연결 위해 임시로 작성
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 회의실 리스트 조회 요청 처리 메소드 
	 * @return	: String
	 */
	@RequestMapping("list.rm")
	public String selectRoomList() {
		return "room/roomListView";
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 회의실 등록 페이지 요청 처리 메소드 
	 * @return	: String
	 */
	@RequestMapping("insertForm.rm")
	public String insertForm() {
		return "room/roomInsertForm";
	}
	
	/**
	 * @author	: Taeeun Park
	 * @date	: 2022. 9. 11.
	 * @method	: 회의실 수정 페이지 요청 처리 메소드 
	 * @return	: String
	 */
	@RequestMapping("updateForm.rm")
	public String updateForm() {
		return "room/roomUpdateForm";
	}
}
