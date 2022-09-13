package com.wp.workpartner.todo.model.vo;

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
public class Todo {
	private String todoNo;
	private String empNo;
	private String categoryNo;
	private String categoryTitle;
	private String todoContent;
	private String doneYN;
	private String todoDate;
	private String color;

}
