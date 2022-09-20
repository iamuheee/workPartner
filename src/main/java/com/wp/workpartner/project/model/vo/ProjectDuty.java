package com.wp.workpartner.project.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ProjectDuty {
	private String pboardNo;
	private String progress;
	private String startDate;
	private String endDate;
	private String incharge;
	private String inchargeName;
	private String calendarYN;
}
