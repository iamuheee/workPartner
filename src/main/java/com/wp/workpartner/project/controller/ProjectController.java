package com.wp.workpartner.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.wp.workpartner.common.model.vo.Comment;
import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.common.template.FileUpload;
import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.project.model.service.ProjectServiceImpl;
import com.wp.workpartner.project.model.vo.Project;
import com.wp.workpartner.project.model.vo.ProjectBoard;
import com.wp.workpartner.project.model.vo.ProjectDuty;
import com.wp.workpartner.project.model.vo.ProjectMember;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectServiceImpl pService;
	
	
	@RequestMapping("main.pr")
	public ModelAndView selectProjectMain(ModelAndView mv, HttpSession session) {
		// 해당 사원에 맞는 화면 정보 불러옴
		
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		mv.addObject("plist", pService.selectProjectList(loginUser.getEmpNo()));
		System.out.println("ilist : " + pService.selectMyInvation(loginUser.getEmpNo()));
		mv.addObject("ilist", pService.selectMyInvation(loginUser.getEmpNo()));
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
		Project p = pService.selectProject(projNo);
		if(p != null) {
			p.setBlist( pService.selectProjectBoardList(p) );
			// 이제 Project p 안에는 ArrayList<ProjectMember>, ArrayList<ProjectBoard>가 담겨있음
			// ProjectBoard 안에는 게시글 종류에 따라 ProjectDuty, ProjectMeeting이 담겨있음
			mv.addObject("p", p).setViewName("project/projectDetailMain");
		}else {
			mv.addObject("errorMsg", "현재 해당 업무 페이지에 접근할 수 없습니다.")
			  .setViewName("common/errorPage");
		}
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
		ArrayList<ProjectMember> mlist = pService.selectMemberList(m);
		return new Gson().toJson( mlist );
	}
	
	
	@ResponseBody
	@RequestMapping(value="insertme.pr", produces="application/html; charset=utf-8")
	public String insertMember(ProjectMember m) {
		if( pService.insertMember(m) > 0 ) {
			return "성공적으로 멤버를 초대했습니다! 수락까지 기다려주세요.";
		}else {
			return "이미 초대했거나 멤버로 존재하는 사원입니다. 다시 해주세요.";
		}
	}
	
	
	@RequestMapping("newduty.pr")
	public String insertDutyForm(ProjectBoard pb, Model m) {
		m.addAttribute("pb", pb);
		return "project/projectDutyInsertForm";
	}
	
	
	@RequestMapping("insertd.pr")
	public String insertDuty(ProjectBoard pb, ProjectDuty pd, MultipartFile upfile, Model m, HttpSession session, RedirectAttributes redirect) {
		pb.setPduty(pd);
		int result1 = pService.insertDuty(pb);
		int result2 = 1;
		if( upfile.getOriginalFilename().length() > 0 ) {
			File f = File.uploadFile(upfile, FileUpload.saveFile(upfile, session, "resources/uploadFiles/"));
			result2 *= pService.insertFile(f);
		}
		
		if( result1 * result2 > 0) {
			session.setAttribute("alertMsg", "프로젝트 업무를 성공적으로 등록했습니다.");
			return "redirect:proom.pr?projNo=" + pb.getProjNo();
		}else {
			m.addAttribute("errorMsg", "프로젝트 업무 등록에 실패했습니다.");
			return "common/error";
		}
	}
	
	
	@RequestMapping("duty.pr")
	public ModelAndView selectDutyList(ModelAndView mv, Project p) {
		p = pService.selectProject( p.getProjNo() );
		mv.addObject("p", p).setViewName("project/projectDutyListView");
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="dlist.pr", produces="application/json; charset=utf-8")
	public String selectDutyList(Project p) {
		ArrayList<ProjectBoard> dlist = pService.selectDutyList(p);
		return new Gson().toJson(dlist);
	}
	
	
	@RequestMapping("editd.pr")
	public ModelAndView editDutyForm(ModelAndView mv, ProjectBoard pb) {
		// pboardNo가 넘어옴 -> 해당 게시글 번화의 정보 조회해서 수정할 수 있도록
		// 첨부파일 있는 게시글인지 확인하고, 있으면 첨부파일 정보도 가져와야 함
		pb = pService.selectDuty(pb);
		if(pb.getPduty() != null) {
			mv.addObject("pb", pb).setViewName("project/projectDutyUpdateForm");
		}else {
			mv.addObject("errorMsg", "수정 페이지 이동에 실패했습니다.")
			  .setViewName("common/error");
		}
		return mv;
	}
	
	
	@RequestMapping("updated.pr")
	public String updateDutyForm(HttpSession session, Model m, ProjectBoard pb, File f, ProjectDuty pd, MultipartFile upfile) {
		pb.setPduty(pd);
		int result1 = pService.updateDuty(pb);
		int result2 = 1;
		if( upfile.getOriginalFilename().length() > 0 ) {
			File newFile = File.uploadFile(upfile, FileUpload.saveFile(upfile, session, "resources/uploadFiles/"));
			newFile.setRefNo( Integer.parseInt(pb.getPboardNo()) );
			if(f.getFilePath() != null) {
				result2 *= pService.updateFile(newFile);
			}else {
				result2 *= pService.insertFileWhenUpdate(newFile);
			}
		}
		if( result1 * result2 > 0) {
			session.setAttribute("alertMsg", "프로젝트 업무를 성공적으로 수정했습니다.");
			return "redirect:duty.pr?projNo=" + pb.getProjNo();
		}else {
			m.addAttribute("errorMsg", "프로젝트 업무 수정에 실패했습니다.");
			return "common/error";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="deleted.pr", produces="application/html; charset=utf-8")
	public String deleteDuty(ProjectBoard pb) {
		int result = pService.deleteBoard(pb);
		if(result > 1) {
			return "해당 프로젝트 업무를 성공적으로 삭제했습니다.";
		}else {
			return "해당 프로젝트 업무 삭제에 실패했습니다.";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="insertc.pr", produces="application/html; charset=utf-8")
	public String insertComment(Comment c) {
		if( pService.insertComment(c) > 0) {
			return "댓글을 성공적으로 등록했습니다.";
		}else {
			return "댓글 등록에 실패했습니다.";
		}
	}
		
	
	@ResponseBody
	@RequestMapping(value="dclist.pr", produces="application/json; charset=utf-8")
	public String selectDutyCommentList(Comment c) {
		ArrayList<Comment> dclist = pService.selectCommentList(c);
		return new Gson().toJson(dclist);
	}
	
	@ResponseBody
	@RequestMapping(value="deletec.pr", produces="application/html; charset=utf-8")
	public String deleteComment(Comment c) {
		if( pService.deleteComment(c) > 0 ) {
			return "댓글을 성공적으로 삭제했습니다";
		}else {
			return "댓글 삭제에 실패했습니다.";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="validateme.pr", produces="application/html; charset=utf-8")
	public String validateInchargeMember(Project p) {
		int result = pService.validateInchargeMember(p);
		if(result > 0) {
			return "성공";
		}else {
			return "실패";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="yesno.pr", produces="application/html; charset=utf-8")
	public String answerInvitaion(ProjectMember m, String answer) {
		int result = pService.answerInvitaion(m, answer);
		if(result > 0) {
			return "성공적으로 반영되었습니다!";
		}else {
			return "초대 수락/거절에 실패했습니다.";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="wlist.pr", produces="application/json; charset=utf-8")
	public String selectWaitingMemberList(ProjectMember m) {
		ArrayList<ProjectMember> wlist = pService.selectWaitingMemberList(m);
		return new Gson().toJson(wlist);
	}
	
	@ResponseBody
	@RequestMapping(value="delwmem.pr", produces="application/html; charset=utf-8")
	public String deleteWaitingMember(ProjectMember m) {
		if( pService.deleteWaitingMember(m) > 0) {
			return "성공적으로 멤버 초대를 취소했습니다.";
		}else {
			return "멤버 초대에 실패했습니다.";
		}
	}
	
}
