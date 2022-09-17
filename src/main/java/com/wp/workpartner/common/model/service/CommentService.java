package com.wp.workpartner.common.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.wp.workpartner.common.model.vo.Comment;
import com.wp.workpartner.common.model.vo.File;

public interface CommentService {
	
	
	/**
	 * TB_COMMENT 테이블에 댓글 추가
	 * @param c
	 * @return
	 */
	int insertComment(Comment c);
	
	/**
	 * 댓글에 첨부파일 있는 경우,
	 * TB_FILE에도 INSERT하는 메소드
	 * @param f
	 * @return
	 */
	int insertFile(Comment c);
	
	/**
	 * TB_COMMENT 테이블에서 댓글 조회 
	 * @param c : comType, comRefBno
	 * @return
	 */
	ArrayList<Comment> selectCommentList(Comment c);

}
