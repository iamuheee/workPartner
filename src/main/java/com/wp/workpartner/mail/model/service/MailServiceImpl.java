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

	@Override
	public int deleteSig(String sigNo) {
		return mDao.deleteSig(sqlSession, sigNo);
	}

	@Override
	public int updateBasic(String empNo) {
		return mDao.updateBasic(sqlSession, empNo);
	}

	@Override
	public int selectBasicCount(String empNo) {
		return mDao.selectBasicCount(sqlSession, empNo);
	}
	
	// 기본서명 조회
	@Override
	public Signature selectSigBasic(String empNo) {
		return mDao.selectSigBasic(sqlSession, empNo);
	}

	@Override
	public int insertSig(Signature s) {
		return mDao.insertSig(sqlSession, s);
	}	
	
	
	
}
