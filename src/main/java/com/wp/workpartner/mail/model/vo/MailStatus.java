package com.wp.workpartner.mail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class MailStatus {
	 private String mailNo;
	 private String mailEmail;
	 private String mailStatus;
	 private String mailCategory;
	 private String mailRead;
	 private String mailStar;
}
