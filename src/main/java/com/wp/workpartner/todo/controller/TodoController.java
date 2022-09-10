package com.wp.workpartner.todo.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wp.workpartner.todo.model.service.TodoServiceImpl;
import com.wp.workpartner.todo.model.vo.Todo;

@Controller
public class TodoController {
	
	private TodoServiceImpl tService;
	
	@RequestMapping("list.to")
	public ModelAndView selectTodoList(ModelAndView mv, int empNo){
		ArrayList<Todo> list = tService.selectTodoList(empNo);
		
		ArrayList<Todo> tlist = new ArrayList<Todo>();
		ArrayList< ArrayList<Todo> > tlists = new ArrayList< ArrayList<Todo> >();
		
		// 마지막 인덱스는 i+1번 인덱스가 없어서 NullPointerException이 뜰텐데 어쩌지??
		// => 고민해보기 ㅡㅡ
		for(int i=0; i<list.size(); i++) {
			if( list.get(i).getCategoryNo().equals( list.get(i+1).getCategoryNo() ) ) {
				tlist.add(list.get(i));
			}else {
				tlist.add(list.get(i));
				tlists.add(tlist);
				tlist.clear();
			}
		}
		
		mv.addObject( "tlists", tlists ).setViewName("duty/todoListView");
		return mv;
	}
	
	@RequestMapping("update.to")
	public int updateTodo(Todo t) {
		return 0;
	}
	
	@RequestMapping("delete.to")
	public int deleteTodo(int todoNo) {
		return 0;
	}
	

	
}
