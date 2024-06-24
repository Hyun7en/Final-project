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
public class Cart {
	private int pdNo;
	private int poNo;
	private String pdChangeName;
	private String pdTitle;
	private String pdOptionName;
	private int buyCount;
	private int buyMoney;
	private int userNo;
}
