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
public class ApplicationProduct {
	private String userName;
	private String storeName;
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
	private int pdCount;
	private String pdOptionName;
	private int pdOptionNo;
}
