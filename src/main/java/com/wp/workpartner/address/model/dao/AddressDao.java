package com.wp.workpartner.address.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.address.model.vo.Department;
import com.wp.workpartner.address.model.vo.MyAddress;
import com.wp.workpartner.address.model.vo.MyGroup;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.employee.model.vo.Employee;

@Repository
public class AddressDao {
	
	public ArrayList<Department> selectDepList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("addressMapper.selectDepList");
	}
	
	public ArrayList<MyGroup> selectGpList(SqlSessionTemplate sqlSession, String empNo){
		return (ArrayList)sqlSession.selectList("addressMapper.selectGpList", empNo);
	}
	
	public ArrayList<Employee> selectEmpAdList(SqlSessionTemplate sqlSession, int depCd, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit; // 몇개 건너뛰고 조회할지
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("addressMapper.selectEmpAdList", depCd, rowBounds);
	}
	
	public int selectEmpAdListCount(SqlSessionTemplate sqlSession, int depCd) {
		return sqlSession.selectOne("addressMapper.selectEmpAdListCount", depCd);
	}
	
	public int selectMyAddCount(SqlSessionTemplate sqlSession, int groupNo) {
		return sqlSession.selectOne("addressMapper.selectMyAddCount", groupNo);
	}
	
	public ArrayList<MyAddress> selectMyAddList(SqlSessionTemplate sqlSession, int groupNo, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("addressMapper.selectMyAddList", groupNo, rowBounds);
	}
	
	public int selectStarAdCount(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("addressMapper.selectStarAdCount", empNo);		
	}
	
	public ArrayList<MyAddress> selectStarList(SqlSessionTemplate sqlSession, String empNo, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("addressMapper.selectStarList", empNo, rowBounds);
	}
	
	public ArrayList<Employee> selectDetailEmp(SqlSessionTemplate sqlSession, String empNo){
		return (ArrayList)sqlSession.selectList("addressMapper.selectDetailEmp", empNo);
	}
}
