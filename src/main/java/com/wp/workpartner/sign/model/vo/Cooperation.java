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
public class Cooperation {
	private int dpNo;
	private String depRec;
	private String cpRequestor;
	private String cpRequestDay;
	private String cpContent;
}
