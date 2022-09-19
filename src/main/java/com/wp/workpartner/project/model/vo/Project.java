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
public class Project {
	
	private String projNo;
	private String projTitle;
	private String empNo; // 프로젝트 등록자
	private String importance;
	private String progress;
	private String startDate;
	private String endDate;
	private String enrollDate;
	private String status;
	
	ArrayList<ProjectMember> projMember;

}
