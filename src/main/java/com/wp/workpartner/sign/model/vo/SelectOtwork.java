package com.wp.workpartner.sign.model.vo;

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
public class SelectOtwork {
	private int dpNo;
	private String empNo;
	private String dpTitle;
	private String dpCreate;
	private String dpModify;
	private String dpStatus;
	private String dpFinal;
	private String dpCategory;
	private String dpTemp;
	private String dpOrigin;
	private String dpChange;
	private String otCall;
	private String otSupervisor;
	private String otStartdate;
	private String otEnddate;
	private String otCustomer;
	private String otContent;
	private String otTrans;
	private String otNote;
	private ArrayList<Sign> signList;
}
