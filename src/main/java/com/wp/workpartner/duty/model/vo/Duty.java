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
	
	private String dutyNo;
	private String empNo;
	private String empName;
	private String calendarYN;
	private String importance; 	// "긴급" "중요" "보통" "낮음"
	private String progress;	// "준비" "진행" "지연" "완료"
	private String title;
	private String content;
	private Date enrollDate;
	private String startDate;
	private String endDate;
	private String status;
	
	private ArrayList<DutyCharge> empIC;
	private String empICNo;
	private String empICName;
	private String value;
}
