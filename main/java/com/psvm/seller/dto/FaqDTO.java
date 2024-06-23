package com.psvm.seller.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class FaqDTO {
	private int faqNo;
	private int userNo;
	private String inquiryTitle;
	private String inquiryContents;
	private Date inquiryDate;
	private int pno;
	private int pdNo;
	private int inquiryStatus;
	
	private int answerNo;
	private Date answerDate;
	private String answerContents;
	
	private String nickName;
	private String pdTitle;
}
