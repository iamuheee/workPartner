package com.wp.workpartner.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.notice.model.vo.Notice;

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
}
