package com.wp.workpartner.todo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String ajaxDoneTodo(Todo t) {
		if( tService.ajaxDoneTodo(t) > 0 ) {
		}
		return "";
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
			session.setAttribute("alertMsg", "할 일을 성공적으로 추가하였습니다!");
			return "redirect:list.to";
		}else {
			m.addAttribute("errorMsg", "할 일을 To do 리스트에 추가하지 못했습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("newcate.to")
	public String insertCate(Model m, HttpSession session, Todo t) {
		if( tService.insertCate(t) > 0 ) {
			session.setAttribute("alertMsg", "카테고리를 성공적으로 추가하였습니다!");
			return "redirect:list.to";
		}else {
			m.addAttribute("errorMsg", "카테고리를 추가하지 못했습니다.");
			return "common/errorPage";
		}
	}

	
}
