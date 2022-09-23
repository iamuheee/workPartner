package com.wp.workpartner.room.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.room.model.vo.Room;

public interface RoomService {
	
	// 회의실 장비 등록 서비스 (insert)
	int insertEquip(String eqName);
	
	// 회의실 장비 조회 서비스 (select)
	ArrayList selectEquipList();
	
	// 회의실 등록 서비스 (insert)
	int insertRoom(Room r);
	int insertRoomImg(File file, int fileLevel);
	int insertUsingEquip(String[] equips);
	
	// 회의실 목록 조회 서비스 (select) -- ajax
	ArrayList selectRoomList();
	
	// 회의실 조회 서비스 (select) -- ajax
	// 회의실 기본 정보 조회
	ArrayList selectRoom(String rmNo);
	// 회의실 사용 장비 조회
	ArrayList selectUsingEquip(String rmNo);
	// 회의실 이미지 조회
	ArrayList selectFile(String rmNo);
	
	
	// 회의실 사용률 조회 서비스 (select)
	int selectUsingCount(String rmNo);
	int selectTotalCount(String rmNo);
	
	
	// 회의실 수정 서비스 (update)
	int updateRoom(HashMap<String, String> r, String[] equips);
	
	// 회의실 삭제 서비스 (update)
	int deleteRoom(String rmNo);

}
