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
	
	
	
	@RequestMapping("update.to")
	public String ajaxDoneTodo(Todo t, Model model) {
		if( tService.ajaxDoneTodo(t) > 0 ) {
			return "redirect:list.to";
		}else {
			model.addAttribute("errorMsg", "수정에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete.to")
	public String ajaxDeleteTodo(Model m, HttpSession session, int todoNo) {
		if( tService.ajaxDeleteTodo(todoNo) > 0 ) {
			session.setAttribute("alertMsg", "할 일을 성공적으로 삭제하였습니다!");
			return "redirect:list:to";
		}else {
			m.addAttribute("errorMsg", "할 일을 삭제하지 못했습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("insert.to")
	public String insertTodo(Model m, HttpSession session, Todo t) {
		if(tService.insertTodo(t) > 0) {
			session.setAttribute("alertMsg", "성공적으로 추가하였습니다!");
			return "redirect:list.to";
		}else {
			m.addAttribute("errorMsg", "할 일을 To do 리스트에 추가하지 못했습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("newcate.to")
	public String insertCate(Model m, HttpSession session, TodoCategory tc) {
		if( tService.insertCate(tc) > 0 ) {
			session.setAttribute("alertMsg", "카테고리를 성공적으로 추가하였습니다!");
			return "redirect:list.to";
		}else {
			m.addAttribute("errorMsg", "카테고리를 추가하지 못했습니다.");
			return "common/errorPage";
		}
	}

	
}
