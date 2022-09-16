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
public class ReSign {
	private int dpNo;
	private String resMem;
	private String resRedate;
	private String resAccount;
	private String resBank;
	private String resContent;
	
}
