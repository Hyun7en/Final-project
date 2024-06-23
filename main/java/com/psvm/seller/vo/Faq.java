package com.psvm.seller.vo;

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
public class Faq {
	private int faqNo;
	private int userNo;
	private String inquiryTitle;
	private String inquiryContents;
	private Date inquiryDate;
	private int pdNo;
	private int pno;
	private int inquiryStatus;
}
