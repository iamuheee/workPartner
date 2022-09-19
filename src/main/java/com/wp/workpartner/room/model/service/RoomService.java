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
	ArrayList selectRoom(String rmNo);
	
	// 회의실 수정 서비스 (update)
	int updateRoom(Room r);
	
	// 회의실 삭제 서비스 (update)
	int deleteRoom(String rmNo);

}
