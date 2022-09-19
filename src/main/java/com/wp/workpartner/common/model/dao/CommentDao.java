package com.wp.workpartner.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.common.model.vo.Comment;
import com.wp.workpartner.common.model.vo.File;

@Repository
public class CommentDao {
	
	
	
	public ArrayList<Comment> selectCommentList(SqlSessionTemplate sqlSession, Comment c){
		return (ArrayList)sqlSession.selectList("commentMapper.selectCommentList", c);
	}
	
	public File selectCommentFile(SqlSessionTemplate sqlSession, Comment c) {
		return sqlSession.selectOne("commentMapper.selectCommentFile", c);
	}
	
	public Comment selectComment(SqlSessionTemplate sqlSession, String comNo) {
		return sqlSession.selectOne("commentMapper.selectComment", comNo);
	}
	
	
	public int insertComment(SqlSessionTemplate sqlSession, Comment c) {
		return sqlSession.insert("commentMapper.insertComment", c);
	}
	
	public int insertCommentFile(SqlSessionTemplate sqlSession, Comment c) {
		return sqlSession.insert("commentMapper.insertFile", c);
	}
	
	public int deleteComment(SqlSessionTemplate sqlSession, String comNo) {
		return sqlSession.update("commentMapper.deleteComment", comNo);
	}
	
	public int deleteCommentFile(SqlSessionTemplate sqlSession, String comNo) {
		return sqlSession.update("commentMapper.deleteCommentFile", comNo);
	}
	

}
