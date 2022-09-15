package com.wp.workpartner.mail.model.vo;

import java.sql.Date;

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
	 private Date   mailCreateDate;
	 private String mailImportant; 
	 private String mailSecurity;
	 private String mailFile;
	 private String mailRecipient;
	 private String mailCC;
	 private String mailSender;
	 private String mailSenderName;
}
