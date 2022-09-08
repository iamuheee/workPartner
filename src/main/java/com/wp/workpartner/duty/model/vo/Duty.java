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
	private String importnace;
	private String progress;
	private String title;
	private String content;
	private Date enrollDate;
	private String startDate;
	private String endDate;
	private String status;
	
	// TB_DUTY_CHARGE 테이블의 EMP_NO 컬럼에 들어갈 값을 넣는 배열
	private String[] icEmpNo;
	
}
