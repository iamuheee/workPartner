package com.wp.workpartner.project.model.service;

import java.util.ArrayList;

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

	// =================================================================================
	
	
	@Override
	public int insertProject(Project p) {
		return pDao.insertProject(sqlSession, p);
	}

	
	@Override
	public ArrayList<Project> selectProjectList(String empNo) {
		ArrayList<Project> plist = pDao.selectProjectList(sqlSession, empNo);
		for(Project p : plist) {
			p.setProjMember( pDao.selectProjectMember(sqlSession, p) );
		}
		return plist;
	}

	
	@Override
	public int validateMember(Project p) {
		return pDao.validateMember(sqlSession, p);
	}


	@Override
	public Project selectProject(String projNo) {
		Project p = pDao.selectProject(sqlSession, projNo);
		p.setProjMember( pDao.selectProjectMember(sqlSession, p) );
		return p;
	}


	@Override
	public int updateProject(Project p) {
		return pDao.updateProject(sqlSession, p);
	}


	@Override
	public int deleteProject(String projNo) {
		return pDao.deleteProject(sqlSession, projNo);
	}
	
	
	
	
	
	

}
