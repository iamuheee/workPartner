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
public class Sign {
	private int dpNo;
	private String empNo;
	private int siSeq;
	private String siAppdate;
	private String siStatus;
	private int siAsign;
	private String siRep;
}
