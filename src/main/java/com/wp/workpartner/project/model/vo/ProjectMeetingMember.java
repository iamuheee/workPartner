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
	private String pboardNo;
	private String memNo;
	private String memName;
	private String attendanceYN;

}
