package com.wp.workpartner.todo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.wp.workpartner.todo.model.service.TodoServiceImpl;
import com.wp.workpartner.todo.model.vo.Todo;
import com.wp.workpartner.todo.model.vo.TodoCategory;

@Controller
public class TodoController {
	
	@Autowired
	private TodoServiceImpl tService;
	

	
	/**
	 * To do 리스트 페이지로 이동
	 * @return 투두리스트 JSP
	 */
	@RequestMapping("list.to")
	public String MoveTotodoPage(){
		return "todo/todoListView";
	}
	
	@ResponseBody
	@RequestMapping(value="todo.to", produces="application/json; charset=UTF-8")
	public String ajaxSelectTodoList(int empNo) {
		/*	1. ArrayList<TodoCategory> 조회 : (loginUser의 empNo와 일치하는 TB_TODO_CATE의 모든 레코드를 조회)
				=> 만약 empNo에 NULL이 담기면 로그인되지 않은 상태이므로 진행할 수 없음
				
		 	2. TodoCategory 객체의 필드에는 ArrayList<Todo>를 담을 수 있는 todosPeorCate 필드가 있음 
				=> 카테고리 번호가 일치하는 Todo 객체들을 ArrayList<Todo>에 각각 담기
				=> 결과적으로 각각의 TodoCategory 객체에는 카테고리 정보와 각 카테고리에 해당하는 모든 Todo객체가 담기게 됨
		
			3. ArrayList<TodoCategory>를 JSP에 돌려보내서 반복문 돌리기
		*/
		
		// 1. ArrayList<TodoCategory> 조회 + 2.todosPerCate 필드에 ArrayList<Todo> 담기 + 3.JSP에 반환 한번에
		ArrayList<TodoCategory> tclist = tService.selectTodoCategoryList(empNo);
			return new Gson().toJson(tclist);
	}
	
	
	@ResponseBody
	@RequestMapping(value="delete.to", produces="application/text; charset=utf-8")
	public String ajaxDeleteTodo(int todoNo) {
		System.out.println(todoNo);
		if( tService.ajaxDeleteTodo(todoNo) > 0 ) {
			return "해당 투두를 성공적으로 삭제하였습니다!";
		}else {
			return "해당 투두 삭제에 실패하였습니다.";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="insert.to", produces="application/text; charset=utf-8")
	public String insertTodo(Todo t) {
		if(tService.insertTodo(t) > 0) {
			return "새로운 투두를 성공적으로 등록하였습니다!";
		}else {
			return "새로운 투두 등록에 실패하였습니다.";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="newcate.to", produces="application/text; charset=utf-8")
	public String insertCate(TodoCategory tc) {
		if( tService.insertCate(tc) > 0 ) {
			return "새로운 카테고리를 성공적으로 등록하였습니다!";
		}else {
			return "새로운 카테고리 등록에 실패하였습니다.";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="delCate.to", produces="application/text; charset=utf-8")
	public String deleteCate(String categoryNo) {
		if( tService.deleteCate(categoryNo) > 0) {
			return "카테고리를 성공적으로 삭제하였습니다!";
		}else {
			return "카테고리 삭제에 실패하였습니다.";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="done.to", produces="application/html; charset=utf-8")
	public String ajaxDoneTodo(Todo t) {
		if( tService.ajaxDoneTodo(t) > 0) {
			return "성공적으로 반영되었습니다.";
		}else {
			return "실패했습니다.";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="ltlist.to", produces="application/json; charset=utf-8")
	public String ajaxLatestTodo(Todo t) {
		ArrayList<Todo> tlist = tService.ajaxLatestTodo(t.getEmpNo());
			return new Gson().toJson(tlist);
	}


	
}
