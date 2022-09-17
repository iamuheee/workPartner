package com.wp.workpartner.sign.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.sign.model.vo.Dtpaper;
import com.wp.workpartner.sign.model.vo.Otwork;
import com.wp.workpartner.sign.model.vo.Sign;
import com.wp.workpartner.sign.model.vo.Vacation;

@Repository
public class SignDao {
	public int insertDtpaper(SqlSessionTemplate sqlSession, Dtpaper d) {
		return sqlSession.insert("signMapper.insertDtpaper", d);
	}
	public int insertVacation(SqlSessionTemplate sqlSession, Vacation v) {
		return sqlSession.insert("signMapper.insertVacation", v);
	}
	public int insertSign(SqlSessionTemplate sqlSession, ArrayList<Sign> signList) {
		
		int result = 0;
		for(Sign s : signList) {
			result += sqlSession.insert("signMapper.insertSign", s);
		}
		
		return result;
		//return sqlSession.insert("signMapper.insertSign", signList);
	}
	public int insertOtwork(SqlSessionTemplate sqlSession, Otwork o) {
		return sqlSession.insert("signMapper.insertOtwork", o);
	}
}
