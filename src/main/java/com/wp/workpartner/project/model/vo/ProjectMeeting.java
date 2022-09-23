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
public class ProjectMeeting {
	private String pboardNo;
	private String meetingDate;
	private String startTime;
	private String endTime;
	private String meetingPlace;
	private String incharge;
	private String inchargeName;
	private String calendarYN;
	
	private String memNo;
	
}
