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
	public int deleteBook(String bkNo) {
		return bDao.deleteBook(sqlSession, bkNo);
	}

	

	

	



}
