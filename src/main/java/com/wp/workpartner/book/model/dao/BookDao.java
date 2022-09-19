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
}
