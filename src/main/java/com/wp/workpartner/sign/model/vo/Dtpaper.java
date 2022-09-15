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
	private String dpTemp;
	private String dpOrigin;
	private String dpChange;
	
	private ArrayList<Sign> signList;
	//private ArrayList<Vacation> vacationList;
	//private ArrayList<Otwork> otworkList;
	//private ArrayList<ReSign> reSignList;
	//private ArrayList<Cooperation> cooperationList;
	
}
