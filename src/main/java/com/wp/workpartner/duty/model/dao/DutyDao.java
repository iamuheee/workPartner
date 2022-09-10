package com.wp.workpartner.duty.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.duty.model.vo.Duty;
import com.wp.workpartner.duty.model.vo.DutyCharge;

@Repository
public class DutyDao {
	
	public int insertDuty(SqlSessionTemplate sqlSession, Duty d) {
		return sqlSession.insert("dutyMapper.insertDuty", d);
	}
	
	public int insertFile(SqlSessionTemplate sqlSession, File f) {
		return sqlSession.insert("dutyMapper.insertFile", f);
	}
	
	public int selectDutyListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("dutyMapper.selectDutyListCount");
	}
	
	public ArrayList<Duty> selectDutyList(SqlSessionTemplate sqlSession, PageInfo pi, String empNo){
		return (ArrayList)sqlSession.selectList("dutyMapper.selectDutyList", empNo, new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit()) );
	}
	
	public ArrayList<DutyCharge> selectDutyChargeList(SqlSessionTemplate sqlSession, PageInfo pi, String empNo){
		return (ArrayList)sqlSession.selectList("dutyMapper.selectDutyChargeList", empNo, new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit()) );
	}
	
	public Duty selectDuty(SqlSessionTemplate sqlSession, int dutyNo) {
		return sqlSession.selectOne("dutyMapper.selectDuty", dutyNo);
	}

}
