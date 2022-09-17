package com.wp.workpartner.common.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.common.model.dao.CommentDao;
import com.wp.workpartner.common.model.vo.Comment;


@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired 
	private CommentDao cDao;

	

	
	@Override
	public ArrayList<Comment> selectCommentList(Comment c) {
		ArrayList<Comment> clist = cDao.selectCommentList(sqlSession, c);
		for(Comment co : clist) {
			co.setFile(cDao.selectCommentFile(sqlSession, co));
		}
		return clist;
	}
	
	@Override
	public int insertComment(Comment c) {
		return cDao.insertComment(sqlSession, c);
	}

	@Override
	public int insertCommentFile(Comment c) {
		return cDao.insertCommentFile(sqlSession, c);
	}

	@Override
	public int deleteComment(String comNo) {
		return cDao.deleteComment(sqlSession, comNo);
	}

	@Override
	public int deleteCommentFile(String comNo) {
		if( cDao.selectComment(sqlSession, comNo).getFile() != null) {
			return cDao.deleteCommentFile(sqlSession, comNo);
		}else {
			return 1;
		}
		
	}




}
