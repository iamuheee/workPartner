package com.wp.workpartner.common.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.wp.workpartner.common.model.service.CommentServiceImpl;
import com.wp.workpartner.common.model.vo.Comment;
import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.common.template.FileUpload;

@Controller
public class CommentController {
	
	@Autowired
	private CommentServiceImpl cService;
	
	
	@ResponseBody
	@RequestMapping(value="select.co", produces="application/json; charset=utf-8")
	public String selectCommentList(Comment c) {
		ArrayList<Comment> clist = cService.selectCommentList(c);
		return new Gson().toJson(clist);
	}
	
	
	@ResponseBody
	@RequestMapping(value="insert.co", produces="application/html; charset=utf-8")
	public String inserComment(MultipartFile upfile, Comment c, HttpSession session) {
		
		// 첨부파일 있든 없든 무조건 TB_COMMENT에 Comment c를 INSERT 해야 함
		int result1 = cService.insertComment(c);
		
		int result2 = 1;
		if(upfile.getOriginalFilename().length() > 0) {
			// 첨부파일 있는 경우
			File f = File.uploadFile(upfile, FileUpload.saveFile(upfile, session, "resources/uploadFiles/"));
			c.setFile(f);
			result2 = cService.insertCommentFile(c);
		}
		
		if(result1 * result2 > 0) {
			// 성공
			return "성공적으로 댓글을 등록하였습니다.";
		}else {
			return "댓글 등록에 실패하였습니다.";
		}
	}
	
	@RequestMapping("delete.co")
	public String deleteComment(String dno, String cno, HttpSession session) {
		int result1 = cService.deleteComment(cno);
		int result2 = cService.deleteCommentFile(cno);
		
		if(result1 * result2 > 0) {
			session.setAttribute("alertMsg", "성공적으로 댓글을 삭제하였습니다.");
		}else {
			session.setAttribute("alertMsg", "댓글 삭제에 실패했습니다.");
		}
		return "redirect:detail.du?no=" + dno;
	}
	
	
	
}
