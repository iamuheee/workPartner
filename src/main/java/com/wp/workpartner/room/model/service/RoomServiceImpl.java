package com.wp.workpartner.room.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.room.model.dao.RoomDao;
import com.wp.workpartner.room.model.vo.Room;

@Service
public class RoomServiceImpl implements RoomService{

	@Autowired
	private RoomDao rDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertEquip(String eqName) {
		return rDao.insertEquip(sqlSession, eqName);
	}
	
	@Override
	public ArrayList selectEquipList() {
		return rDao.selectEquipList(sqlSession);
	}
	
	@Override
	public int insertRoom(Room r) {
		return rDao.insertRoom(sqlSession, r);
	}
	
	@Override
	public int insertRoomImg(File file, int fileLevel) {
		return rDao.insertRoomImg(sqlSession, file, fileLevel);
	}
	
	@Override
	public int insertUsingEquip(String[] equips) {
		return rDao.insertUsingEquip(sqlSession, equips);
	}

	@Override
	public ArrayList selectRoom(String rmNo) {
		return rDao.selectRoom(sqlSession, rmNo);
	}
	
	@Override
	public int updateRoom(HashMap<String, String> r, String[] equips) {
		
		// 1) tb_room 수정
		int result1 = rDao.updateRoom(sqlSession, r); // > 0 이면 성공
		
		// 2) tb_usingEquip 수정
		// 2-1) 먼저 tb_usingequip에서 rm_no = r.rmNo인 행들을 모두 삭제한다.
		int result2 = rDao.deleteUsingEquip(sqlSession, r);	// 0 1이면 성공
		
		// 2-2) tb_usingequip에서 equips 에 들어있는 값들을 다시 insert 해 준다.
		// ==> equips가 null이 아닐 때만 실행한다.
		// ==> 작성해 놓은 insertUsingEquip 를 사용하면 됨
		int result3 = rDao.updateUsingEquip(sqlSession, r, equips);
		
			
		// 하나라도 0이면 실패이므로 곱한 값이 0보다 커야 한다.
		
		System.out.println("result : " + result1 * result2 * result3);
		return (result1 * result2 * result3 > 0) ? 1 : 0;
	}

	@Override
	public int deleteRoom(String rmNo) {
		return rDao.deleteRoom(sqlSession, rmNo);
	}

	@Override
	public ArrayList selectRoomList() {
		return rDao.selectRoomList(sqlSession);
	}

	@Override
	public ArrayList selectUsingEquip(String rmNo) {
		return rDao.selectUsingEquip(sqlSession, rmNo);
	}

	@Override
	public ArrayList selectFile(String rmNo) {
		return rDao.selectFile(sqlSession, rmNo);
	}

	@Override
	public int selectUsingCount(String rmNo) {
		return rDao.selectUsingCount(sqlSession, rmNo);
	}

	@Override
	public int selectTotalCount(String rmNo) {
		return rDao.selectTotalCount(sqlSession, rmNo);
	}


	

	


}
