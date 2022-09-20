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
}
