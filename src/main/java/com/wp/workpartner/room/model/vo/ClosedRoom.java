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

public class ClosedRoom {
	
	private String rmNo;
	private String crDate;
	private String crStart;
	private String crEnd;
	private String crReason;

}
