package com.wp.workpartner.mail.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.mail.model.vo.Signature;

@Repository
public class MailDao {
	
	public ArrayList<Signature> selectSigList(SqlSessionTemplate sqlSession, String empNo){
		return (ArrayList)sqlSession.selectList("mailMapper.selectSigList", empNo);
	}
	
	public int deleteSig(SqlSessionTemplate sqlSession, String sigNo) {
		return sqlSession.update("mailMapper.deleteSig", sigNo);
	}
	
	public Signature selectSigBasic(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("mailMapper.selectSigBasic", empNo);	
	}
	
	public int updateBasic(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.update("mailMapper.updateBasic", empNo);
	}
	
	public int selectBasicCount(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("mailMapper.selectBasicCount", empNo);
	}
	
	public int insertSig(SqlSessionTemplate sqlSession, Signature s) {
		return sqlSession.insert("mailMapper.insertSig", s);
	}
	
}
