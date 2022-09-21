package com.wp.workpartner.notice.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.wp.workpartner.common.model.vo.File;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Notice {
	 private String noticeNo;
	 private String noticeTitle;
	 private String noticeContent;
	 private String empNo;
	 private String noticeStatus;
	 private String noticeCount;
	 private String noticeImportant;
	 private String noticeTop;
	 private String noticeCreateDate;
	 private String noticeModifyDate;
	 private String noticeFile;	 
	 private String empName;
	 
	 
	// 공지사항 수정을 위해 필드 추가
	private ArrayList<File> fileList;
}
