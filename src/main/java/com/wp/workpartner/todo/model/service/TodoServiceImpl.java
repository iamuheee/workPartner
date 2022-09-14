package com.wp.workpartner.todo.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.todo.model.dao.TodoDao;
import com.wp.workpartner.todo.model.vo.Todo;
import com.wp.workpartner.todo.model.vo.TodoCategory;

@Service
public class TodoServiceImpl implements TodoService {


	@Autowired
	private TodoDao tDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public ArrayList<TodoCategory> selectTodoCategoryList(int empNo) {
		// clist : 해당하는 사원의 모든 TodoCategory 객체가 담긴 ArrayList 
		ArrayList<TodoCategory> tclist =  tDao.selectTodoCategoryList(sqlSession, empNo);
		
		// clist의 todosPerCate 필드에 ArrayList<Todo> 추가
		for(TodoCategory tc : tclist) {
			tc.setTodosPerCate( tDao.selectTodoList(sqlSession, tc.getCategoryNo()));
		}
		return tclist;
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
	public int insertCate(TodoCategory tc) {
		return tDao.insertCate(sqlSession, tc);
	}
	
}
