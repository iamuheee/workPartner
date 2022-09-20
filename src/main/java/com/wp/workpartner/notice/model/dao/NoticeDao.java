package com.wp.workpartner.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.employee.model.vo.Employee;

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
}
