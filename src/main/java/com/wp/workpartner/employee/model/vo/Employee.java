package com.wp.workpartner.employee.model.vo;

import com.wp.workpartner.address.model.vo.Department;
import com.wp.workpartner.address.model.vo.Position;

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
public class Employee {
	
	private String empNo;
	private String empId;
	private String empPwd;
	private String empName;
	private String empPhone;
	private String empExtension;
	private String empEmail;
	private String empExEmail;
	private String empEnrollDate;
	private String empRetireDate;
	private String empModifyDate;
	private String empStatus;
	private String empProfile;
	private String empAccStatus;
	private String empNtAdmin;
	private String depCd;
	private String posCd;
	private String empTenure;
	private String empSigUse;
	private String empMoveDate;
	private String empHolTake;
	private String empHolUse;

}
