package com.wp.workpartner.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.notice.model.dao.NoticeDao;
import com.wp.workpartner.notice.model.vo.Notice;
import com.wp.workpartner.notice.model.vo.NoticeComment;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao ntDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 추가 관리자인 사원들 조회
	@Override
	public ArrayList<Employee> selectNtAdminY() {
		return ntDao.selectNtAdminY(sqlSession);
	}
	
	// 관리자 => 일반사원
	@Override
	public int upDateAdminN(String empNo) {
		return ntDao.upDateAdminN(sqlSession, empNo);
	}

	// => 관리자
	@Override
	public int updateAdminY(HashMap<String, Object> map) {
		return ntDao.updateAdminY(sqlSession, map);
	}

	// 상단공지사항 갯수
	@Override
	public int selectTopNoticeCount(HashMap<String, Object> map) {
		return ntDao.selectTopNoticeCount(sqlSession, map);
	}

	// 상단공지사항 조회
	@Override
	public ArrayList<Notice> selectTopNotice(HashMap<String, Object> map, PageInfo pi) {
		return ntDao.selectTopNotice(sqlSession, map, pi);
	}

	// 일반 공지사항 갯수 조회
	@Override
	public int selectNormalNoticeCount(HashMap<String, Object> map) {
		return ntDao.selectNormalNoticeCount(sqlSession, map);
	}

	// 일반공지사항 list 조회
	@Override
	public ArrayList<Notice> selectNormalNotice(HashMap<String, Object> map, PageInfo pi) {
		return ntDao.selectNormalNotice(sqlSession, map, pi);
	}

	// summernote 이미지 업로드
	@Override
	public int insertSummernote(File file) {
		return ntDao.insertSummernote(sqlSession, file);
	}
	
	// 공지사항 등록
	@Override
	public int insertNotice(Notice notice) {
		return ntDao.insertNotice(sqlSession, notice);
	}
	
	// 공지사항 등록 > 파일
	@Override
	public int insertFileNotice(File file) {
		return ntDao.insertFileNotice(sqlSession, file);
	}

	// 공지사항 조회수 증가 
	@Override
	public int increaseCount(String noticeNo) {
		return ntDao.increaseCount(sqlSession, noticeNo);
	}

	// 공지사항 상세보기
	@Override
	public Notice selectDetailNotice(String noticeNo) {
		return ntDao.selectDetailNotice(sqlSession, noticeNo);
	}

	// 파일 가져오기
	@Override
	public ArrayList<File> selectFileDetail(String noticeNo) {
		return ntDao.selectFileDetail(sqlSession, noticeNo);
	}

	// 공지사항 삭제
	@Override
	public int deleteNotice(String noticeNo) {
		return ntDao.deleteNotice(sqlSession, noticeNo);
	}

	// 공지사항 내용 notice 수정
	@Override
	public int updateNotice(Notice notice) {
		return ntDao.updateNotice(sqlSession, notice);
	}
	
	// 기존의 파일 N 
	@Override
	public int updateFileN(String noticeNo) {
		return ntDao.updateFileN(sqlSession, noticeNo);
	}

	// 사용자가 선택한 기존파일은 Y
	@Override
	public int updateFileY(File file) {
		return ntDao.updateFileY(sqlSession, file);
	}
	
	// 공지사항 수정 > 새로운 파일 insert
	@Override
	public int updateFileNotice(File file) {
		return ntDao.updateFileNotice(sqlSession, file);
	}

	// 공지사항 댓글 조회
	@Override
	public ArrayList<NoticeComment> selectReplyList(String noticeNo) {
		return ntDao.selectReplyList(sqlSession, noticeNo);
	}

	// 공지사항 원댓글 등록
	@Override
	public int InsertCommentParent(NoticeComment nComm) {
		return ntDao.InsertCommentParent(sqlSession, nComm);
	}

	// 댓글 수정
	@Override
	public int updateComment(NoticeComment nComm) {
		return ntDao.updateComment(sqlSession, nComm);
	}

	// 댓글삭제
	@Override
	public int deleteComment(String comNo) {
		return ntDao.deleteComment(sqlSession, comNo);
	}

	@Override
	public ArrayList<Notice> selectTopMainList() {
		return ntDao.selectTopMainList(sqlSession);
	}
	
	
	

	
	
	
	
	
	
	
	
}
