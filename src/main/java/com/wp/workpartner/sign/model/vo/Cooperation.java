package com.wp.workpartner.sign.model.vo;


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
	private String cpDept;
	private String cpRequestor;
	private String cpRequestday;
	private String cpContent;
	private String cpCallDept;
}
