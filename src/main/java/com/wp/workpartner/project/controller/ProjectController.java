package com.wp.workpartner.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.project.model.service.ProjectServiceImpl;
import com.wp.workpartner.project.model.vo.Project;
import com.wp.workpartner.project.model.vo.ProjectMember;

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
	
	
	@RequestMapping("enroll.pr")
	public String selectProjectForm() {
		return "project/projectInsertForm";
	}
	
	
	@RequestMapping("insert.pr")
	public String insertProject(HttpSession session, Project p) {
		if( pService.insertProject(p) > 0) {
			session.setAttribute("alertMsg", "성공적으로 프로젝트를 등록했습니다.");
		}else {
			session.setAttribute("alertMsg", "프로젝트 등록에 실패했습니다.");
		}
		return "project/projectMain";
	}
	
	
	@RequestMapping("list.pr")
	public ModelAndView selectProjectList(ModelAndView mv, HttpSession session) {
		String empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		ArrayList<Project> plist = pService.selectProjectList(empNo);
		
		if(plist != null) {
			mv.addObject("plist", plist).setViewName("project/projectListView");
		}else {
			session.setAttribute("alertMsg", "참여중인 프로젝트가 아직 없습니다.");
			mv.setViewName("project/projectMain");
		}
		return mv;
	}
	
	
	@RequestMapping("proom.pr")
	public ModelAndView selectProject(ModelAndView mv, String projNo) {
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping("validate.pr")
	public String validateMember(ModelAndView mv, Project p) {
		if(pService.validateMember(p) > 0) {
			return "Y";
		}else {
			return "N";
		}
	}
	
	
	@RequestMapping("manage.pr")
	public String manageProduct(String projNo, Model m) {
		m.addAttribute("p", pService.selectProject(projNo));
		return "project/projectManageForm";
	}
	
	
	@RequestMapping("update.pr")
	public String updateProject(Project p, Model m) {
		int result = pService.updateProject(p);
		if(result > 0) {
			return "redirect:list.pr";
		}else {
			m.addAttribute("errorMsg", "프로젝트 수정에 실패했습니다.");
			return "common/error";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="delete.pr", produces="application/html; charset=utf-8")
	public String deleteProject(String projNo) {
		if(pService.deleteProject(projNo) > 0) {
			return "프로젝트를 성공적으로 삭제했습니다.";
		}else {
			return "프로젝트 삭제에 실패했습니다.";
		}
		
	}
	
	
	@RequestMapping("member.pr")
	public ModelAndView manageMember(ModelAndView mv, String projNo) {
		mv.addObject("p", pService.selectProject(projNo))
		  .setViewName("project/projectMemberList");
		return mv;
	}

	
	@ResponseBody
	@RequestMapping(value="mlist.pr", produces="application/json; charset=utf-8")
	public String selectMemberList(Project p, String projNo) {
		ArrayList<ProjectMember> mlist = pService.selectMemberList(p);
		if(mlist != null) {
			return new Gson().toJson(mlist);
		}else {
			return "실패했어....";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="updateme.pr", produces="application/html; charset=utf-8")
	public String updateMember(ProjectMember m) {
		int result = pService.updateMember(m);
		if(result > 0) {
			return "성공적으로 변경했습니다.";
		}else {
			return "변경에 실패했습니다.";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="deleteme.pr", produces="application/html; charset=utf-8")
	public String deleteMember(ProjectMember m) {
		if( pService.deleteMember(m) > 0) {
			return "성공적으로 삭제했습니다.";
		}else {
			return "멤버 삭제에 실패했습니다.";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="byrole.pr", produces="application/json; charset:utf-8")
	public String selectMemberByRole(ProjectMember m) {
		System.out.println(m);
		ArrayList<ProjectMember> mlist = pService.selectMemberList(m);
		System.out.println(mlist);
		return new Gson().toJson( mlist );
	}
	
	
}
