package com.wp.workpartner.project.model.service;

import java.util.ArrayList;

import com.wp.workpartner.common.model.vo.Comment;
import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.project.model.vo.Calendar;
import com.wp.workpartner.project.model.vo.Project;
import com.wp.workpartner.project.model.vo.ProjectBoard;
import com.wp.workpartner.project.model.vo.ProjectMeeting;
import com.wp.workpartner.project.model.vo.ProjectMeetingMember;
import com.wp.workpartner.project.model.vo.ProjectMember;

public interface ProjectService {
	
	int insertProject(Project p);
	
	ArrayList<Project> selectProjectList(String empNo);
	
	ArrayList<Project> selectDoneProjectList(String empNo);
	
	ArrayList<ProjectMember> selectMyInvation(String empNo);
	
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
	
	int insertDuty(ProjectBoard pb);
	
	int insertFile(File f);
	
	ArrayList<ProjectBoard> selectDutyList(Project p);
	
	ProjectBoard selectDuty(ProjectBoard pb);
	
	int updateDuty(ProjectBoard pb);
	
	int insertFileWhenUpdate(File f);
	
	int updateFile(File f);
	
	int deleteBoard(ProjectBoard pb);
	
	int insertComment(Comment c);
	
	ArrayList<Comment> selectCommentList(Comment c);
	
	int deleteComment(Comment c);
	
	int validateInchargeMember(Project p);
	
	int validateMeetingMember(Project p);
	
	int answerInvitaion(ProjectMember m, String answer);
	
	ArrayList<ProjectMember> selectWaitingMemberList(ProjectMember m);
	
	int deleteWaitingMember(ProjectMember m);
	
	ArrayList<ProjectBoard> selectMeetingList(Project p);
	
	int insertMeeting(ProjectBoard pb, ProjectMeeting pm);
	
	int deleteMeeting(ProjectBoard pb);
	
	int validateParticipant(ProjectMeetingMember m);
	
	int updateAttendance(ProjectMeetingMember m);
	
	ArrayList<Calendar> selectCalendarDutyList(Project p);
	
	ArrayList<Calendar> selectCalendarMeetingList(String projNo);
	
}
