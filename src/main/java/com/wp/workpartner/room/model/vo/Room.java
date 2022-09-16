package com.wp.workpartner.room.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString

public class Room {

	private String rmNo;
	private String eqNo;
	private String rmName;
	private String rmStatus;
	private String rmEnroll;
	private String rmModify;
	private String rmPerson;
	
}
