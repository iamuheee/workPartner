package com.wp.workpartner.project.model.vo;

import java.util.ArrayList;

import com.wp.workpartner.common.model.vo.Comment;
import com.wp.workpartner.common.model.vo.File;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ProjectBoard {
	
	private String pboardNo;
	private String projNo;
	private String pboardWriter;
	private String writerName;
	private String refType;
	private String title;
	private String content;
	private String createDate;
	private String modifyDate;
	private String status;
	
	private String bmkDate;
	
	private ProjectDuty pduty;
	private File file;
	private ArrayList<Comment> comment;

	private ProjectMeeting pmeet; 
	
	private String meetingDate;
	private String startTime;
	private String endTime;
	private String meetingPlace;
	private String incharge;
	private String inchargeName;
	private String calendarYN;
	
	
	private ArrayList<ProjectMeetingMember> pmeetMem;
	
	private String empNo; // , 로 연이은 회의 참석자 사번 
	private String empName; // , 로 연이은 회의 참석자 이름

}
