package com.wp.workpartner.project.model.vo;

import java.util.ArrayList;

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
	
	private ProjectDuty pduty;
	private ProjectMeeting pmeet; 

}
