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
	
	/**
	 * To do 리스트 조회
	 * @param mv
	 * @param empNo
	 * @return ModelAndView (tlists:카테고리별로 분류된 리스트, tlist: 각 카테고리의 To do 리스트)
	 */
	@RequestMapping("list.to")
	public ModelAndView selectTodoList(ModelAndView mv, int empNo){
		ArrayList<Todo> list = tService.selectTodoList(empNo);
		
		// tlist  : 각 카테고리 안의 To do 항목들이 들어간 ArrayList
		// tlists : 카테고리별로 분류된 ArrayList (각각의 tlist들이 리스트의 각 요소로 들어감)
		ArrayList<Todo> tlist = new ArrayList<Todo>();
		ArrayList< ArrayList<Todo> > tlists = new ArrayList< ArrayList<Todo> >();
		
		// 문제1) 마지막 인덱스는 i+1번 인덱스가 없어서 NullPointerException이 뜰텐데 어쩌지??
		// 			=> 마지막 인덱스 제외하고 반복문 수행
		// 문제2)list.size() == 1이면 오류 뜰텐데 어쩌지??
		//			=> list.size() == 1인 경우, 1이 아닌 경우로 조건 나누기
		
		if( list.size() != 1 ) {
			tlists.add(tlist);
		}else {
			for(int i=0; i<list.size() - 1; i++) {
				if( list.get(i).getCategoryNo().equals( list.get(i+1).getCategoryNo() ) ) {
					tlist.add(list.get(i));
				}else {
					tlist.add(list.get(i));
					tlists.add(tlist);
					tlist.clear();
				}
			}
			// 마지막 인덱스에 대한 조건은 필요 없지 않음?
			// 이유 : 이미 마지막-1인덱스와 마지막인덱스의 일치/불일치를 따졌잖슴
			//		  경우 == : tlist.add(마지막-1인덱스), tlists에 아직 넣지 않음, tlist 초기화 안됨 => 기존 인덱스에 마지막인덱스 추가됨 
			//		  경우 != : tlist.add(마지막-1인덱스), tlists에 새 요소 추가됨, tlist 초기화됨    => 새로운 인덱스에 마지막인덱스 들어감
			tlist.add( list.get(list.size()-1) );
			tlists.add(tlist);
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
