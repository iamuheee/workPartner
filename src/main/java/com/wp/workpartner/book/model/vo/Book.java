package com.wp.workpartner.book.model.vo;

import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.room.model.vo.Room;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString

public class Book {

	private String bkNo; //
	private String empNo;//
	private String empName;
	private String rmNo; //
	private String rmName;
	private String bkPerson; //
	private String bkTitle; //
	private String bkDate; //
	private String bkStart; //
	private String bkEnd; //
	private String bkEnroll;
	private String bkModify;
	private String bkStatus;
	
	private Room room;
	private Employee employee;
}
