package com.wp.workpartner.address.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class MyAddress {
	 private int addressNo;
	 private String employeeNo;
	 private int groupNo;
	 private String addressName;
	 private String addressNickName;
	 private String addressTel;
	 private String addExtensionNo;
	 private String addressFax;
	 private String addressCompany;
	 private String addressDepartment;
	 private String addressPosition;
	 private String addressMemo;
	 private String addressEmail;
	 private String addressStar;
	 private String addressStatus;
}
