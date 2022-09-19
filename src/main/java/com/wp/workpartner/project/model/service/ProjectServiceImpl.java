package com.wp.workpartner.project.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.project.model.dao.ProjectDao;
import com.wp.workpartner.project.model.vo.Project;

@Service
public class ProjectServiceImpl implements ProjectService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProjectDao pDao;

	@Override
	public int insertProject(Project p) {
		return pDao.insertProject(sqlSession, p);
	}
	
	

}
