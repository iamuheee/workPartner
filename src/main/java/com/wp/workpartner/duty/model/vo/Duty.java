package com.wp.workpartner.duty.model.vo;

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
	private String calendarYN;
	private String importance;
	private String progress;
	private String title;
	private String content;
	private Date enrollDate;
	private String startDate;
	private String endDate;
	private String status;
	
	private String empIC; // 담당자의 이름을 ,로 연결한 것
	
}
