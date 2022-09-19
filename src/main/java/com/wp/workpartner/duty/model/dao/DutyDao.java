package com.wp.workpartner.duty.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.duty.model.vo.Duty;
import com.wp.workpartner.duty.model.vo.DutyCharge;
import com.wp.workpartner.employee.model.vo.Employee;

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
	
	public ArrayList<Employee> selectEmpICList(SqlSessionTemplate sqlSession, String empICNo){
		return (ArrayList)sqlSession.selectList("dutyMapper.selectEmpICList", empICNo);
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
	
	
	// =================================================================================
	// ============================ 업무 리스트 조회 ===================================
	
	
	/**
	 * 유효한 업무 게시글의 전체 개수 조회
	 * 페이징 처리 때 필요
	 * @param sqlSession
	 * @return
	 */
	public int selectDutyListCount(SqlSessionTemplate sqlSession, Duty d) {
		return sqlSession.selectOne("dutyMapper.selectDutyListCount", d);
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
	public ArrayList<DutyCharge> selectDutyChargeList(SqlSessionTemplate sqlSession, PageInfo pi, String dutyNo){
		return (ArrayList)sqlSession.selectList("dutyMapper.selectDutyChargeList", dutyNo, new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit()) );
	}
	
	
	
	/**
	 * 완료 업무를 제외한 업무 리스트 조회에 필요한 listCount 조회
	 * @param sqlSession
	 * @param d (empNo, dutyNo 사용)
	 * @return int (해당 empNo의 완료되지 않은 업무의 개수)
	 */
	public int selectIncompleteListCount(SqlSessionTemplate sqlSession, Duty d){
		return sqlSession.selectOne("dutyMapper.selectIncompleteListCount", d);
	}
	
	public ArrayList<Duty> selectIncompleteList(SqlSessionTemplate sqlSession, Duty d, PageInfo pi){
		return (ArrayList)sqlSession.selectList("dutyMapper.selectIncompleteList", d, new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit()) );
	}
	
	
	public ArrayList<Duty> selectMyList(SqlSessionTemplate sqlSession, PageInfo pi, Duty d) {
		return (ArrayList)sqlSession.selectList("dutyMapper.selectMyList", d, new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit()));
	}
	
	
	
	//==============================================
	
	
	
	/**
	 * 업무 게시글 상세조회를 위한 업무 한 행 조회
	 * @param sqlSession
	 * @param dutyNo
	 * @return Duty
	 */
	public Duty selectDuty(SqlSessionTemplate sqlSession, String dutyNo) {
		Duty d = sqlSession.selectOne("dutyMapper.selectDuty", dutyNo);
		if(d.getFilePath() != null) {
			d = sqlSession.selectOne("dutyMapper.selectDutyWithFile", dutyNo);
		}
		return d;
	}
	
	public ArrayList<DutyCharge> selectDutyCharge(SqlSessionTemplate sqlSession, String dutyNo){
		return (ArrayList)sqlSession.selectList("dutyMapper.selectDutyCharge", dutyNo);
	}
	
	
	
	//==============================================

	public int updateDuty(SqlSessionTemplate sqlSession, Duty d) {
		return sqlSession.update("dutyMapper.updateDuty", d);
	}

	public int deleteDutyCharge(SqlSessionTemplate sqlSession, DutyCharge d) {
		return sqlSession.delete("dutyMapper.deleteDutyCharge", d);
	}
	
	public int updateDutyCharge(SqlSessionTemplate sqlSession, DutyCharge dc) {
		return sqlSession.insert("dutyMapper.updateDutyCharge", dc);
	}
	
	
	public int updateDutyFile(SqlSessionTemplate sqlSession, File f) {
		return sqlSession.update("dutyMapper.updateDutyFile", f);
	}
	
	public int insertDutyFile(SqlSessionTemplate sqlSession, File f) {
		return sqlSession.insert("dutyMapper.insertNewFile", f);
	}
	
	// ==================================================================
	
	public int deleteDutyComment(SqlSessionTemplate sqlSession, String dutyNo) {
		return sqlSession.delete("dutyMapper.deleteDutyComment", dutyNo);
	}
	
	public int deleteDutyFile(SqlSessionTemplate sqlSession, String dutyNo) {
		return sqlSession.update("dutyMapper.deleteDutyFile", dutyNo);
	}
	
	public int deleteDuty(SqlSessionTemplate sqlSession, String dutyNo) {
		return sqlSession.update("dutyMapper.deleteDuty", dutyNo);
	}
	
}
