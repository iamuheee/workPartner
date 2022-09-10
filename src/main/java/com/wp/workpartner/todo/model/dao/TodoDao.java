package com.wp.workpartner.todo.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.wp.workpartner.todo.model.vo.Todo;

public class TodoDao {
	
	public ArrayList<Todo> selectTodoList(SqlSessionTemplate sqlSession, int empNo){
		return (ArrayList)sqlSession.selectList("todoMapper.selectTodoList", empNo);
	}
	
}
