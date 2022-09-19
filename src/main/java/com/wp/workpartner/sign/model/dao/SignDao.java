package com.wp.workpartner.sign.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.sign.model.vo.Cooperation;
import com.wp.workpartner.sign.model.vo.Dtpaper;
import com.wp.workpartner.sign.model.vo.Otwork;
import com.wp.workpartner.sign.model.vo.ReSign;
import com.wp.workpartner.sign.model.vo.Sign;
import com.wp.workpartner.sign.model.vo.Vacation;

@Repository
public class SignDao {
//  기안서 바디
	public int insertDtpaper(SqlSessionTemplate sqlSession, Dtpaper d) {
		return sqlSession.insert("signMapper.insertDtpaper", d);
	}
//	결재선
	public int insertVaSign(SqlSessionTemplate sqlSession, ArrayList<Sign> signList) {
		
		int result = 0;
		for(Sign s : signList) {
			result += sqlSession.insert("signMapper.insertVaSign", s);
		}
		
		return result;
	}
	public int insertOwSign(SqlSessionTemplate sqlSession, ArrayList<Sign> signList) {
		
		int result = 0;
		for(Sign s : signList) {
			result += sqlSession.insert("signMapper.insertOwSign", s);
		}
		
		return result;
	}
	public int insertReSign(SqlSessionTemplate sqlSession, ArrayList<Sign> signList) {
		
		int result = 0;
		for(Sign s : signList) {
			result += sqlSession.insert("signMapper.insertReSign", s);
		}
		
		return result;
	}
	public int insertCoSign(SqlSessionTemplate sqlSession, ArrayList<Sign> signList) {
		
		int result = 0;
		for(Sign s : signList) {
			result += sqlSession.insert("signMapper.insertCoSign", s);
		}
		
		return result;
	}
	public int saveDtpaper(SqlSessionTemplate sqlSession, Dtpaper d) {
		return sqlSession.insert("signMapper.saveDtpaper", d);
	}
//	기안서 푸터
	public int insertVacation(SqlSessionTemplate sqlSession, Vacation v) {
		return sqlSession.insert("signMapper.insertVacation", v);
	}
	public int insertOtwork(SqlSessionTemplate sqlSession, Otwork o) {
		return sqlSession.insert("signMapper.insertOtwork", o);
	}
	public int insertReSignEmp(SqlSessionTemplate sqlSession, ReSign r) {
		return sqlSession.insert("signMapper.insertReSignEmp", r);
	}
	public int insertCooperation(SqlSessionTemplate sqlSession, Cooperation c) {
		return sqlSession.insert("signMapper.insertCooperation", c);
	}
	
//	기안서 임시저장 반려됨 리스트
	public int selectListCount(SqlSessionTemplate sqlSession, String fn, String empNo) {
		HashMap<String, String> map = new HashMap();
		map.put("empNo", empNo);
		map.put("fn", fn);
		return sqlSession.selectOne("signMapper.selectListCount", map);
	}
	public ArrayList<Dtpaper> selectList(SqlSessionTemplate sqlSession,PageInfo pi,String empNo, String fn){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		HashMap<String, String> map = new HashMap();
		map.put("empNo", empNo);
		map.put("fn", fn);
		return (ArrayList)sqlSession.selectList("signMapper.selectList", map, rowBounds);
	}
//  기안서 진행중, 대기 리스트
	public int selectProgressListCount(SqlSessionTemplate sqlSession, String fn, String empNo) {
		HashMap<String, String> map = new HashMap();
		map.put("empNo", empNo);
		map.put("fn", fn);
		return sqlSession.selectOne("signMapper.selectProgressListCount", map);
	}
	public ArrayList<Dtpaper> selectProgressList(SqlSessionTemplate sqlSession,PageInfo pi,String empNo, String fn){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		HashMap<String, String> map = new HashMap();
		map.put("empNo", empNo);
		map.put("fn", fn);
		return (ArrayList)sqlSession.selectList("signMapper.selectProgressList", map, rowBounds);
	}
}
