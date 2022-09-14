package com.wp.workpartner.todo.model.service;

import java.util.ArrayList;

import com.wp.workpartner.todo.model.vo.Todo;
import com.wp.workpartner.todo.model.vo.TodoCategory;

public interface TodoService {
	
	
	// TO DO 리스트를 조회
	ArrayList<TodoCategory> selectTodoCategoryList(int empNo);
	
	// DONE_YN 컬럼에 변화
	int ajaxDoneTodo(Todo t);
	
	// TO DO 삭제
	int ajaxDeleteTodo(int todoNo);
	
	int insertTodo(Todo t);
	
	// TO DO 카테고리 추가
	int insertCate(TodoCategory tc);
	
	// TO DO 카테고리 삭제
	int deleteCate(String categoryNo);

}
