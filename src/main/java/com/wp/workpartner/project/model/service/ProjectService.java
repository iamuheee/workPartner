package com.wp.workpartner.project.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.project.model.dao.ProjectDao;

@Service
public class ProjectService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProjectDao pDao;

}
