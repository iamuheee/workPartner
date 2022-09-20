package com.wp.workpartner.project.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ProjectMeetingMember {
	private String pbardNo;
	private String empNo;
	private String empName;
	private String attendanceYN;

}
