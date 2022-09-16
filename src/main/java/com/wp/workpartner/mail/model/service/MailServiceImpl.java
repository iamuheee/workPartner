package com.wp.workpartner.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.mail.model.dao.MailDao;
import com.wp.workpartner.mail.model.vo.Signature;

@Service
public class MailServiceImpl implements MailService {
	
	@Autowired
	private MailDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Signature> selectSigList(String empNo) {
		return mDao.selectSigList(sqlSession, empNo);
	}
	
	
	
	
	
	
}
