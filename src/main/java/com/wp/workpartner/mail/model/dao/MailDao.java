package com.wp.workpartner.mail.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.mail.model.vo.Mail;
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
	
	public int updateSigUseManage(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("mailMapper.updateSigUseManage", e);
	}
	
	public int updateSigBasicManage(SqlSessionTemplate sqlSession, Signature s) {
		return sqlSession.update("mailMapper.updateSigBasicManage", s);
	}
	
	public int updateSigBasicNo(SqlSessionTemplate sqlSession, Signature s) {
		return sqlSession.update("mailMapper.updateSigBasicNo", s);
	}
	
	public int insertMail(SqlSessionTemplate sqlSession, Mail mail) {
		return sqlSession.insert("mailMapper.insertMail", mail);
	}
	
	public int insertMailStatusRev(SqlSessionTemplate sqlSession, String[] mailRecipients) {
		
		int result = 0;
		
		for(String mailEmail : mailRecipients) {
			result = sqlSession.insert("mailMapper.insertMailStatusRev", mailEmail);
		}		
		return result;			
	}
	
	public int insertMailStatusCC(SqlSessionTemplate sqlSession, String[] mailCCs) {
		
		int result = 0;
		
		for(String mailEmail : mailCCs) {
			result = sqlSession.insert("mailMapper.insertMailStatusCC", mailEmail);
		}		
		return result;			
	}	
	public int insertMailStatusSen(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("mailMapper.insertMailStatusSen");
	}
	
	public int insertMailFile(SqlSessionTemplate sqlSession, File file) {
		return sqlSession.insert("mailMapper.insertMailFile", file);
	}
	
}
