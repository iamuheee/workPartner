package com.wp.workpartner.mail.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.common.model.vo.PageInfo;
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
	
	// 전체메일 > listCount
	@Override
	public int selectListTotalCount(HashMap<String,Object> map) {	
		return mDao.selectListTotalCount(sqlSession, map);
	}
	
	// 전체메일 > list
	@Override
	public ArrayList<Mail> selectListTotal(HashMap<String,Object> map, PageInfo pi) {
		return mDao.selectListTotal(sqlSession, map, pi);
	}

	// 메일함 > 메일삭제(휴지통)
	@Override
	public int deleteEmailGroup(HashMap<String,Object> map) {
		return mDao.deleteEmailGroup(sqlSession, map);
	}
	
	// 메일 상세보기 > 메일 내용
	@Override
	public Mail selectMailDetail(String no) {
		return mDao.selectMailDetail(sqlSession, no);
	}

	// 메일 상세보기 > 읽음 상태로 바꾸기
	@Override
	public int mailReadUpdate(HashMap<String,Object> map) {
		return mDao.mailReadUpdate(sqlSession, map);
	}
	
	// 메일 상세보기 > 첨부파일 리스트
	@Override
	public ArrayList<File> selectFileDetail(String no) {
		return mDao.selectFileDetail(sqlSession, no);
	}
	
	// 받은 메일함 조회 갯수
	@Override
	public int selectListReceiveCount(HashMap<String,Object> map) {
		return mDao.selectListReceiveCount(sqlSession, map);
	}
	
	// 받은 메일함 조회
	@Override
	public ArrayList<Mail> selectListReceive(HashMap<String,Object> map, PageInfo pi) {
		return mDao.selectListReceive(sqlSession, map, pi);
	}
	
	// 보낸 메일함 갯수
	@Override
	public int selectListSendCount(HashMap<String,Object> map) {
		return mDao.selectListSendCount(sqlSession, map);
	}
	
	// 보낸 메일함 조회
	@Override
	public ArrayList<Mail> selectListSend(HashMap<String,Object> map, PageInfo pi) {
		return mDao.selectListSend(sqlSession, map, pi);
	}
	
	// 휴지통 갯수
	@Override
	public int selectListBinCount(HashMap<String,Object> map) {
		return mDao.selectListBinCount(sqlSession, map);
	}

	// 휴지통 조회
	@Override
	public ArrayList<Mail> selectListBin(HashMap<String,Object> map, PageInfo pi) {
		return mDao.selectListBin(sqlSession, map, pi);
	}	
	
	// 중요메일 갯수
	@Override
	public int selectListStarCount(HashMap<String,Object> map) {
		return mDao.selectListStarCount(sqlSession, map);
	}

	// 중요메일 조회
	@Override
	public ArrayList<Mail> selectListStar(HashMap<String,Object> map, PageInfo pi) {
		return mDao.selectListStar(sqlSession, map, pi);
	}
	
	// 메일 전달하기
	@Override
	public int insertForwordFile(File file) {
		return mDao.insertForwordFile(sqlSession,file);
	}
	
	// 메일 읽음표시로 바꾸기
	@Override
	public int readEmailGroup(HashMap<String, Object> map) {
		return mDao.readEmailGroup(sqlSession, map);
	}
	
	// 중요메일로 등록
	@Override
	public int starOnEmailGroup(HashMap<String, Object> map) {
		return mDao.starOnEmailGroup(sqlSession, map);
	}
	
	// 중요메일 해제
	@Override
	public int starOffEmailGroup(HashMap<String, Object> map) {
		return mDao.starOffEmailGroup(sqlSession, map);
	}

	// 휴지통 > 완전 삭제
	@Override
	public int deleteFix(HashMap<String, Object> map) {
		return mDao.deleteFix(sqlSession, map);
	}
	
	// 휴지통 > 복구
	@Override
	public int updateMailY(HashMap<String, Object> map) {
		return mDao.updateMailY(sqlSession, map);
	}	

	
	
}
