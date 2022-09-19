package com.wp.workpartner.sign.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
}
