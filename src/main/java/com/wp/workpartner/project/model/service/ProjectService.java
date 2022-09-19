package com.wp.workpartner.project.model.service;

import org.springframework.stereotype.Service;

import com.wp.workpartner.project.model.vo.Project;

@Service
public interface ProjectService {
	
	int insertProject(Project p);


}
