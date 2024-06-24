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
public class FaqAnswer {
	private int answerNo;
	private int faqNo;
	private int userNo;
	private Date answerDate;
	private String answerContents;
}
