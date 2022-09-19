package com.wp.workpartner.room.model.service;

import java.util.ArrayList;

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
	public int updateRoom(Room r) {
		return 0;
	}

	@Override
	public int deleteRoom(String rmNo) {
		return rDao.deleteRoom(sqlSession, rmNo);
	}

	@Override
	public ArrayList selectRoomList() {
		return rDao.selectRoomList(sqlSession);
	}


	

	


}
