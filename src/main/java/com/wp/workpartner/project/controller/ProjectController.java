package com.wp.workpartner.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.project.model.service.ProjectService;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService pService;
	
	
	@RequestMapping("main.pr")
	public ModelAndView selectProjectMain(ModelAndView mv, HttpSession session) {
		// 해당 사원에 맞는 화면 정보 불러옴
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		mv.setViewName("project/projectMain");
		return mv;
	}
	
	@RequestMapping("list.pr")
	public ModelAndView selectProjectList(ModelAndView mv) {
		mv.setViewName("project/projectListView");
		return mv;
	}
	
	@RequestMapping("enroll.pr")
	public String selectProjectForm() {
		return "project/projectInsertForm";
	}
	
	@RequestMapping("manage.pr")
	public String selectProjectManage() {
		return "project/projectManage";
	}
	
}
