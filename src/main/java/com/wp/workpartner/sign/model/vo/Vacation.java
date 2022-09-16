package com.wp.workpartner.sign.model.vo;

import java.sql.Clob;

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
public class Vacation {
	private int dpNo;
	private String vaStart;
	private String vaEnd;
	private String vaCategory;
	private String vaContent;
	private int vaUseday; 
	
}
