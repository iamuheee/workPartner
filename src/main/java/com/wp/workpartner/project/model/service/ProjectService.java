package com.wp.workpartner.project.model.service;

import java.util.ArrayList;

import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.project.model.vo.Project;
import com.wp.workpartner.project.model.vo.ProjectBoard;
import com.wp.workpartner.project.model.vo.ProjectMember;

public interface ProjectService {
	
	int insertProject(Project p);
	
	ArrayList<Project> selectProjectList(String empNo);
	
	int validateMember(Project p);
	
	Project selectProject(String projNo);
	
	int updateProject(Project p);
	
	int deleteProject(String projNo);
	
	ArrayList<ProjectMember> selectMemberList(Project p);
	
	ArrayList<ProjectMember> selectMemberList(ProjectMember m);
	
	ArrayList<Employee> selectPopupList();
	
	int updateMember(ProjectMember m);
	
	int deleteMember(ProjectMember m);
	
	int insertMember(ProjectMember m);
	
	ArrayList<ProjectBoard> selectProjectBoardList(Project p);
	
	
}
