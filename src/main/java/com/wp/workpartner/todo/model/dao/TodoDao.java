package com.wp.workpartner.todo.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.wp.workpartner.todo.model.vo.Todo;

public class TodoDao {
	
	public ArrayList<Todo> selectTodoList(SqlSessionTemplate sqlSession, int empNo){
		return (ArrayList)sqlSession.selectList("todoMapper.selectTodoList", empNo);
	}
	
	public int ajaxDoneTodo(SqlSessionTemplate sqlSession, Todo t) {
		return sqlSession.update("todoMapper.doneTodo", t);
	}
	
	public int ajaxDeleteTodo(SqlSessionTemplate sqlSession, int todoNo) {
		return sqlSession.delete("todoMapper.deleteTodo", todoNo);
	}
	
	public int insertTodo(SqlSessionTemplate sqlSession, Todo t) {
		return sqlSession.insert("todoMapper.insertTodo", t);
	}
	
}
