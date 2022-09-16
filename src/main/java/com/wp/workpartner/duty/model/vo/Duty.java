package com.wp.workpartner.duty.model.vo;

import java.util.ArrayList;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString

public class Duty {
	
	private int dutyNo;
	private String empNo;
	private String empName;
	private String calendarYN;
	private String importance;
	private String progress;
	private String title;
	private String content;
	private Date enrollDate;
	private String startDate;
	private String endDate;
	private String status;
	
	private ArrayList<DutyCharge> empIC;
	
}
