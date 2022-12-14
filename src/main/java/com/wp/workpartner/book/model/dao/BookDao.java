package com.wp.workpartner.book.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.book.model.vo.Book;
import com.wp.workpartner.common.model.vo.PageInfo;

@Repository
public class BookDao {
	
	public int insertBook(SqlSessionTemplate sqlSession, Book b) {
		return sqlSession.insert("bookMapper.insertBook", b);
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("bookMapper.selectListCount", empNo);
	}
	
	public ArrayList selectBookList(SqlSessionTemplate sqlSession, String empNo, PageInfo pi) {
//		System.out.println("dao:"+empNo);
		int limit = pi.getBoardLimit();
		int offset =(pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("bookMapper.selectBookList", empNo, rowBounds); 
	}
	
	public Book selectBook(SqlSessionTemplate sqlSession, String bkNo) {
		return sqlSession.selectOne("bookMapper.selectBook", bkNo);
	}
	
	public int updateBook(SqlSessionTemplate sqlSession, Book b) {
		return sqlSession.update("bookMapper.updateBook", b);
	}
	
	public int deleteBook(SqlSessionTemplate sqlSession, String bkNo) {
		return sqlSession.update("bookMapper.deleteBook", bkNo);
	}
	
	// 풀캘린더용 (예약취소가 되지 않은 목록만 가져옴)
	public ArrayList selectAllBookList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("bookMapper.selectAllBookList");
	}
	
	public ArrayList selectRoomList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("bookMapper.selectRoomList");
	}
	
//	public int selectAllListCountByCondition(SqlSessionTemplate sqlSession, String rmNo, String startDate, String endDate) {
//		HashMap<String, String> map = new HashMap<>();
//		map.put("rmNo", rmNo);
//		map.put("startDate", startDate);
//		map.put("endDate", endDate);
//		
//		return sqlSession.selectOne("bookMapper.selectAllListCountByCondition", map);
//	}
//	
//	public ArrayList selectAllListByCondition(SqlSessionTemplate sqlSession, String rmNo, String startDate, String endDate, PageInfo pi) {
//		HashMap<String, String> map = new HashMap<>();
//		map.put("rmNo", rmNo);
//		map.put("starDate", startDate);
//		map.put("endDate", endDate);
//		
//		int limit = pi.getBoardLimit();
//		int offset = (pi.getCurrentPage() - 1);
//		
//		RowBounds rowBounds = new RowBounds(offset, limit);
//		
//		return (ArrayList)sqlSession.selectList("bookMapper.selectAllListByCondition", map, rowBounds);
//	}
	
	public int selectAllListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("bookMapper.selectAllListCount");
	}
	
	public ArrayList selectAllList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit; 
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("bookMapper.selectAllList", null, rowBounds);
	}
	
	public int selectByRoomListCount(SqlSessionTemplate sqlSession, String rmNo) {
		return sqlSession.selectOne("bookMapper.selectByRoomListCount", rmNo);
	}
	
	public ArrayList selectByRoomList(SqlSessionTemplate sqlSession, String rmNo, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit; 
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("bookMapper.selectByRoomList", rmNo, rowBounds);
	}
	
	public int selectByDateListCount(SqlSessionTemplate sqlSession, String start, String end) {
		HashMap<String, String> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectOne("bookMapper.selectByDateListCount", map);
	}
	
	public ArrayList selectByDateList(SqlSessionTemplate sqlSession, String start, String end, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit; 
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		HashMap<String, String> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		return (ArrayList)sqlSession.selectList("bookMapper.selectByDateList", map, rowBounds);
	}
	
	public int selectByRoomAndDateListCount(SqlSessionTemplate sqlSession, String rmNo, String start, String end) {
		HashMap<String, String> map = new HashMap<>();
		map.put("rmNo", rmNo);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectOne("bookMapper.selectByRoomAndDateListCount", map);
	}
	
	public ArrayList selectByRoomAndDateList(SqlSessionTemplate sqlSession, String rmNo, String start, String end, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit; 
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		HashMap<String, String> map = new HashMap<>();
		map.put("rmNo", rmNo);
		map.put("start", start);
		map.put("end", end);
		
		return (ArrayList)sqlSession.selectList("bookMapper.selectByRoomAndDateList", map, rowBounds);
	}
	
	public ArrayList selectTime(SqlSessionTemplate sqlSession, String rmNo, String bkDate) {
		System.out.println(rmNo);
		System.out.println(bkDate);
		
		HashMap<String, String> map = new HashMap<>();
		
		map.put("rmNo", rmNo);
		map.put("bkDate", bkDate);
		
		return (ArrayList)sqlSession.selectList("bookMapper.selectTime", map);
	}
}
