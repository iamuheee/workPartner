package com.wp.workpartner.todo.model.service;

import java.util.ArrayList;

import com.wp.workpartner.todo.model.vo.Todo;

public interface TodoService {
	
	// TO DO 리스트를 조회
	ArrayList<Todo> selectTodoList(int empNo);
	
	// TO DO CATEGORY 리스트 조회
	// ArrayList<TodoCate> selectTodoCateList(int empNo);
	
	// DONE_YN 컬럼에 변화
	int ajaxDoneTodo(Todo t);
	
	// TO DO 삭제
	int ajaxDeleteTodo(int todoNo);
	
	int insertTodo(Todo t);
	
	// TO DO 카테고리 추가
	int insertCate(Todo t);
	

}
