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
public class Inquiry {
	private int inquiryNo;
	private String inquiryTitle;
	private String inquiryDate;
	//문의글 타입 추가할지 말지
}
