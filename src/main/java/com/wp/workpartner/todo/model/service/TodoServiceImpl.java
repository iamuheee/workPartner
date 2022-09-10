package com.wp.workpartner.todo.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.wp.workpartner.todo.model.dao.TodoDao;
import com.wp.workpartner.todo.model.vo.Todo;

public class TodoServiceImpl implements TodoService {


	@Autowired
	private TodoDao tDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public ArrayList<Todo> selectTodoList(int empNo) {
		return tDao.selectTodoList(sqlSession, empNo);
	}

	@Override
	public int ajaxDoneTodo(Todo t) {
		return tDao.ajaxDoneTodo(sqlSession, t);
	}

	@Override
	public int ajaxDeleteTodo(int todoNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int insertTodo(Todo t) {
		return tDao.insertTodo(sqlSession, t);
	}

	@Override
	public int insertCate(Todo t) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
