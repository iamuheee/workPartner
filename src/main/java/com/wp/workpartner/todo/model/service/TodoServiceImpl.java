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
		return tDao.ajaxDeleteTodo(sqlSession, todoNo);
	}
	
	@Override
	public int insertTodo(Todo t) {
		return tDao.insertTodo(sqlSession, t);
	}

	@Override
	public int insertCate(TodoCategory tc) {
		return tDao.insertCate(sqlSession, tc);
	}

	@Override
	public int deleteCate(String categoryNo) {
		if(tDao.selectTodoList(sqlSession, categoryNo).isEmpty()) {
			// 삭제하려는 카테고리에 속한 TO DO가 하나도 없는 경우
			return tDao.deleteCate(sqlSession, categoryNo);
		}else {
			// 삭제하려는 카테고리에 속한 TO DO가 한 개 이상 있는 경우
			// 단, TB_TODO_CATE의 CATE_NO은 TB_TODO의 CATEGORY_NO의 부모이므로, 자식 먼저 삭제
			return tDao.deleteTodos(sqlSession, categoryNo) * tDao.deleteCate(sqlSession, categoryNo);
		}
	}

	@Override
	public ArrayList<Todo> ajaxLatestTodo(String empNo) {
		ArrayList<Todo> list = tDao.ajaxLatestTodo(sqlSession, empNo);
		System.out.println(list);
		return list;
	}
	
	
	
	
	
	
}
