package com.wp.workpartner.project.model.service;

import java.util.ArrayList;

import com.wp.workpartner.project.model.vo.Project;

public interface ProjectService {
	
	int insertProject(Project p);
	
	ArrayList<Project> selectProjectList(String empNo);
	
	int validateMember(Project p);
	
	Project selectProject(String projNo);
	
	int updateProject(Project p);
	
	int deleteProject(String projNo);

}
