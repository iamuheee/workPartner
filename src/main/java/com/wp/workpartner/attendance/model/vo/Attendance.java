package com.wp.workpartner.attendance.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Attendance {

	private String attNo;
	private String empNo;
	private String attDate;
	private String attFcmt;
	private String attFqt; 	
	private String attCmt;	
	private String attQt;
	private String attTime;
	private String attWorkhours;
	private String status;
	private String hollyday;
	
}
