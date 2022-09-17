package com.wp.workpartner.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.mail.model.dao.MailDao;
import com.wp.workpartner.mail.model.vo.Mail;
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
	// 서명추가
	@Override
	public int insertSig(Signature s) {
		return mDao.insertSig(sqlSession, s);
	}
	// 서명설정 (직원테이블)
	@Override
	public int updateSigUseManage(Employee e) {
		return mDao.updateSigUseManage(sqlSession, e);
	}
	// 서명 설정 (서명테이블)
	@Override
	public int updateSigBasicManage(Signature s) {
		return mDao.updateSigBasicManage(sqlSession, s);
	}
	
	// 서명설정: 서명테이블 => sigBasic설정 > 우선 모든 서명들 basic=ns
	@Override
	public int updateSigBasicNo(Signature s) {
		return mDao.updateSigBasicNo(sqlSession, s);
	}

	// 메일쓰기 > tb_mail insert
	@Override
	public int insertMail(Mail mail) {
		return mDao.insertMail(sqlSession, mail);
	}

	@Override
	public int insertMailStatusRev(String[] mailRecipients) {
		return mDao.insertMailStatusRev(sqlSession, mailRecipients);
	}

	@Override
	public int insertMailStatusCC(String[] mailCCs) {
		return mDao.insertMailStatusCC(sqlSession, mailCCs);
	}

	@Override
	public int insertMailStatusSen() {
		return mDao.insertMailStatusSen(sqlSession);
	}

	@Override
	public int insertMailFile(File file) {
		return mDao.insertMailFile(sqlSession, file);
	}	
	
	
	
}
