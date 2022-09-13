package com.wp.workpartner.sign.model.vo;

import java.sql.Clob;
import java.util.ArrayList;

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
public class SelectReSign {
	private int dpNo;
	private String empNo;
	private String dpTitle;
	private String dpCreate;
	private String dpModify;
	private String dpStatus;
	private String dpFinal;
	private String dpCategory;
	private String dpTemp;
	private String dpUrl;
	private String resMem;
	private String resRedate;
	private String resAccount;
	private String resBank;
	private Clob resContent;
	private ArrayList<Sign> signList;
}
