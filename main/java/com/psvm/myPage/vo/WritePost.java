package com.psvm.myPage.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class WritePost {
	private String boardLevel;
	private String boardTitle;
	private String createDate;
	private int count;
	
}
