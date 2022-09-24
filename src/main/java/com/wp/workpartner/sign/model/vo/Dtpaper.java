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
public class Dtpaper {
	private int dpNo;
	private String empNo;
	private String dpTitle;
	private String dpCreate;
	private String dpModify;
	private String dpStatus;
	private String dpFinal;
	private String dpCategory;
	private String dpOrigin;
	private String dpChange;
	private String empName;
	
//	내가 쓴 기안서 리스트 조회용
	private String signEmpName;
	private String lastSigndate;
	
//	타부서 결재함
	private String signEmpDept;
	private String signDeptName;
	
	
	private ArrayList<Sign> signList;
	//private ArrayList<Vacation> vacationList;
	//private ArrayList<Otwork> otworkList;
	//private ArrayList<ReSign> reSignList;
	//private ArrayList<Cooperation> cooperationList;
	
}
