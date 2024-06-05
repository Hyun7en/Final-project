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
public class Product {
	
	private int pdNo;
	private int caNo;
	private String pdCategory;
	private String pdTitle;
	private int pdPrice;
	private String pdContent;
	private Date pdEnrollDate;
	private int pdStar;
	private String pdOriginName;
	private String pdChangeName;
	private String pdStatus;
	
}
