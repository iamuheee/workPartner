package com.wp.workpartner.project.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Calendar {
	private String title;
	private String content;
	private String start; // 2019-09-05T12:30:00 형태
	private String end;   // 2019-09-05T15:35:00 형태
	private String color;
	


}
