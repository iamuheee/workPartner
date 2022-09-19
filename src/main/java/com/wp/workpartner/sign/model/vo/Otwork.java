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
public class Otwork {
	private int dpNo;
	private String otCall;
	private String otSupervisor;
	private String otStartdate;
	private String otEnddate;
	private String otCustomer;
	private String otContent;
	private String otTrans;
	private String otNote;
	private String otPlace;
}
