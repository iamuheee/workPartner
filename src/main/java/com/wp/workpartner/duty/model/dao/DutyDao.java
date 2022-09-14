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
	
	
	/**
	 * TB_DUTY에 INSERT문 실행
	 * @param sqlSession
	 * @param Duty d
	 * @return DDL 성공한 행의 개수
	 */
	public int insertDuty(SqlSessionTemplate sqlSession, Duty d) {
		return sqlSession.insert("dutyMapper.insertDuty", d);
	}
	
	public ArrayList<DutyCharge> selectDutyCharge(SqlSessionTemplate sqlSession, String empIC){
		return (ArrayList)sqlSession.selectList("dutyMapper.selectDutyCharge", "("+empIC+")");
	}
	
	public int insertDutyCharge(SqlSessionTemplate sqlSession, DutyCharge dc) {
		return sqlSession.insert("dutyMapper.insertDutyCharge", dc);
	}
	
	
	/**
	 * TB_FILE에 INSERT문 실행
	 * @param sqlSession
	 * @param f
	 * @return DDL 성공한 행의 개수
	 */
	public int insertFile(SqlSessionTemplate sqlSession, File f) {
		return sqlSession.insert("dutyMapper.insertFile", f);
	}
	
	/**
	 * 유효한 업무 게시글의 전체 개수 조회
	 * 페이징 처리 때 필요
	 * @param sqlSession
	 * @return
	 */
	public int selectDutyListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("dutyMapper.selectDutyListCount");
	}
	
	
	/**
	 * 해당 페이지의 업무 리스트 조회에 필요한 업무 리스트 조회
	 * @param sqlSession
	 * @param pi
	 * @param empNo
	 * @return ArrayList<Duty>
	 */
	public ArrayList<Duty> selectDutyList(SqlSessionTemplate sqlSession, PageInfo pi, String empNo){
		return (ArrayList)sqlSession.selectList("dutyMapper.selectDutyList", empNo, new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit()) );
	}
	
	
	/**
	 * 해당 페이지의 업무 리스트 조회에 필요한 담당자 리스트 조회
	 * @param sqlSession
	 * @param pi
	 * @param empNo
	 * @return
	 */
	public ArrayList<DutyCharge> selectDutyChargeList(SqlSessionTemplate sqlSession, PageInfo pi, String empNo){
		return (ArrayList)sqlSession.selectList("dutyMapper.selectDutyChargeList", empNo, new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit()) );
	}
	
	
	/**
	 * 업무 게시글 상세조회를 위한 업무 한 행 조회
	 * @param sqlSession
	 * @param dutyNo
	 * @return Duty
	 */
	public Duty selectDuty(SqlSessionTemplate sqlSession, int dutyNo) {
		return sqlSession.selectOne("dutyMapper.selectDuty", dutyNo);
	}

}
