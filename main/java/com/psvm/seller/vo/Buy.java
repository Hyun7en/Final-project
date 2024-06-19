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
public class Buy {
	
	private int buyNo;
	private int userNo;
	private int pdOptionNo;
	private Date buyDate;
	private int buyCount;
	private int buyMoney;
	private boolean buyStatus;
}
