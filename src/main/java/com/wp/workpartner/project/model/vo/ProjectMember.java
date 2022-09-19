package com.wp.workpartner.project.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ProjectMember {
	private String projNo;
	private String memNo;
	private String memName;
	private String memRole;

}
