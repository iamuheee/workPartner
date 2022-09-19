package com.wp.workpartner.book.model.Service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.book.model.dao.BookDao;
import com.wp.workpartner.book.model.vo.Book;

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
	public ArrayList selectBookByDate(String meetDate) {
		return null;
	}

	@Override
	public ArrayList selectBookByRoom(String bkNo) {
		return null;
	}

	@Override
	public int updateBook(Book b) {
		return 0;
	}

	@Override
	public int deleteBook(Book b) {
		return 0;
	}

}
