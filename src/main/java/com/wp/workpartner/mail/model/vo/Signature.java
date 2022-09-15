package com.wp.workpartner.mail.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Signature {
	 private String sigNo;
	 private String empNo;
	 private String sigName;
	 private String sigDepartment;
	 private String sigPosition;
	 private String sigAddress;
	 private String sigExtension;
	 private String sigTel;
	 private String sigEmail;
	 private String sigStats;
	 private String sigBasic;
}
