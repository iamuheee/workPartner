package com.wp.workpartner.todo.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class TodoCategory {
	private String empNo;
	private String categoryNo;
	private String categoryTitle;
	
	// 카테고리별 모든 To do를 담는 ArrayList<Todo>
	private ArrayList<Todo> todosPerCate;
}
