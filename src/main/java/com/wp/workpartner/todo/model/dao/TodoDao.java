package com.wp.workpartner.todo.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.wp.workpartner.todo.model.vo.Todo;
import com.wp.workpartner.todo.model.vo.TodoCategory;

@Repository
public class TodoDao {
	
	public ArrayList<TodoCategory> selectTodoCategoryList(SqlSessionTemplate sqlSession, int empNo){
		return (ArrayList)sqlSession.selectList("todoMapper.selectTodoCateList", empNo);
	}
	
	public ArrayList<Todo> selectTodoList(SqlSessionTemplate sqlSession, String categoryNo){
		return (ArrayList)sqlSession.selectList("todoMapper.selectTodoList", categoryNo);
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
	
	public int insertCate(SqlSessionTemplate sqlSession, TodoCategory tc) {
		return sqlSession.insert("todoMapper.insertCate", tc);
	}
	
	public int deleteCate(SqlSessionTemplate sqlSession, String categoryNo) {
		return sqlSession.delete("todoMapper.deleteCate", categoryNo);
	}
	
	public int deleteTodos(SqlSessionTemplate sqlSession, String categoryNo) {
		return sqlSession.delete("todoMapper.deleteTodos", categoryNo);
	}
	
}
