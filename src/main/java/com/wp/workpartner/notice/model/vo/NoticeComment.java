package com.wp.workpartner.notice.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class NoticeComment {
	 private String nCommentNo;
	 private String noticeNo;
	 private String empNo;
	 private String empId;
	 private String nCommentContent;
	 private String createDate;
	 private String modifyDate;
	 private String nCommentParentNo;
	 private String nCommentStatus;
	 
	 // level
	 private int level;
	 private String empProfile;
}
