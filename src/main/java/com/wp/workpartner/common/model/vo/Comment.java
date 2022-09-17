package com.wp.workpartner.common.model.vo;


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
public class Comment {
	private String comNo;
	private String comType;
	private String comRefBno;
	private String empNo;
	private String empId;
	private String empName;
	private String comContent;
	private String comCreateDate;
	private String comModifyDate;
	private String comStatus;
	
	private File file;
}
