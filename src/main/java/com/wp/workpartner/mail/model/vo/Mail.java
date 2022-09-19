package com.wp.workpartner.mail.model.vo;

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
public class Mail {
	 private String mailNo;
	 private String mailTitle;
	 private String mailContent;
	 private String mailCreateDate;
	 private String mailImportant; 
	 private String mailSecurity;
	 private String mailFile;
	 private String mailRecipient;
	 private String mailCC;
	 private String mailSender;
	 private String mailSenderName;
	 
	 private String mailEmail;
	 private String mailStatus;
	 private String mailCategory;
	 private String mailRead;
	 private String mailStar;
	 
	 // 메일에 여러개의 파일을 담아서 보내기 위한 필드 추가 (메일 전달하기)
	 private ArrayList<File> fileList;
}
