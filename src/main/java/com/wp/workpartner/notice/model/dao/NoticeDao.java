package com.wp.workpartner.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.notice.model.vo.Notice;
import com.wp.workpartner.notice.model.vo.NoticeComment;

@Repository
public class NoticeDao {
	
	public ArrayList<Employee> selectNtAdminY(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNtAdminY");
	}
	
	public int upDateAdminN(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.update("noticeMapper.upDateAdminN", empNo);
	}
	
	public int updateAdminY(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("noticeMapper.updateAdminY", map);
	}
	
	public int selectTopNoticeCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("noticeMapper.selectTopNoticeCount", map);
	}
	
	public ArrayList<Notice> selectTopNotice(SqlSessionTemplate sqlSession, HashMap<String, Object> map, PageInfo pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectTopNotice", map, rowBounds);
	}
	
	public int selectNormalNoticeCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("noticeMapper.selectNormalNoticeCount", map);
	}
	
	public ArrayList<Notice> selectNormalNotice(SqlSessionTemplate sqlSession, HashMap<String, Object> map, PageInfo pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNormalNotice", map, rowBounds);
	}
	
	public int insertSummernote(SqlSessionTemplate sqlSession, File file) {
		return sqlSession.insert("noticeMapper.insertSummernote", file);
	}
	
	public int insertNotice(SqlSessionTemplate sqlSession, Notice notice) {
		return sqlSession.insert("noticeMapper.insertNotice", notice);
	}
	
	public int insertFileNotice(SqlSessionTemplate sqlSession, File file) {
		return sqlSession.insert("noticeMapper.insertFileNotice", file);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, String noticeNo) {
		return sqlSession.update("noticeMapper.increaseCount", noticeNo);
	}
	
	public Notice selectDetailNotice(SqlSessionTemplate sqlSession, String noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectDetailNotice", noticeNo);
	}
	
	public ArrayList<File> selectFileDetail(SqlSessionTemplate sqlSession, String noticeNo){
		return (ArrayList)sqlSession.selectList("noticeMapper.selectFileDetail", noticeNo);
	}
	
	public int deleteNotice(SqlSessionTemplate sqlSession, String noticeNo) {
		return sqlSession.update("noticeMapper.deleteNotice", noticeNo);
	}
	
	public int updateNotice(SqlSessionTemplate sqlSession, Notice notice) {
		return sqlSession.update("noticeMapper.updateNotice", notice);
	}
	
	public int updateFileNotice(SqlSessionTemplate sqlSession, File file) {
		return sqlSession.insert("noticeMapper.updateFileNotice", file);
	}
	
	public int updateFileN(SqlSessionTemplate sqlSession, String noticeNo) {
		return sqlSession.update("noticeMapper.updateFileN", noticeNo);
	}
	
	public int updateFileY(SqlSessionTemplate sqlSession, File file) {
		return sqlSession.update("noticeMapper.updateFileY", file);
	}
	
	public ArrayList<NoticeComment> selectReplyList(SqlSessionTemplate sqlSession, String noticeNo){
		return (ArrayList)sqlSession.selectList("noticeMapper.selectReplyList", noticeNo);
	}
	
	public int InsertCommentParent(SqlSessionTemplate sqlSession, NoticeComment nComm) {
		return sqlSession.insert("noticeMapper.InsertCommentParent", nComm);
	}
	
	public int updateComment(SqlSessionTemplate sqlSession, NoticeComment nComm) {
		return sqlSession.update("noticeMapper.updateComment", nComm);
	}
	
	public int deleteComment(SqlSessionTemplate sqlSession, String comNo) {
		return sqlSession.update("noticeMapper.deleteComment", comNo);
	}
	
	public ArrayList<Notice> selectTopMainList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("noticeMapper.selectTopMainList");
	}
}
