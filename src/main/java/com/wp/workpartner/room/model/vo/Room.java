package com.wp.workpartner.room.model.vo;

import java.util.ArrayList;
import java.util.List;

import com.wp.workpartner.common.model.vo.File;

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
	
	private File file;
	private ClosedRoom closedRoom;
	private UsingEquip usingEquip;
	
	private List<File> files;
	private List<UsingEquip> usingEquips;
	private List<Equip> equips;
	
	
}
