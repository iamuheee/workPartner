package com.wp.workpartner.room.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.room.model.vo.Equip;
import com.wp.workpartner.room.model.vo.Room;

@Repository
public class RoomDao {

	public int insertEquip(SqlSessionTemplate sqlSession, String eqName) {
		return sqlSession.insert("roomMapper.insertEquip", eqName);
	}
	
	public ArrayList selectEquipList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("roomMapper.selectEquipList");
	}
	
	public int insertRoom(SqlSessionTemplate sqlSession, Room r) {
		return sqlSession.insert("roomMapper.insertRoom", r);
	}
	
	public int selectRmNo(SqlSessionTemplate sqlSession, String rmName) {
		return sqlSession.selectOne("roomMapper.selectRmNo", rmName);
	}
	
	public int insertRoomImg(SqlSessionTemplate sqlSession, File file, int fileLevel) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("file", file);
		map.put("fileLevel", fileLevel);
		
		return sqlSession.insert("roomMapper.insertRoomImg", map);
	}
	
	public int insertUsingEquip(SqlSessionTemplate sqlSession, String[] equips) {
		return sqlSession.insert("roomMapper.insertUsingEquip", equips);
	}
	
	public ArrayList selectRoomList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("roomMapper.selectRoomList");
	}
	
	public ArrayList selectRoom(SqlSessionTemplate sqlSession, String rmNo) {
		return (ArrayList)sqlSession.selectList("roomMapper.selectRoom", rmNo);
	}
	
	public ArrayList selectUsingEquip(SqlSessionTemplate sqlSession, String rmNo) {
		return (ArrayList)sqlSession.selectList("roomMapper.selectUsingEquip", rmNo);
	}
	
	public ArrayList selectFile(SqlSessionTemplate sqlSession, String rmNo) {
		return (ArrayList)sqlSession.selectList("roomMapper.selectFile", rmNo);
	}
	
	public int deleteRoom(SqlSessionTemplate sqlSession, String rmNo) {
		return sqlSession.update("roomMapper.deleteRoom", rmNo);
	}
	
	public int selectUsingCount(SqlSessionTemplate sqlSession, String rmNo) {
		return sqlSession.selectOne("roomMapper.selectUsingCount", rmNo);
	}
	
	public int selectTotalCount(SqlSessionTemplate sqlSession, String rmNo) {
		return sqlSession.selectOne("roomMapper.selectTotalCount", rmNo);
	}
	
	public int updateRoom(SqlSessionTemplate sqlSession, HashMap<String, String> r) {
		return sqlSession.update("roomMapper.updateRoom", r);
	}
	
	public int deleteUsingEquip(SqlSessionTemplate sqlSession, HashMap<String, String> r) {
		return sqlSession.delete("roomMapper.deleteUsingEquip", r);
	}
	
	public int updateUsingEquip(SqlSessionTemplate sqlSession, HashMap<String, String> r, String[] equips) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("r", r);
		map.put("equips", equips);
		
		return sqlSession.update("roomMapper.updateUsingEquip", map);
	}
}
