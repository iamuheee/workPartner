package com.wp.workpartner.book.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.book.model.vo.Book;

@Repository
public class BookDao {
	
	public int insertBook(SqlSessionTemplate sqlSession, Book b) {
		return sqlSession.insert("bookMapper.insertBook", b);
	}

}
