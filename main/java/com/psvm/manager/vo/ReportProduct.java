package com.psvm.manager.vo;

import java.sql.Date;

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
public class ReportProduct {
	private int pdNo;
	private String sellerUserId;
	private String storeName;
	private String pdTitle;
	private String pdContent;
	private int pdPrice;
	private Date pdEnrollDate;
	private String pdCategory;
	private String reporterUserId;
	private String inquiryTitle;
	private String inquiryContent;
	private String inquiryDate;
}
