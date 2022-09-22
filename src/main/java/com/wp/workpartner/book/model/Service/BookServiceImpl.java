package com.wp.workpartner.book.model.Service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.book.model.dao.BookDao;
import com.wp.workpartner.book.model.vo.Book;
import com.wp.workpartner.common.model.vo.PageInfo;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	BookDao bDao;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertBook(Book b) {
		return bDao.insertBook(sqlSession, b);
	}

	@Override
	public int selectListCount(String empNo) {
		return bDao.selectListCount(sqlSession, empNo);
	}
	
	@Override
	public ArrayList selectBookList(String empNo, PageInfo pi) {
		return bDao.selectBookList(sqlSession, empNo, pi);
	}
	
	@Override
	public Book selectBook(String bkNo) {
		return bDao.selectBook(sqlSession, bkNo);
	}
	
	@Override
	public int updateBook(Book b) {
		return bDao.updateBook(sqlSession, b);
	}
	
	@Override
	public ArrayList selectBookByDate(String meetDate) {
		return null;
	}

	@Override
	public ArrayList selectBookByRoom(String bkNo) {
		return null;
	}
	
	@Override
	public ArrayList selectAllBookList() {
		return bDao.selectAllBookList(sqlSession);
	}
	
	@Override
	public ArrayList selectRoomList() {
		return bDao.selectRoomList(sqlSession);
	}

	@Override
	public int deleteBook(String bkNo) {
		return bDao.deleteBook(sqlSession, bkNo);
	}

//	@Override
//	public int selectAllListCountByCondition(String rmNo, String startDate, String endDate) {
//		return bDao.selectAllListCountByCondition(sqlSession, rmNo, startDate, endDate);
//	}
//
//	@Override
//	public ArrayList selectAllListByCondition(String rmNo, String startDate, String endDate, PageInfo pi) {
//		return bDao.selectAllListByCondition(sqlSession, rmNo, startDate, endDate, pi);
//	}

	@Override
	public int selectAllListCount() {
		return bDao.selectAllListCount(sqlSession);
	}

	@Override
	public ArrayList selectAllList(PageInfo pi) {
		return bDao.selectAllList(sqlSession, pi);
	}

	@Override
	public int selectByRoomListCount(String rmNo) {
		return bDao.selectByRoomListCount(sqlSession, rmNo);
	}

	@Override
	public ArrayList selectByRoomList(String rmNo, PageInfo pi) {
		return bDao.selectByRoomList(sqlSession, rmNo, pi);
	}

	@Override
	public int selectByDateListCount(String start, String end) {
		return bDao.selectByDateListCount(sqlSession, start, end);
	}

	@Override
	public ArrayList selectByDateList(String start, String end, PageInfo pi) {
		return bDao.selectByDateList(sqlSession, start, end, pi);
	}

	@Override
	public int selectByRoomAndDateListCount(String rmNo, String start, String end) {
		return bDao.selectByRoomAndDateListCount(sqlSession, rmNo, start, end);
	}

	@Override
	public ArrayList selectByRoomAndDateList(String rmNo, String start, String end, PageInfo pi) {
		return bDao.selectByRoomAndDateList(sqlSession, rmNo, start, end, pi);
	}


	

	

	

	



}
