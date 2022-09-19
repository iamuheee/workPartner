package com.wp.workpartner.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.project.model.service.ProjectServiceImpl;
import com.wp.workpartner.project.model.vo.Project;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectServiceImpl pService;
	
	
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
	
	@RequestMapping("insert.pr")
	public String insertProject(HttpSession session, Project p) {
		p.setEmpNo( ((Employee)session.getAttribute("loginUser")).getEmpNo() );
		if( pService.insertProject(p) > 0) {
			session.setAttribute("alertMsg", "성공적으로 프로젝트를 등록했습니다.");
		}else {
			session.setAttribute("alertMsg", "프로젝트 등록에 실패했습니다.");
		}
		return "project/projectMain";
	}
	
	
	@RequestMapping("manage.pr")
	public String selectProjectManage() {
		return "project/projectManageForm";
	}
	
}
