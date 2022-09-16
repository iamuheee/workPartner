package com.wp.workpartner.mail.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.mail.model.vo.Signature;

@Repository
public class MailDao {
	
	public ArrayList<Signature> selectSigList(SqlSessionTemplate sqlSession, String empNo){
		return (ArrayList)sqlSession.selectList("mailMapper", empNo);
	}
}
